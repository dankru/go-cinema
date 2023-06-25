package service

import (
	"github.com/dankru/go-cinema"
	"github.com/dankru/go-cinema/pkg/repository"
)

type Authorization interface {
	CreateUser(user cinema.User) (int, error)
	GenerateToken(username, password string) (string, error)
	ParseToken(token string) (int, error)
}

type Film interface {
	GetAll() ([]cinema.Film, error)
	Create(film cinema.Film) (int, error)
	GetById(filmId int) (cinema.Film, error)
	Update(filmId int, input cinema.UpdateFilmInput) (error)
	Delete(filmId int) error
}
type Service struct {
	Authorization
	Film
}

func NewService(repos *repository.Repository) *Service {
	return &Service{
		Authorization: NewAuthService(repos.Authorization),
		Film: 				 NewFilmService(repos.Film),
	}
}