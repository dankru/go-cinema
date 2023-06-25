package repository

import (
	"github.com/dankru/go-cinema"
	"github.com/jmoiron/sqlx"
)

type Authorization interface {
	CreateUser(user cinema.User) (int, error)
	GetUser(username, password string) (cinema.User, error)
	GetUserById(id int) (cinema.User, error)
}

type Film interface {
	GetAll() ([]cinema.Film, error)
	Create(film cinema.Film) (int, error)
	GetById(filmId int) (cinema.Film, error)
	Update(filmId int, input cinema.UpdateFilmInput) (error)
	Delete(filmId int) error
}

type Repository struct {
	Authorization
	Film
}

func NewRepository(db *sqlx.DB) *Repository {
	return &Repository{
		Authorization: NewAuthPostgres(db),
		Film:					 NewFilmPostgres(db),
	}
}