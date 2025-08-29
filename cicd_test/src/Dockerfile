# Multi-stage build for minimal image size
FROM public.ecr.aws/docker/library/golang:1.24.5 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app .

FROM public.ecr.aws/docker/library/alpine:3.19
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
