# Use Alpine as the base image
FROM alpine:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Install only the necessary dependencies for Open vSwitch
RUN apk add --no-cache openvswitch bash \
    && apk del --no-cache apk-tools

# Remove any unneeded APK cache
RUN rm -rf /var/cache/apk/*

# Add the OVS start script and systemd unit files
COPY scripts/start-db.sh /usr/local/bin/start-db.sh

# Make the script executable
RUN chmod +x /usr/local/bin/start-db.sh

# Define the entry point to run the start script
ENTRYPOINT ["sh"]
