FROM alpine:3.14

#RUN apk add --no-cache wine xvfb-run bash which curl outils-sha1 p7zip jq nano
RUN apk add --no-cache wine xvfb-run bash which curl outils-sha1 p7zip jq nano

RUN addgroup -g 1000 -S qaac64 && \
    adduser -u 1000 -S qaac64 -G qaac64

ADD qaac64/* /tmp/build/
RUN cd /tmp/build && ./qaac_builder.sh && rm -fr /tmp/build/

USER qaac64

ENV WINEPATH            /usr/local/bin
ENV WINEDEBUG           -all
ENV WINEDLLOVERRIDES    winex11.drv=;winemp3.acm=

WORKDIR /mnt

ENTRYPOINT ["xvfb-run", "wine64", "qaac64.exe"]
