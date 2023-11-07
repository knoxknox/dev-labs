package main

import (
	"net/http"

	"github.com/sirupsen/logrus"
)

func main() {
	http.HandleFunc("/", func(response http.ResponseWriter, request *http.Request) {
		body := ""
		query := request.URL.Query()

		if !query.Has("id") {
			body = "Index page"
			logrus.Info("Handle index page")
		} else {
			id := query.Get("id")
			body = "Details page " + id
			logrus.Infof("Handle details page with %s", id)
		}

		response.Write([]byte(body))
	})

	port := ":8080"
	host := "0.0.0.0"
	logrus.Infof("Listen on %s%s", host, port)
	logrus.Fatal(http.ListenAndServe(port, nil))
}
