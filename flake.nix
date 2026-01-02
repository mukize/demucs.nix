{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python3 = pkgs.python3.override {
          packageOverrides = self: super: {
            demucs = self.callPackage ./pkgs/demucs.nix { };
            openunmix = self.callPackage ./pkgs/openunmix.nix { };
            dora-search = self.callPackage ./pkgs/dora-search.nix { };
            lameenc = self.callPackage ./pkgs/lameenc.nix { };
            treetable = self.callPackage ./pkgs/treetable.nix { };
          };
        };
      in
      {
        packages.demucs = python3.pkgs.toPythonApplication python3.pkgs.demucs;
      }
    );
}
