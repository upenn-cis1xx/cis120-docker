FROM alpine:3

ARG TZ=America/New_York

RUN apk update \
    && apk add --no-cache --update m4 bubblewrap make gcc g++ python3 openjdk8 git bash git pkgconfig libx11-dev

RUN pip3 install pymysql pytz

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"
