# Working with microservices in Go

Building scalable, resilient, distributed applications in Go

- Broker: single entry point to micro services.
- Authentication: Postgres
- Logger: MongoDB
- Mail: sends email with a specific template
- Listener: consumes messages in RabbitMQ and initiates a process.

## Frontend

Run using `go run ./frontend/cmd/main.go`

## Broker

Init by doing `go mod init broker`.

Installed some packages from [chi](https://github.com/go-chi/chi) doing `go get github.com/go-chi/cors`

Run using `go run ./broker/cmd/api/`
