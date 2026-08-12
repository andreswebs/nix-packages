{
  # Mirrors dn-tool's own nix/overlay.nix, but pinned to the same commit as the
  # NUR package via the shared src.nix. Applying this makes `pkgs.dn-tool`
  # resolve against the consumer's nixpkgs, which the services.dnclient module
  # (nixosModules.dnclient) relies on for its default `package`.
  dn-tool = final: _prev: {
    dn-tool = final.callPackage "${final.callPackage ../pkgs/dn-tool/src.nix { }}/nix/package.nix" { };
  };
}
