FROM alpine:3

ARG TZ=America/New_York

RUN apk update \
    && apk add --no-cache --update m4 opam bubblewrap make gcc g++ python3 py3-pip git bash git pkgconfig libx11-dev

RUN opam init --disable-sandboxing -a --shell=bash

RUN opam switch create 4.11.1

RUN opam install -y \
    camelot.1.7.0 \
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
