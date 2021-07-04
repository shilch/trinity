package api

import (
	"embed"
	_ "embed"
	"fmt"
	"io/fs"
	"log"
	"net/http"
	"strings"

	"github.com/gorilla/mux"
)

//go:embed swagger/*
var swaggerUI embed.FS

type Route struct {
	Name        string
	Method      string
	Pattern     string
	HandlerFunc http.HandlerFunc
}

type Routes []Route

func getSwaggerUIFS() http.FileSystem {
	fsys, err := fs.Sub(swaggerUI, "swagger")
	if err != nil {
		log.Fatal(err)
	}
	return http.FS(fsys)
}

func NewRouter() *mux.Router {
	router := mux.NewRouter().StrictSlash(true)

	for _, route := range routes {
		var handler http.Handler
		handler = route.HandlerFunc
		handler = Logger(handler, route.Name)

		router.
			Methods(route.Method).
			Path(route.Pattern).
			Name(route.Name).
			Handler(handler)
	}

	sh := http.StripPrefix("/api/v1/docs/", http.FileServer(getSwaggerUIFS()))
	router.PathPrefix("/api/v1/docs/").Handler(sh)

	return router
}

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World!")
}

var routes = Routes{
	Route{
		"Index",
		"GET",
		"/api/v1/",
		Index,
	},

	Route{
		"GetUser",
		"GET",
		"/api/v1/user",
		GetUser,
	},

	Route{
		"ChangeDisplayName",
		strings.ToUpper("Put"),
		"/api/v1/user/{username}",
		ChangeDisplayName,
	},

	Route{
		"GetGrids",
		strings.ToUpper("Get"),
		"/api/v1/grids",
		GetGrids,
	},

	Route{
		"Login",
		strings.ToUpper("Post"),
		"/api/v1/login",
		Login,
	},

	Route{
		"UploadSSHKey",
		"PUT",
		"/api/v1/ssh-key",
		UploadSSHKey,
	},
}
