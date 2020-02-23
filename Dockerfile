FROM cdcihub/jwt-nginx


# Get nginx ready to run
COPY resources/nginx.conf /etc/nginx/nginx.conf
COPY resources/test-jwt-nginx.conf /etc/nginx/conf.d/test-jwt-nginx.conf
COPY resources/index.html /usr/share/nginx/html/index.html
RUN cp -r /usr/share/nginx/html /usr/share/nginx/secure
RUN cp -r /usr/share/nginx/html /usr/share/nginx/secure-rs256
RUN cp -r /usr/share/nginx/html /usr/share/nginx/secure-auth-header
RUN cp -r /usr/share/nginx/html /usr/share/nginx/secure-no-redirect

ENTRYPOINT ["/usr/sbin/nginx"]
#ENTRYPOINT ["while true; do echo hello world; sleep 1; done"]

EXPOSE 8000
