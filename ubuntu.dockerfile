FROM ubuntu:20.04

ARG TZ=America/New_York
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        git m4 bubblewrap make gcc build-essential python3.9 python3-pip bash pkg-config libx11-dev \
        opam openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

RUN opam init --disable-sandboxing -a --shell=bash

RUN opam install -y \
    camelot.1.7.0 \
    ocamlbuild.0.14.0 \
    ocamlfind.1.8.1 \
    yojson.1.7.0 \
    merlin.3.4.2 \
    js_of_ocaml.3.8.0 \
    js_of_ocaml-lwt.3.8.0 \
    ocp-indent.1.8.1 \
    utop.2.7.0 \
    graphics.5.1.1 \
    dune.2.8.2 \
    odoc.1.5.2 \
    ppx_expect.v0.14.1

RUN opam clean

RUN pip3 install pymysql pytz

RUN eval $(opam env)
RUN ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /java_home
ENV JAVA_HOME=/java_home
ENV PATH="$JAVA_HOME/bin:${PATH}"
