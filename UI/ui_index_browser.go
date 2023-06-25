package ui

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

type UIIndexBrowser struct {
}

func NewUIIndexBrowser() *UIIndexBrowser {
	return &UIIndexBrowser{}
}

func (u *UIIndexBrowser) GetIndexPage(c *gin.Context) {
	data, ok := c.Get("Data")
	if !ok {
		logrus.Error("Failed to load data for UI")
	}
	c.HTML(http.StatusOK, "index.html", gin.H{"data": data})
}

func (u *UIIndexBrowser) GetRulesPage(c *gin.Context) {
	c.HTML(http.StatusOK, "rules.html", gin.H{})
}
