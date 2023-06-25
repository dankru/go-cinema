package repository

import (
	"fmt"
	"strings"

	"github.com/dankru/go-cinema"
	"github.com/jmoiron/sqlx"
)

type FilmPostgres struct {
	db *sqlx.DB
}
func NewFilmPostgres(db *sqlx.DB) *FilmPostgres {
	return &FilmPostgres{db: db}
}

func (r *FilmPostgres) Create(film cinema.Film) (int, error) {
	tx, err := r.db.Begin()
	if err != nil {
		return 0, err
	}
	var id int
	createFilmQuery := fmt.Sprintf("INSERT INTO %s (title, description) VALUES ($1, $2) RETURNING id", FilmsTable)
	row := tx.QueryRow(createFilmQuery, film.Title, film.Description)
	if err := row.Scan(&id); err != nil {
		tx.Rollback()
		return 0, err
	}

	
	// createFilmContentQuery := fmt.Sprintf("INSERT INTO %s (Image, list_id) VALUES ($1, $2)", FilmContentTable)
	// _, err = tx.Exec(createFilmContentQuery, userId, id)
	// if err != nil {
	// 	tx.Rollback()
	// 	return 0, err
	// }

	return id, tx.Commit()
}

func (r *FilmPostgres) GetAll() ([]cinema.Film, error) {
	var films []cinema.Film

	query := fmt.Sprintf("SELECT id, title, description FROM %s", FilmsTable)
	err := r.db.Select(&films, query)

	return films, err
}

func (r *FilmPostgres) GetById(filmId int) (cinema.Film, error) {
	var film cinema.Film

	query := fmt.Sprintf(`SELECT id, title, description FROM %s WHERE id = $1`, FilmsTable)
	err := r.db.Get(&film, query, filmId)

	return film, err
}

func (r *FilmPostgres) Update(filmId int, input cinema.UpdateFilmInput) error {
	setValues := make([]string, 0)
	args := make([]interface{}, 0)
	argId := 1

	if input.Title != nil {
		setValues = append(setValues, fmt.Sprintf("title=$%d", argId))
		args = append(args, *input.Title)
		argId++
	}

	if input.Description != nil {
		setValues = append(setValues, fmt.Sprintf("description=$%d", argId))
		args = append(args, *input.Description)
		argId++
	}

	setQuery := strings.Join(setValues, ", ")

	query := fmt.Sprintf("UPDATE %s SET %s WHERE id = $%d",
		FilmsTable, setQuery,  argId)
	args = append(args, filmId)

	_, err := r.db.Exec(query, args...)
	return err
}

func (r *FilmPostgres) Delete(filmId int) error {
	query := fmt.Sprintf("DELETE FROM %s WHERE id=$1", FilmsTable)
	_, err := r.db.Exec(query, filmId)

	return err
}