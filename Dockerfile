FROM alpine:latest as build

ENV HUGO_VERSION 0.49
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN apk add --no-cache --update wget ca-certificates && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    tar xzf ${HUGO_BINARY} && \
    mv hugo /usr/local/bin
COPY . /site
WORKDIR /site
RUN /usr/local/bin/hugo

FROM nginx:alpine
COPY --from=build /site/public /usr/share/nginx/html