package main

import (
	"net/http"

	"github.com/tsawler/toolbox"
)

func (app *Config) Broker(w http.ResponseWriter, r *http.Request) {
	var tools toolbox.Tools

	payload := toolbox.JSONResponse{
		Error:   false,
		Message: "Hit the broker",
	}

	_ = tools.WriteJSON(w, http.StatusOK, payload)
}
