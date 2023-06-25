package cinema

type Film struct {
	Id          int    `json:"-" db:"id"`
	Title       string `json:"title" binding:"required"`
	Description string `json:"description" binding:"required"`
}

type UpdateFilmInput struct {
	Title       *string `json:"title"`
	Description *string `json:"description"`
}
