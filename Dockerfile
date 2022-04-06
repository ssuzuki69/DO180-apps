FROM ubi7/ubi:7.7
MAINTAINER ssuzuki69

RUN yum install -y httpd && \
    yum clean all

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
    sed -i -e s/# ServerName www.example.com:80/ServerName localhost:${PORT}/ && \
    chown -R  apache:apache /etc/httpd/logs && \
    chown -R  apache:apache /run/httpd

ENV PORT 8080
USER apache

# Copy all files under src/ folder to Apache DocumentRoot (/var/www/html)
COPY ./src/ /var/www/html/

# Expose the custom port that you provided in the ENV var
EXPOSE ${PORT}

CMD ["httpd", "-D", "FOREGROUND"]
