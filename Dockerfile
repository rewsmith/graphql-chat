FROM golang:1.17.6-alpine

WORKDIR /app

COPY go.mod go.sum ./
COPY *.go .gqlgen.yml schema.graphql ./
# COPY *.go .gqlgen.yml schema.graphql start-server.sh ./

COPY server server

RUN go mod download
# RUN chmod +x ./start-server.sh

RUN go build -o /tmp/srv-chat ./server

EXPOSE 8085

CMD /tmp/srv-chat