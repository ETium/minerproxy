FROM alpine:latest
LABEL maintainer="h31105 <mailinstyle@gmail.com>"
RUN apk add --no-cache build-base curl\
    &&  cd /root \
    &&  wget --no-check-certificate https://github.com/Char1esOrz/minerProxy/releases/download/$(curl -s https://api.github.com/repos/Char1esOrz/minerProxy/releases/latest | grep tag_name | awk '{ print $2 }' | sed 's/,$//' | sed 's/"//g')/minerProxy_config -O minerProxy \
    &&  chmod +x minerProxy \
    &&  mkdir -p /etc/minerproxy \
    &&  mv minerProxy /etc/minerproxy/. \
    &&  apk del build-base \
    &&  cd /root \
    &&  rm -rf /tmp/* /var/cache/apk/*
COPY config.yml /etc/minerproxy/
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
