package main

import (
	"fmt"
	"os"

	"golang.org/x/crypto/bcrypt"
)

// HashPwd hashes a password.
func HashPwd(password string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	return string(bytes), err
}

func main() {
	password := os.Args[1]
	pwd, _ := HashPwd(password)
	fmt.Println(pwd)
}
