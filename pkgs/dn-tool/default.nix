# dn-tool is packaged upstream in its own repo under nix/package.nix, a plain
# nixpkgs-style derivation (not flake-only). We reuse that file directly via
# fetchFromGitHub + callPackage so the build logic stays single-sourced and this
# stays classic-Nix compatible (NUR evaluates in classic mode). Relative paths
# inside package.nix (e.g. src = ../src) resolve against the fetched tree, so
# nothing needs duplicating here.
{
  pkgs,
  version ? "0.0.3",
}:
let
  src = pkgs.callPackage ./src.nix { };
in
pkgs.callPackage "${src}/nix/package.nix" { inherit version; }
