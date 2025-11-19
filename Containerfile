# Base image
FROM fedora:latest

# Upgrade the system and install tuxpaint, vim, and httpd
RUN dnf -y upgrade && \
    dnf -y install tuxpaint vim httpd && \
    dnf clean all

# Copy local myinfo.html into the web root
COPY myinfo.html /var/www/html/myinfo.html

# Expose HTTP port
EXPOSE 80

# Run httpd in the foreground when the container starts
CMD ["httpd", "-D", "FOREGROUND"]