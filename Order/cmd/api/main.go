package main

import (
	"fmt"
	"log/slog"
	"net/http"
	"os"
)

const version = "1.0.0"

type config struct {
	port int
}

type application struct {
	config config
	logger *slog.Logger
}

func main() {
	var cfg config
	cfg.port = 4000

	logger := slog.New(slog.NewTextHandler(os.Stdout, nil))

	app := &application{
		config: cfg,
		logger: logger,
	}

	mux := http.NewServeMux()
	mux.HandleFunc("/healthcheck", app.healthcheckHandler)

	serv := &http.Server{
		Addr:     fmt.Sprintf(":%d", cfg.port),
		Handler:  mux,
		ErrorLog: slog.NewLogLogger(logger.Handler(), slog.LevelError),
	}

	logger.Info("starting server", "addr", cfg.port)

	err := serv.ListenAndServe()
	logger.Error(err.Error())
	os.Exit(1)
}
