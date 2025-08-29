# Multi-stage build for minimal image size
FROM golang:1.24.5 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app .

FROM alpine:3.19
WORKDIR /root/
COPY --from=builder /app/app .
CMD ["./app"]