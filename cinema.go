package cinema

type Film struct {
	Id          int    `json:"-" db:"id"`
	Title       string `json:"title" binding:"required"`
	Description string `json:"description" binding:"required"`
	Image       string `json:"image" binding:"required"`
	Video       string `json:"video" binding:"required"`
}

type UpdateFilmInput struct {
	Title       *string `json:"title"`
	Description *string `json:"description"`
	Image       *string `json:"image"`
	Video       *string `json:"video"`
}
