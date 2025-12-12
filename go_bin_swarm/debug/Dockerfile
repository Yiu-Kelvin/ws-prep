# Dockerfile
FROM alpine:3.18

# Install essential debugging tools
RUN apk add --no-cache \
    curl \
    wget \
    tcpdump \
    traceroute \
    net-tools \
    iputils \
    mysql-client \
    postgresql-client \
    bind-tools \
    aws-cli

# Verify tools are available (commented for build)
# RUN which curl wget nc tcpdump traceroute ifconfig netstat ping mysql psql

# Default command to show available tools
CMD ["sh", "-c", "echo 'Available tools: curl, wget, nc, tcpdump, traceroute, netstat, ping, mysql, psql, nslookup, dig, aws' && /bin/sh"]


# docker build -t debug-image .
# docker run --rm -it --cap-add=NET_ADMIN debug-image
