{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.05;

  outputs = { self, nixpkgs }:

    let

      systems = [ "x86_64-linux" "x86_64-darwin" ];

      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

    in {

      packages = forAllSystems (system: {

        default =
          with import nixpkgs { inherit system; };

          stdenv.mkDerivation {
            name = "nix-book";

            src = ./.;

            buildInputs =
              [ mdbook
              ];

            buildPhase =
              ''
                RUST_LOG=warn mdbook build . -d $out/share/doc/nix-book
              '';

            installPhase = "true";

          };

      });

    };

}
