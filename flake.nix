{
  description = "Funzen development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          name = "funzenxyz-dev";

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
      };
    };
}
