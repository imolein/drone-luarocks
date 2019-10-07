FROM imolein/luarocks:5.3

MAINTAINER Sebastian Huebner <sh@kokolor.es>

RUN apk add --no-cache bash zip \
    && luarocks install dkjson

COPY lr_upload.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/lr_upload.sh"]