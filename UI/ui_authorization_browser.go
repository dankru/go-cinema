package ui

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

type UIAuthorizationBrowser struct {
}

func NewUIAuthorizationBrowser() *UIAuthorizationBrowser {
	return &UIAuthorizationBrowser{}
}

func (u *UIAuthorizationBrowser) GetAuthorizationPage(c *gin.Context) {
	c.HTML(http.StatusOK, "authorization.html", gin.H{})
}

func (u *UIAuthorizationBrowser) GetAccountPage(c *gin.Context) {
	User, ok := c.Get("User")
	if !ok {
		logrus.Error("Failed to load userData for UI")
	}
	c.HTML(http.StatusOK, "account.html", gin.H{"user": User})
}