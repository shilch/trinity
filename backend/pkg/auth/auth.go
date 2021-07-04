package auth

import (
	"encoding/base64"
	"encoding/json"
	"net/http"
	"strings"
	"time"

	"matrix-grid-energy.com/api/pkg/config"

	"golang.org/x/crypto/bcrypt"
)

func CreateHMAC(data []byte) (hmac []byte, err error) {
	return bcrypt.GenerateFromPassword(append([]byte(config.GetSecret()), data...), bcrypt.DefaultCost)
}

func VerifyHMAC(data, sig []byte) error {
	return bcrypt.CompareHashAndPassword(sig, append([]byte(config.GetSecret()), data...))
}

func getToken(u *User) (token string, err error) {
	payload, err := json.Marshal(u)
	if err != nil {
		return "", err
	}

	hmac, err := CreateHMAC(payload)
	if err != nil {
		return "", err
	}

	return base64.StdEncoding.EncodeToString(payload) + "." + base64.StdEncoding.EncodeToString(hmac), nil
}

func GetCookie(displayName string) (*http.Cookie, error) {
	u := &User{
		Username:    "smithy",
		DisplayName: displayName,
		IsAdmin:     false,
	}

	token, err := getToken(u)
	if err != nil {
		return nil, err
	}

	return &http.Cookie{
		Name:     config.CookieName,
		Value:    token,
		HttpOnly: false,
		Expires: time.Now().Add(12 * time.Hour),
		SameSite: http.SameSiteStrictMode,
		Path: "/",
	}, nil
}

func GetUserFromCookie(cookie *http.Cookie) (u *User, err error) {
	parts := strings.Split(cookie.Value, ".")
	payload, err := base64.StdEncoding.DecodeString(parts[0])
	if err != nil {
		return nil, err
	}

	signature, err := base64.StdEncoding.DecodeString(parts[1])
	if err != nil {
		return nil, err
	}

	err = VerifyHMAC(payload, signature)
	if err != nil {
		return nil, err
	}

	u = &User{}
	err = json.Unmarshal(payload, u)
	if err != nil {
		return nil, err
	}

	return
}
