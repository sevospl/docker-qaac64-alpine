FROM alpine:3.14

RUN apk add --no-cache wine xvfb-run

ADD qaac/* /usr/local/bin/

RUN addgroup -g 1000 -S qaac64 && \
    adduser -u 1000 -S qaac64 -G qaac64

USER qaac64

ENV WINEPATH            /usr/local/bin
ENV WINEDEBUG           -all
ENV WINEDLLOVERRIDES    winex11.drv=;winemp3.acm=

WORKDIR /mnt

ENTRYPOINT ["xvfb-run", "wine64", "qaac64.exe"]
