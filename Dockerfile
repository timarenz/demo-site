FROM nginx:alpine
LABEL maintainer="Tim Arenz <tim@arenz.cc>"
COPY public/ /usr/share/nginx/html