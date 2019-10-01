FROM imo/luarocks5.3:latest

MAINTAINER Sebastian Huebner <sh@kokolor.es>

RUN apk add --no-cache bash zip git \
    && luarocks install dkjson

COPY lr_upload.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/lr_upload.sh"]