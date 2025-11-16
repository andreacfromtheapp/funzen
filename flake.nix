{
  description = "Funzen development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        name = "funzenblog-dev";

        buildInputs = with pkgs; [
          zola
          starship
        ];

        shellHook = ''
          eval "$(starship init bash)"
          cat <<- EOF

          Funzen.xyz development environment :)

          Quick start:
            pre-commit install  # Set up code quality hooks
            zola serve          # Start development server

          EOF
        '';
      };
    });
}
