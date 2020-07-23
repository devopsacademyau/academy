FROM golang:latest AS go
WORKDIR /go/
COPY hello.go .
RUN go build hello.go

FROM alpine:latest
WORKDIR /root/
COPY --from=go /go/hello .
CMD ["./hello"]

