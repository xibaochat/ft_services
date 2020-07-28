FROM alpine:3.11

RUN apk update
RUN apk add influxdb #--repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY grant_user_pw.sh /root/
CMD  ash /root/grant_user_pw.sh
