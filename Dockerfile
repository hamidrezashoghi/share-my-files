FROM nginx:latest

MAINTAINER hamidreza shoghi<hrs9169@gmail.com>

RUN apt-get update && apt install openssl -y

RUN rm -rf /usr/share/nginx/html/* && \
	rm -rf /etc/nginx/conf.d/*

RUN mkdir /files

# Define username and password for login to download's page
RUN echo -n "user1:" >  /etc/nginx/.htpasswd && \
	echo "user1" | xargs openssl passwd -apr1 >> /etc/nginx/.htpasswd
	
COPY nginx.conf /etc/nginx/nginx.conf
COPY error.html /usr/share/nginx/html/

RUN apt-get remove openssl -y

EXPOSE 8081

WORKDIR /

# for build: docker build --rm -t share-my-files:0.1 .
# for run:   docker run -d --name share-files-server -p 8081:8081 --volume <where is my files>:/files share-my-files:0.1
