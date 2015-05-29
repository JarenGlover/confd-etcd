FROM ubuntu:14.04
MAINTAINER Jaren Glover @JarenGlover

RUN apt-get update -q
RUN apt-get install -qy apache2
RUN echo "<h1>To Pimp a Butterfly from Docker on CoreOS</h1>" > /var/www/html/index.html

EXPOSE 80
CMD ["apache2ctl", "-DFOREGROUND"]
