# DO180 comprehensive-review
FROM ubi8/ubi:8.3
ARG NEXUS_VERSION=2.14.3-02
LABEL description="This is a DO180 comprehensive-review container image"
MAINTAINER S Suzuki <jdoe@xyz.com>
RUN yum install -y java-1.8.0-openjdk-devel
EXPOSE 80
ENV LogLevel "info"
ADD http://someserver.com/filename.pdf /var/www/html
COPY ./src/ /var/www/html/
USER apache
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"] 
