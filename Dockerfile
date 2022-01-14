FROM alpine:latest
LABEL maintainer="h31105 <mailinstyle@gmail.com>"
RUN apk add --no-cache build-base curl\
    &&  cd /root \
    &&  version=$(curl -s https://api.github.com/repos/Char1esOrz/minerProxy/releases/latest | grep tag_name | awk '{ print $2 }' | sed 's/,$//' | sed 's/"//g') \
    &&  wget --no-check-certificate https://github.com/Char1esOrz/minerProxy/releases/download/$version/minerProxy_version_linux-amd64 -O minerProxy \
    &&  chmod +x minerProxy \
    &&  mkdir -p /etc/minerproxy \
    &&  mv minerProxy /etc/minerproxy/. \
    &&  apk del build-base \
    &&  cd /root \
    &&  rm -rf /tmp/* /var/cache/apk/*
COPY config.yml /etc/minerproxy/
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
