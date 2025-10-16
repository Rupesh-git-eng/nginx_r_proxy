FROM registry.access.redhat.com/ubi9/ubi:9.6
RUN  dnf install -y nginx && yum clean all && rm -rf /var/cache/yum

# Copy our custom config
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

RUN chmod g+rwx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chmod g+rwx /var/run/nginx.pid
    
EXPOSE 8080
   
USER nginxuser

CMD ["nginx", "-g", "daemon off;"]
