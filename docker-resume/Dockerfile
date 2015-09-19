# add comments here
#

FROM alpine:latest

MAINTAINER Jaren Glover <@JarenGlover>

# Copy the nginx file for the routing
COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY nginx/resume.sites-enabled /etc/nginx/conf.d/resume.sites-enabled.conf

COPY supervisor/supervisor.conf /etc/.

RUN apk update && apk add \
        git \
        python \
        py-pip \
        nginx \
        && rm -rf /var/cache/apk/*

RUN mkdir -p /docs

# Clone down latest resume
RUN cd /docs && git clone https://github.com/JarenGlover/resume.git

# install python mods
RUN pip install -r /docs/resume/requirements.txt

# expose ports
EXPOSE 80

# start nginx in background
RUN nginx&

# start resume webservice on port 4000
ENTRYPOINT ["gunicorn","-w","4","-b","0.0.0.0:4000", "resume:app", "--chdir","/docs/resume/"]