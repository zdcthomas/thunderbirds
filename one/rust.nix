{pkgs}:
with pkgs;
  mkShell {
    buildInputs = [
      cargo
      rustc
      rustfmt
      pre-commit
      rustPackages.clippy
      rust-analyzer
    ];
    RUST_SRC_PATH = rustPlatform.rustLibSrc;
  }
