package handler

import (
	"github.com/dankru/go-cinema/pkg/service"
	"github.com/gin-gonic/gin"
)

type Handler struct{
	services *service.Service
}

func NewHandler(services *service.Service) *Handler {
	return &Handler{
		services: services,
	}
}

func (h *Handler) InitRoutes() *gin.Engine {
	router := gin.New()
	
	auth := router.Group("/auth")
	{
		auth.POST("/sign-up", h.signUp)
		auth.POST("/sign-in", h.signIn)
	}

	api := router.Group("/api")
	{
		films := api.Group("/films") 
		{
				films.POST("/", h.createFilm)
				films.GET("/", h.getAllFilms)
				films.GET("/:id", h.getFilmById)
				films.PUT("/:id", h.updateFilm)
				films.DELETE("/:id", h.deleteFilm)
		}
	}
	return router
}