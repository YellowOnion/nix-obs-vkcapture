{ config, lib, pkgs, stdenv, fetchFromGitHub, vulkan-headers, ... }:
let
  info = lib.importJSON ./version.json;
  name = "obs-vkcapture";
in
  with pkgs;
  stdenv.mkDerivation {
    pname = name;
    name = name;
    src = fetchFromGitHub {inherit (info) owner repo rev sha256;};

    nativeBuildInputs = [ cmake gcc vulkan-headers libGL vulkan-loader pkg-config] ++ (lib.optional (!stdenv.isi686) [obs-studio]);

    cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" (lib.optionalString stdenv.isi686 "-DBUILD_PLUGIN=OFF")];

  }
