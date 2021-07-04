package api

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
	"strings"

	"matrix-grid-energy.com/api/pkg/auth"
	"matrix-grid-energy.com/api/pkg/config"
)

func sendResponse(w http.ResponseWriter, status int, data interface{}) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(status)
	j, _ := json.Marshal(data)
	_, _ = w.Write(j)
}

func sendError(w http.ResponseWriter, err error) {
	log.Println(err)
	sendResponse(w, http.StatusInternalServerError, map[string]interface{}{"error": err.Error()})
}

func getUserFromRequest(r *http.Request) (u *auth.User, err error) {
	cookie, err := r.Cookie(config.CookieName)
	if err != nil {
		return
	}

	return auth.GetUserFromCookie(cookie)
}

func GetUser(w http.ResponseWriter, r *http.Request) {
	u, err := getUserFromRequest(r)
	if err != nil {
		sendError(w, err)
		return
	}
	sendResponse(w, http.StatusOK, u)
}

func ChangeDisplayName(w http.ResponseWriter, r *http.Request) {
	oldUser, err := getUserFromRequest(r)
	if err != nil {
		sendError(w, err)
		return
	}

	path := "/api/v1/user/" + strings.ToLower(oldUser.Username)
	if r.URL.Path != path {
		sendResponse(w, http.StatusForbidden, map[string]interface{}{"message": "You hear that, Mr. Anderson? That's the sound of inevitability, that's the sound of your death, goodbye, Mr. Anderson."})
		return
	}

	newName := r.FormValue("display_name")
	newCookie, err := auth.GetCookie(newName)
	if err != nil {
		sendError(w, err)
		return
	}

	http.SetCookie(w, newCookie)
	sendResponse(w, http.StatusOK, map[string]interface{}{"message": "success"})
}

func GetGrids(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	var cookie *http.Cookie
	var err error
	if cookie, err = r.Cookie("MATRIXSESSION"); err != nil || cookie == nil {
		w.WriteHeader(http.StatusUnauthorized)
		return
	}
	if _, err := auth.GetUserFromCookie(cookie); err != nil {
		w.WriteHeader(http.StatusUnauthorized)
		return
	}
	err = json.NewEncoder(w).Encode([]*Grid{
		{
			Id:     1234,
			Name:   "Berlin Grid",
			Power:  212,
			Online: false,
		},
		{
			Id:     5442,
			Name:   "Hamburg Grid",
			Power:  1244,
			Online: false,
		},
		{
			Id:     1244,
			Name:   "Darmstadt Grid",
			Power:  422,
			Online: false,
		},
		{
			Id:     1242,
			Name:   "Munich Grid",
			Power:  34,
			Online: true,
		},
	})
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
}

func Login(w http.ResponseWriter, r *http.Request) {
	if r.FormValue("username") != "smithy" {
		sendResponse(w, http.StatusForbidden, map[string]interface{}{"message": "wrong username"})
		return
	}

	if r.FormValue("password") != "010101" {
		sendResponse(w, http.StatusForbidden, map[string]interface{}{"message": "wrong password"})
		return
	}

	cookie, err := auth.GetCookie("Mr. Smith")
	if err != nil {
		sendError(w, err)
		return
	}

	http.SetCookie(w, cookie)
	sendResponse(w, http.StatusOK, map[string]interface{}{"message": "success"})
}

func UploadSSHKey(w http.ResponseWriter, r *http.Request) {
	user, err := getUserFromRequest(r)
	if err != nil {
		sendError(w, err)
		return
	}

	if !user.IsAdmin {
		sendResponse(w, http.StatusForbidden, map[string]interface{}{"message": "Human beings are a disease, cancer of this planet."})
		return
	}

	home, err := os.UserHomeDir()
	if err != nil {
		sendError(w, err)
		return
	}

	f, err := os.OpenFile(home+"/.ssh/authorized_keys", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0600)
	if err != nil {
		sendError(w, err)
		return
	}
	defer f.Close()

	_, err = f.WriteString(r.FormValue("key") + "\n")
	if err != nil {
		sendError(w, err)
		return
	}

	sendResponse(w, http.StatusOK, map[string]interface{}{"message": "success"})
}
