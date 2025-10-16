FROM registry.access.redhat.com/ubi9/ubi:9.6
RUN  dnf install -y nginx

# Remove the default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom config
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
