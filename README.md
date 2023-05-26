# ❄️ flake
:trollface: My NixOS &amp; home-manager configurations.

My setup is following: I have one single machine with only one user. That's why this flake may seem too simple for you, but it works for me.

## Installing
```bash
nixos-rebuild switch --flake .#nixos

# If you don't have home-manager yet:
nix shell nixpkgs#home-manager

# And then, just use it as normal.
home-manager switch --flake .#redson@nixos
