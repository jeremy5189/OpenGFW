FROM golang:1.21-alpine

WORKDIR /opengfw
COPY . .

# Install iptables
RUN apk update && apk add iptables curl

# Build
RUN go mod download
RUN export CGO_ENABLED=0
RUN go build
RUN export OPENGFW_LOG_LEVEL=debug

EXPOSE 22

CMD ["/bin/sh", "-c", "./OpenGFW -c config.yaml rules.yaml"]
