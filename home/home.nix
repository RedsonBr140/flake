{ inputs, libs, config, pkgs, ... }: {
  imports = [
    ./configuration
  ];

  nixpkgs = {
  overlays = [ inputs.prismlauncher.overlays.default ];

  config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
  };

  home.username = "redson";
  home.homeDirectory = "/home/redson";

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
