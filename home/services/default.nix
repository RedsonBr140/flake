{ inputs, libs, config, pkgs, ... }: {
  services.syncthing = {
    enable = true;
    tray.enable = false;
  };
}
