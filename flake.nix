{
  description = "Test flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          defaultPackage = pkgs.runCommand "bar" { } ''
            echo "Result is" > $out
            uname -a >> $out
          '';
        }
      );
}
