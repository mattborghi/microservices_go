# Working with microservices in Go

Building scalable, resilient, distributed applications in Go

- Broker: single entry point to micro services.
- Authentication: Postgres
- Logger: MongoDB
- Mail: sends email with a specific template
- Listener: consumes messages in RabbitMQ and initiates a process.

## Frontend

Run using `go run ./frontend/cmd/web/`

## Broker

Init by doing `go mod init broker`.

Installed some packages from [chi](https://github.com/go-chi/chi) doing `go get github.com/go-chi/cors`

Run using `go run ./broker/cmd/api/`

## Authentication

Similarly as Broken. It connects to a PostgreSQL database to handle User data.

## Logger

Connected to MongoDB database from `go get go.mongodb.org/mongo-driver/mongo`.

# Set up

Run `cd projects && make up_build` to executables for the go microservices and build and run the dockerfiles.

Then run `make start` to spin up the front end server.

Stop the frontend server with `make stop`.

Take down the docker services with `make down`.
