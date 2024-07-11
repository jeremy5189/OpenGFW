FROM golang:1.21-alpine

WORKDIR /opengfw
COPY . .

# Install iptables
RUN apk update && apk add iptables openssh-server openrc openssh curl

# Setup SSH (Tunnel not working yet)
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel
RUN mkdir -p /etc/ssh && ssh-keygen -A
RUN adduser -D -s /bin/sh sshuser && echo "sshuser:password" | chpasswd
RUN echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config
RUN echo "PermitTunnel yes" >> /etc/ssh/sshd_config

# Build
RUN go mod download
RUN export CGO_ENABLED=0
RUN go build
RUN export OPENGFW_LOG_LEVEL=debug

EXPOSE 22

CMD ["/bin/sh", "-c", "/usr/sbin/sshd && ./OpenGFW -c config.yaml rules.yaml"]
