package handler

import (
	ui "github.com/dankru/go-cinema/UI"
	"github.com/dankru/go-cinema/pkg/service"
	"github.com/gin-gonic/contrib/static"
	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
)

type Handler struct{
	services *service.Service
	userInterface *ui.UI
}

func NewHandler(services *service.Service, userInterface *ui.UI) *Handler {
	return &Handler{
		services: services,
		userInterface: userInterface,
	}
}

func (h *Handler) InitRoutes() *gin.Engine {
	router := gin.New()
	router.Use(static.Serve("/", static.LocalFile(viper.GetString("static.assets"), false)))
	router.LoadHTMLGlob(viper.GetString("static.HTML")+"*")

	auth := router.Group("/auth")
	{
		auth.GET("/", h.userInterface.GetAuthorizationPage)
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