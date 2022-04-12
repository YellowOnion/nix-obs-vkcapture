{pkgs, ...}:
{
  obs-vkcapture = pkgs.callPackage ./base.nix {};
  obs-vkcapture-lib32 = pkgs.pkgsi686Linux.callPackage ./base.nix {};

}
