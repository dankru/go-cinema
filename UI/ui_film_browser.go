package ui

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

type UIFilmBrowser struct {
}

func NewUIFilmBrowser() *UIFilmBrowser {
	return &UIFilmBrowser{}
}

func (u *UIFilmBrowser) GetFilmsListPage(c *gin.Context) {
	data, ok := c.Get("Data")
	if !ok {
		logrus.Error("Failed to load data for UI")
	}
	c.HTML(http.StatusOK, "filmsList.html", gin.H{"data": data})
}

func (u *UIFilmBrowser) GetFilmPage(c *gin.Context) {
	data, ok := c.Get("Data")
	if !ok {
		logrus.Error("Failed to load data for UI")
	}
	c.HTML(http.StatusOK, "film.html", gin.H{"data": data})
}