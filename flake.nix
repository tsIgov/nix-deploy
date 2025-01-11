{
  description = "Aether desktop environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }: 
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in 
  {
    packages."x86_64-linux" = {
      system = import ./system { inherit pkgs; };
      user = import ./user { inherit pkgs; };
    };
  };
}
