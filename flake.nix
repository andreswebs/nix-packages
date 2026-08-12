{
  description = "andreswebs NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      legacyPackages = forAllSystems (system: import ./default.nix {
        pkgs = import nixpkgs { inherit system; };
      });
      packages = forAllSystems (system:
        let
          platform = nixpkgs.lib.systems.elaborate system;
        in
        nixpkgs.lib.filterAttrs
          (_: v: nixpkgs.lib.isDerivation v && nixpkgs.lib.meta.availableOn platform v)
          self.legacyPackages.${system});
      nixosModules = import ./nixos-modules;
      # homeModules = import ./home-modules;
      # darwinModules = import ./darwin-modules;
      # flakeModules = import ./flake-modules;
    };
}
