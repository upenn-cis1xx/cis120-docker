FROM alpine:3

ARG TZ=America/New_York

RUN apk update \
    && apk add --no-cache --update m4 opam bubblewrap make gcc g++ python3 openjdk8 git bash git

RUN opam init --disable-sandboxing -a --shell=bash

RUN opam install ocamlbuild.0.14.0 yojson.1.7.0 ocamlfind.1.8.1 \
        camelot merlin js_of_ocaml ocp-indent utop -y

RUN eval $(opam env)
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"
