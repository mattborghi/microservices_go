# Working with microservices in Go

Building scalable, resilient, distributed applications in Go

- Broker: single entry point to micro services.
- Authentication: Postgres
- Logger: MongoDB
- Mail: sends email with a specific template
- Listener: consumes messages in RabbitMQ and initiates a process.

Microservices are communicated between them (not the client) using RPC which is faster than (un)marshalling JSONs.

![stack](./assets/stack.drawio.png)

## Frontend

Run using `go run ./frontend/cmd/web/`

## Broker

Init by doing `go mod init broker`.

Installed some packages from [chi](https://github.com/go-chi/chi) doing `go get github.com/go-chi/cors`

Run using `go run ./broker/cmd/api/`

## Authentication

Similarly as Broken. It connects to a PostgreSQL database to handle User data.

## Logger

Connected to MongoDB database from `go get go.mongodb.org/mongo-driver/mongo`. Test saved documents in the NoSQL database by installing MongoDB Compass with the following arguments:

```
mongodb://admin:password@localhost:27017/logs?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false
```

## Mail

Mail service uses mailhog to simulate a mail service. This is for dev purposes. Broker shouldn't communicate directly to the mail service via send email. If we want to send an email every time a user logs out from the system, the Broker should communicate with authentication service, find the user is not authenticated and let the auth service communicate with the email service.

## Listener

Talks to Rabbit MQ. Broker pushes events to Rabbit MQ, a listener service pulls events from that queue and handles them.

Doesn't have a cmd folder because it doesn't have an API, it just talks to the queue.

# Set up

Run `cd projects && make up_build` to executables for the go microservices and build and run the dockerfiles.

Then run `make start` to spin up the front end server.

Stop the frontend server with `make stop`.

Take down the docker services with `make down`.
