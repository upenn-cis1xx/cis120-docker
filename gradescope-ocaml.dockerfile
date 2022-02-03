FROM gradescope/auto-builds:ubuntu-20.04

ARG TZ=America/New_York
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        git m4 bubblewrap make gcc build-essential python3.9 python3-pip bash pkg-config libx11-dev \
        opam \
    && rm -rf /var/lib/apt/lists/*

RUN opam init --disable-sandboxing -a --shell=bash

RUN opam switch create cis120 ocaml-base-compiler.4.12.0

RUN opam install -y \
    camelot.1.7.1 \
    ocamlbuild \
    ocamlfind \
    yojson \
    merlin \
    js_of_ocaml \
    js_of_ocaml-lwt \
    ocp-indent \
    utop \
    graphics \
    dune \
    odoc \
    ppx_expect

RUN opam clean

RUN eval $(opam env)

RUN pip3 install pymysql pytz
