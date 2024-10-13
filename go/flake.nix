{
  description = "A simple go template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    let
      lastModifiedDate = self.lastModifiedDate;
      version = builtins.substring 0 8 lastModifiedDate;
      supportedsystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarc64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supoprtedSystems;
      nixpkgsFor = forAllSystems ( system: import nixpkgs { inherit system; } );
    in
    {
      devShells = forAllSystems ( system: 
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              go
              gopls
              go-tools
              gotools
            ];
          };
        });
    };
  };
}
