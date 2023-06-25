package ui

import "github.com/gin-gonic/gin"

type UI struct {
	Authorization
	Film
	Index
}
type Index interface {
	GetIndexPage(c *gin.Context)
	GetRulesPage(c *gin.Context)
}

type Authorization interface {
	GetAuthorizationPage(c *gin.Context)
	GetAccountPage(c *gin.Context)
}

type Film interface {
	GetFilmsListPage(c *gin.Context)
	GetFilmPage(c *gin.Context)
}

func NewUI() *UI {
	return &UI{
		Authorization: NewUIAuthorizationBrowser(),
		Film:				   NewUIFilmBrowser(),
		Index:				 NewUIIndexBrowser(),
	}
}