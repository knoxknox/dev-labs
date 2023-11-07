package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(response http.ResponseWriter, request *http.Request) {
		body := ""
		query := request.URL.Query()

		if !query.Has("id") {
			body = "Index page"
			log.Println("Handle index page")
		} else {
			id := query.Get("id")
			body = "Details page " + id
			log.Printf("Handle details page with %s", id)
		}

		response.Write([]byte(body))
	})

	port := ":9000"
	host := "0.0.0.0"
	log.Printf("Listen on %s%s", host, port)
	log.Fatal(http.ListenAndServe(port, nil))
}
