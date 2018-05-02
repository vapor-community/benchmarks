package main

import (
    "net/http" 
    "github.com/gin-gonic/gin"
)

func main() {
    gin.SetMode(gin.ReleaseMode)
    r := gin.New()

    r.GET("/ping", func(c *gin.Context) {
        c.String(http.StatusOK, "123")
    })

    r.Run("127.0.0.1:8000")
}
