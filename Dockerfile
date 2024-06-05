FROM golang:1.22.4-alpine AS initial

WORKDIR /app

COPY ./go.mod .

COPY ./go.sum .

RUN go mod download

COPY ./templates ./templates

COPY ./lib ./lib

COPY ./cmd ./cmd

COPY ./main.go .

RUN go build -o build/fizzbuzz

FROM scratch

WORKDIR /app

COPY --from=initial /app/templates ./templates

COPY --from=initial /app/build/fizzbuzz ./build/fizzbuzz

CMD ["./build/fizzbuzz", "serve"]
