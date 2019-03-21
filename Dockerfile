FROM alpine:3.7 as alpine

# fetch the trusted root certs that we'll need to reach outside services
RUN apk add -U --no-cache ca-certificates

# Image starts here
FROM scratch
LABEL maintainer "Brad Rush <brad@fyvm.org>"

EXPOSE 80 443 2015
ENV HOME /root

WORKDIR /
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY artifacts/binaries/linux/amd64/caddy /bin/

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]