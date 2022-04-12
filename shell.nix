{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  inputsFrom = [
    (pkgs.callPackage ./. {})
  ];
}
