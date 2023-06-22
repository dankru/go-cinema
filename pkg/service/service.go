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

type Service struct {
	Authorization
}

func NewService(repos *repository.Repository) *Service {
	return &Service{
		Authorization: NewAuthService(repos.Authorization),
	}
}