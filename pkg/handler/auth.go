package handler

import (
	"github.com/gin-gonic/gin"
)

func (h *Handler) signUp(c *gin.Context) {
}

type signInInput struct {
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
}

func (h *Handler) signIn(c *gin.Context) {
}