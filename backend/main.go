/*
 * Matrix Power Grid Inc. User API
 *
 * This is the documentation of the Matrix Power Grid Inc. User API
 *
 * API version: 1.0.0
 * Generated by: Swagger Codegen (https://github.com/swagger-api/swagger-codegen.git)
 */
package main

import (
	"log"
	"net/http"

	"github.com/rs/cors"
	sw "matrix-grid-energy.com/api/pkg/api"
)

func main() {
	log.Printf("Server started")

	router := sw.NewRouter()
	c := cors.New(cors.Options{
		AllowedOrigins: []string{"http://localhost:*"},
		AllowedMethods: []string{
			http.MethodHead,
			http.MethodGet,
			http.MethodPost,
			http.MethodPut,
			http.MethodPatch,
			http.MethodDelete,
			http.MethodOptions,
		},
		AllowedHeaders:   []string{"*"},
		AllowCredentials: true,
	})

	log.Fatal(http.ListenAndServe("127.0.0.1:8080", c.Handler(router)))
}
