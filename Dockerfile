FROM golang:1.22.4-alpine

COPY ./go.mod .

COPY ./go.sum .

RUN go mod download

COPY ./templates ./templates

COPY ./lib ./lib

COPY ./cmd ./cmd

COPY ./main.go .

RUN go build -o build/fizzbuzz

CMD ["./build/fizzbuzz", "serve"]
