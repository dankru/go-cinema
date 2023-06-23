package ui

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type UIAuthorizationBrowser struct {
}

func NewUIAuthorizationBrowser() *UIAuthorizationBrowser {
	return &UIAuthorizationBrowser{}
}

func (u *UIAuthorizationBrowser) GetAuthorizationPage(c *gin.Context) {
	c.HTML(http.StatusOK, "authorization.html", gin.H{})
}