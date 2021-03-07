FROM gradescope/auto-builds:ubuntu-20.04

ARG TZ=America/New_York
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        git m4 bubblewrap make gcc build-essential python3.9 bash pkg-config libx11-dev \
        openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pymysql pytz

RUN ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /java_home
ENV JAVA_HOME=/java_home
ENV PATH="$JAVA_HOME/bin:${PATH}"