FROM alpine:3

ARG TZ=America/New_York

RUN apk update \
    && apk add --no-cache --update m4 opam bubblewrap make gcc g++ python3 py3-pip git bash git pkgconfig libx11-dev

RUN opam init --disable-sandboxing -a --shell=bash

RUN opam switch create 4.11.1

RUN opam install -y \
    camelot.1.6.2 \
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

RUN eval $(opam env)

RUN pip3 install pymysql pytz
