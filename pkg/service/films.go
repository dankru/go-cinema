package service

import (
	cinema "github.com/dankru/go-cinema"
	"github.com/dankru/go-cinema/pkg/repository"
)

type FilmService struct {
	repo repository.Film
}

func NewFilmService(repo repository.Film) *FilmService {
	return &FilmService{repo: repo}
}

func (s *FilmService) Create(film cinema.Film) (int, error) {
	return s.repo.Create(film)
}

func (s *FilmService) GetAll() ([]cinema.Film, error) {
	return s.repo.GetAll()
}

func (s *FilmService) GetById(filmId int) (cinema.Film, error) {
	return s.repo.GetById(filmId)
}
