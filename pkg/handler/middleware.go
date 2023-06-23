package handler

import (
	"errors"
	"net/http"

	"github.com/gin-gonic/gin"
)

const (
	authorizationHeader = "Authorization"
	userCtx             = "userId"
)

func (h *Handler) userIdentity(c *gin.Context) {
	header, err := c.Cookie(authorizationHeader)
	if err != nil {
		newErrorResponse(c, http.StatusUnauthorized, "empty auth header")
		return
	}
	userId, err := h.services.ParseToken(header)
	if err != nil {
		newErrorResponse(c, http.StatusUnauthorized, err.Error())
		return
	}

	c.Set(userCtx, userId)
}
func getUserId(c *gin.Context) (int, error) {
	id, ok := c.Get(userCtx)
	if !ok {
		return 0, errors.New("user id not found")
	}

	idInt, ok := id.(int)
	if !ok {
		return 0, errors.New("user id is of invalid type")
	}

	return idInt, nil
}

func (h *Handler) requireAuth(c *gin.Context) {
	// Get the cookie of request
	tokenString, err := c.Cookie(authorizationHeader)
	if err != nil {
		newErrorResponse(c, http.StatusUnauthorized, "Failed to get token")
	}

	_, err = h.services.ParseToken(tokenString)
	if err != nil {
		newErrorResponse(c, http.StatusInternalServerError, "Invalid token")
	}

	c.Set(authorizationHeader, tokenString)
	c.Next()
}