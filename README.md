# Working with microservices in Go

Building scalable, resilient, distributed applications in Go

- Broker: single entry point to micro services.
- Authentication: Postgres
- Logger: MongoDB
- Mail: sends email with a specific template
- Listener: consumes messages in RabbitMQ and initiates a process.

Microservices are communicated between them (not the client) using gRPC which is faster than (un)marshalling JSONs. The difference between gRPC and RPC is that the former can communicate multiple services written in different programming languages.

In order for gRPC to work we installed `go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.27` and `go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2`.

Compiling the proto files requires installing protoc and then running:

```
protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative <target>
```

where `<target>` could be for example `logs.proto`.

> [!IMPORTANT]  
> If you see the error `protoc-gen-go: program not found or is not executable`, you may need to add go to your PATH. In my case, `export PATH="$PATH:$(go env GOPATH)/bin"`.

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
