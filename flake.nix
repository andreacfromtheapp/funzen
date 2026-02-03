{
  description = "Zola development environment";

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

      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShell {
          name = "zola-dev";

          buildInputs = with pkgs; [
            zola
            taplo
            pre-commit
            starship
          ];

          shellHook = ''
            eval "$(starship init bash)"
            cat <<- EOF

            Zola development environment :)

            EOF
          '';
        };
      };
    };
}
