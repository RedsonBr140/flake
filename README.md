# ❄️ flake
:trollface: My NixOS &amp; home-manager configurations.

My setup is following: I have one single machine with only one user. That's why this flake may seem too simple for you, but it works for me.

## Installing
```bash
nixos-rebuild switch --flake .#nixos

#If you're still on a live installation medium, run the following instead, and reboot.
nixos-install --flake .#nixos
```
