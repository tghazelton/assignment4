# Base image
FROM fedora:latest

# Update system and install required tools: tuxpaint, vim, httpd
RUN dnf -y update && \
    dnf -y install tuxpaint vim httpd && \
    dnf clean all

# Copy local myinfo.html into the container
COPY myinfo.html /var/www/html/myinfo.html

# Expose HTTP port
EXPOSE 80

# Run httpd in the foreground when the container starts
CMD ["httpd", "-D", "FOREGROUND"]
