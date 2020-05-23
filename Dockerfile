FROM ubuntu:focal

RUN apt-get update && apt-get install software-properties-common -y
RUN add-apt-repository ppa:avsm/ppa
RUN apt-get update && apt-get install --no-install-recommends -y m4 opam bubblewrap make gcc build-essential python3.8
RUN opam init --disable-sandboxing
RUN opam switch create 4.10.0
RUN opam repo add cis120-opam https://github.com/KeenWill/opam-repository.git
RUN opam install ocamlbuild.0.14.0 yojson.1.7.0 ocamlfind.1.8.1 camelot -y
