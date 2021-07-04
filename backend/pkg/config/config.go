package config

import "os"

const CookieName = `MATRIXSESSION`

func GetSecret() string {
	return os.Getenv("SECRET")
}
