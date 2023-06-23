package ui

import "github.com/gin-gonic/gin"

type UI struct {
	Authorization
	Films
}

type Authorization interface {
	GetAuthorizationPage(c *gin.Context)
}
type Films interface {
	GetFilmsPage(c *gin.Context)
}

func NewUI() *UI {
	return &UI{
		Authorization: NewUIAuthorizationBrowser(),

	}
}