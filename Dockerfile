FROM golang:1.16-alpine AS builder
WORKDIR /go/src
COPY main.go .
RUN go build -ldflags "-s -w" main.go

FROM hello-world
WORKDIR /go/src
COPY --from=builder /go/src .
ENTRYPOINT [ "./main" ]