{
  description = "Tiko frontend: Angular 21 LTS / Node.js 24";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "tiko-frontend";
        packages = with pkgs; [
          nodejs_24
          git
          curl
          jq
        ];
        shellHook = ''
          echo "tiko-frontend: Node $(node --version), npm $(npm --version)"
          echo "  npm install"
          echo "  npm start                     # http://localhost:4200"
          echo "  npm run build"
          echo "  npm test"
        '';
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
