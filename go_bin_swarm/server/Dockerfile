# Use Alpine for minimal size (replace with Debian if your binary needs glibc)
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy binary and config file (ensure these files exist in your current dir!)
COPY ws-ec2-root .
COPY server.ini .

# Make binary executable (if not already)
RUN chmod +x ws-ec2-root

EXPOSE 80
# Start the binary when the container runs
CMD ["./ws-ec2-root"]
