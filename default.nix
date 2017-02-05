{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> {} }:

with pkgs;

assert stdenv.isLinux == true || stdenv.isDarwin == true;

let inputs = [ bash getopt coreutils gawk gnused gnugrep procps psmisc xboxdrv steam ];
in
stdenv.mkDerivation {
  name = "run";
  buildInputs = inputs;
}
