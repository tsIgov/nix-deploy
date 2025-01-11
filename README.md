# Nix Deploy

Used to deploy personal NixOS host and user configurations.

```bash
nix registry add nix-deploy "github:tsIgov/nix-deploy"
nix run nix-deploy#system -- igov
nix run nix-deploy#user -- igov@igov-pc
```