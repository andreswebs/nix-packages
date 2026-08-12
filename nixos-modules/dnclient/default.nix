# services.dnclient — re-exported from dn-tool's own nix/module.nix, pinned to
# the same commit as the package via the shared src.nix. Upstream module.nix is
# a standard `{ config, lib, pkgs, ... }` function, so we fetch the tree (using
# the module system's own pkgs arg) and hand the evaluation straight through.
#
# The module's default `package` is pkgs.dn-tool, so a consumer must also apply
# this repo's `dn-tool` overlay (or set services.dnclient.package explicitly).
{ pkgs, ... }@args:
let
  src = pkgs.callPackage ../../pkgs/dn-tool/src.nix { };
in
import "${src}/nix/module.nix" args
