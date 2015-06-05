FROM ubuntu:14.04

MAINTAINER @JarenGlover 

RUN apt-get update -q
RUN apt-get install -qy git nginx

RUN mkdir -p /docs

RUN cd /docs && git clone https://github.com/JarenGlover/resume.git

# Remove the default Nginx configuration file
RUN rm /etc/nginx/sites-enabled/default

# ADD the nginx file for the routing 
ADD /resume.sites-enabled /etc/nginx/sites-enabled/resume

RUN sed -i '/access_log/a\
    log_format upstreamlog "[$time_local] $remote_addr passed to: $upstream_addr: $request Upstream Response Time: $upstream_response_time Request time: $request_time";' /etc/nginx/nginx.conf

# Append "daemon off;" to the configuration file
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#expose ports
EXPOSE 80

# Set the default command to execute when creating a new container
#CMD service nginx start
CMD ["nginx"]
