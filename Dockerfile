FROM golang:1.21-alpine

WORKDIR /opengfw
COPY . .

# Install iptables
RUN apk update && apk add iptables curl

# Build
RUN go mod download
RUN CGO_ENABLED=0 go build

CMD ["/bin/sh", "-c", "OPENGFW_LOG_LEVEL=debug ./OpenGFW -c config.yaml rules.yaml"]
