FROM alpine:3

RUN apk update \
    && apk add --no-cache --update m4 opam bubblewrap make gcc g++ python3 openjdk8 git
RUN opam init --disable-sandboxing -a --shell=bash
RUN opam switch create 4.10.0
# RUN opam repo add cis120-opam https://github.com/KeenWill/opam-repository.git
RUN opam install ocamlbuild.0.14.0 yojson.1.7.0 ocamlfind.1.8.1 camelot -y
RUN eval $(opam env)
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"