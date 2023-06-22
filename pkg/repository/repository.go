package repository

import (
	"github.com/dankru/go-cinema"
	"github.com/jmoiron/sqlx"
)

type Authorization interface {
	CreateUser(user cinema.User) (int, error)
	GetUser(username, password string) (cinema.User, error)
}

type Repository struct {
	Authorization
}

func NewRepository(db *sqlx.DB) *Repository {
	return &Repository{
		Authorization: NewAuthPostgres(db),
	}
}