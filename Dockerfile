# Dockerfile for scraypd
# http://scrapyd.readthedocs.org/en/latest/

FROM ubuntu:precise
MAINTAINER Zaim Bakar <hi.zaimapps@gmail.com>

# Update APT cache
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Add scrapy APT repository
ADD http://archive.scrapy.org/ubuntu/archive.key /tmp/scrapy.key
RUN apt-key add /tmp/scrapy.key

#Add scrapyd public key 
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7AECB5E990E2741A
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7
RUN echo "deb http://archive.scrapy.org/ubuntu precise main" > /etc/apt/sources.list.d/scrapy.list
RUN apt-get update

# Install wget
RUN apt-get install -y wget

# Install setuptools
RUN apt-get install -y python-setuptools

# Install pip
RUN wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py -O - | python

# Install scrapyd
RUN apt-get install -y scrapyd

# Expose scrapyd default port
EXPOSE 6800

# Set scrapyd as run entrypoint
ENTRYPOINT ["/usr/bin/scrapyd"]
