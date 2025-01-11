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
      host = import ./host { inherit pkgs; };
      user = import ./user { inherit pkgs; };
    };
  };
}
