# Single source of truth for the dn-tool checkout, shared by the package
# (pkgs/dn-tool), the overlay (overlays), and the NixOS module (nixos-modules).
# Pinned to a release tag; bump rev + hash (and the version in default.nix)
# together on upgrade.
{ fetchFromGitHub }:
fetchFromGitHub {
  owner = "andreswebs";
  repo = "dn-tool";
  rev = "v0.0.3";
  hash = "sha256-TDBkE4BRqnOeguOnFUCXaPqLzfjAIZIelJvFp+C0xxQ=";
}
