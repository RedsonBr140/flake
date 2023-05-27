{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  swapDevices = [
  	{
  	  device = "/swapfile";
  	  size = 2048;
  	}
  ];
  zramSwap.enable = true;


  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    device = "/dev/sdg";
  };
  
  boot.tmp.cleanOnBoot = true;

  networking.hostName = "nixos";

  time.timeZone = "America/Recife";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  programs.fish.enable = true;

  programs.neovim = {
   enable = true;
   defaultEditor = true;
  };

  environment.variables.EDITOR = "nvim";

  users.users.redson = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nix-your-shell # Nix, respect my shell please :(
    micro # Cool editor wow
    lm_sensors # Nooo don't blow up
    htop # System stats
    neofetch # NixOS btw
    git # CVS was better

  ];

  security.doas = {
    enable = true;
    extraRules = [
      { groups = ["wheel"]; noPass = false; keepEnv = true; persist = true;}
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Wayland
  programs.sway.enable = true;
  xdg.portal.wlr.enable = true;

  # List services that you want to enable:

  services.jellyfin.enable = true;

  # Pipewire
  services.pipewire = {
    enable = true;
    audio.enable = true; # Use pipewire as the primary sound server

    # Wireplumber
    wireplumber.enable = true;

    # Server emulation
    alsa.enable = true;
    pulse.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

