FROM gradescope/auto-builds:ubuntu-20.04

ARG TZ=America/New_York
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        git m4 bubblewrap make gcc build-essential python3.9 bash \
        opam \
    && rm -rf /var/lib/apt/lists/*

RUN opam init --disable-sandboxing -a --shell=bash

RUN opam install ocamlbuild.0.14.0 yojson.1.7.0 ocamlfind.1.8.1 \
        camelot merlin js_of_ocaml ocp-indent utop -y

RUN opam clean

RUN eval $(opam env)

RUN pip3 install pymysql
