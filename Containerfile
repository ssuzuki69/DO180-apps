# DO180 comprehensive-review
FROM ubi8/ubi:8.3
LABEL description="This is a custom httpd container image"
MAINTAINER S Suzuki <jdoe@xyz.com>
RUN yum install -y httpd
EXPOSE 80
ENV LogLevel "info"
ADD http://someserver.com/filename.pdf /var/www/html
COPY ./src/ /var/www/html/
USER apache
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"] 
