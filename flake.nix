# in flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  description = "Quartz static site";
  outputs = {nixpkgs, ...}: {
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
  };
}
