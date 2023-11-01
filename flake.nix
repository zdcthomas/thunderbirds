# in flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  description = "Quartz static site";
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        overlays = [];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in {
        devShells =
          nixpkgs.lib.attrsets.mapAttrs' (name: value: {
            name = "one_" + name;
            value = value;
          }) {
            rust = import ./one/rust.nix {inherit pkgs;};
          };
        templates =
          nixpkgs.lib.attrsets.mapAttrs' (name: value: {
            name = "two_" + name;
            value = value;
          }) {
            rust = {
              path = ./two/rust;
              description = "Rust thunderbird two template";
            };
            elixir = {
              path = ./two/elixir;
              description = "Elixir thunderbird two template";
            };
            ts = {
              path = ./two/ts;
              description = "Typescript and node thunderbird two template";
            };
          };
      }
    );
}
