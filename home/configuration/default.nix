{ inputs, libs, config, pkgs, ... }: {

  imports = [
    ./fish.nix
    ./foot.nix
    ./sway
  ];

  home.packages = with pkgs; [
    grc # dependency for fish plugin

    waybar
    firefox
    wofi
    mako
    grim
    slurp

    prismlauncher
    glfw-wayland
  ];

  programs.git = {
    enable = true;
    userName = "Redson";
    userEmail = "redson@riseup.net";

    signing = {
      key = "A55CD2880240ABD7";
      signByDefault = true;
    };
  };
}
