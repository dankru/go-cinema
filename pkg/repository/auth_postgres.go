package repository

import (
	"fmt"

	"github.com/dankru/go-cinema"
	"github.com/jmoiron/sqlx"
)

type AuthPostgres struct {
	db *sqlx.DB
}

func NewAuthPostgres(db *sqlx.DB) *AuthPostgres {
	return &AuthPostgres{db: db}
}

func (r *AuthPostgres) CreateUser(user cinema.User) (int, error) {
	var id int
	query := fmt.Sprintf("INSERT INTO %s (username, password_hash, admin) values($1, $2, false) RETURNING id", usersTable)

	row :=  r.db.QueryRow(query, user.Username, user.Password)
	if err := row.Scan(&id); err != nil{
		return 0, err
	}

	return id, nil
}

func (r *AuthPostgres) GetUser(username, password string) (cinema.User, error) {
	var user cinema.User

	query := fmt.Sprintf("SELECT id FROM %s WHERE username = $1 AND password_hash = $2", usersTable)
	err := r.db.Get(&user, query, username, password)

	return user, err
}

func (r *AuthPostgres) GetUserById(id int) (cinema.User, error) {
	var user cinema.User

	query := fmt.Sprintf("SELECT username, admin FROM %s WHERE id = $1", usersTable)
	err := r.db.Get(&user, query, id)

	return user, err
}