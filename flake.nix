{
  description = "Development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; }
      {
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
        ];
        perSystem = { pkgs, lib, config, ... }: {
          devShells.default = pkgs.mkShell {
            name = "syscall";

            # dev tools
            nativeBuildInputs = with pkgs; [
              gnumake
              gcc
            ];

            buildInputs = with pkgs; [
              glibc
            ];
          };
        };
      };
}
