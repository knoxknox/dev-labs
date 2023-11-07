package main

import (
	"net/http"
)

func main() {
	http.HandleFunc("/", func(response http.ResponseWriter, request *http.Request) {
		id := request.URL.Query().Get("id")
		if len(id) == 0 {
			response.Write([]byte("Index page"))
		} else {
			response.Write([]byte("Details page " + id))
		}
	})

	http.HandleFunc("/about", func(response http.ResponseWriter, request *http.Request) {
		response.Write([]byte("About page"))
	})

	http.ListenAndServe(":9000", nil)
}
