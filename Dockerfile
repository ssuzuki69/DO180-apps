FROM ubi7/ubi:7.7
MAINTAINER ssuzuki69

RUN yum install -y httpd && \
    yum clean all

ENV PORT 8080
RUN sed -ri -e 's/Listen 80/Listen ${PORT}/g' /etc/httpd/conf/httpd.conf && \
    sed -i -e 's/# ServerName www.example.com:80/ServerName localhost:${PORT}/g' /etc/httpd/conf/httpd.conf && \    
    chown -R  apache:apache /etc/httpd/logs/ && \
    chown -R  apache:apache /run/httpd/

USER apache

# Copy all files under src/ folder to Apache DocumentRoot (/var/www/html)
COPY ./src/ /var/www/html/

# Expose the custom port that you provided in the ENV var
EXPOSE ${PORT}

CMD ["httpd", "-D", "FOREGROUND"]
