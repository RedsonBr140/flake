{ inputs, libs, config, pkgs, ... }: {
  imports = [];

  nixpkgs = {
  overlays = [];

  config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
  };

  home.username = "redson";
  home.homeDirectory = "/home/redson";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Redson";
    userEmail = "redson@riseup.net";

    signing = {
      key = "A55CD2880240ABD7"
      signByDefault = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
