package repository

import (
	"database/sql"
	"errors"
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
	// transaction for later when rating implemented
	tx, err := r.db.Begin()
	if err != nil {
		return 0, err
	}
	var id int

	createFilmQuery := fmt.Sprintf(`INSERT INTO %s (title, description, image, video) VALUES ($1, $2, $3, $4) 
	RETURNING id`, FilmsTable)

	row := tx.QueryRow(createFilmQuery, film.Title, film.Description, film.Image, film.Video )
	if err := row.Scan(&id); err != nil {
		tx.Rollback()
		return 0, err
	}

	return id, tx.Commit()
}

func (r *FilmPostgres) GetAll() ([]cinema.Film, error) {
	var films []cinema.Film

	query := fmt.Sprintf("SELECT id, title, description, image, video FROM %s ORDER BY id desc", FilmsTable)
	err := r.db.Select(&films, query)

	return films, err
}

func (r *FilmPostgres) GetById(filmId int) (cinema.Film, error) {
	var film cinema.Film

	query := fmt.Sprintf(`SELECT id, title, description, image, video FROM %s WHERE id = $1`, FilmsTable)
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

	if input.Image != nil {
		setValues = append(setValues, fmt.Sprintf("image=$%d", argId))
		args = append(args, *input.Image)
		argId++
	}

	if input.Video != nil {
		setValues = append(setValues, fmt.Sprintf("video=$%d", argId))
		args = append(args, *input.Video)
		argId++
	}

	setQuery := strings.Join(setValues, ", ")

	updateFilmQuery := fmt.Sprintf("UPDATE %s SET %s WHERE id = $%d",	FilmsTable, setQuery,  argId)
	args = append(args, filmId)



	row, err := r.db.Exec(updateFilmQuery, args...)
	if err != nil {
		return err
	}
	count, err := CountRowsAffected(row)
	if count == 0 {
		return errors.New("no rows affected")
	}
	
	return err
}

func (r *FilmPostgres) Delete(filmId int) error {
	query := fmt.Sprintf("DELETE FROM %s WHERE id=$1", FilmsTable)
	_, err := r.db.Exec(query, filmId)

	return err
}

func CountRowsAffected(row sql.Result) (int, error){
	affectedRowsCount, err := row.RowsAffected()
	if err != nil {
		return 0, err
	}
	return int(affectedRowsCount), err
}