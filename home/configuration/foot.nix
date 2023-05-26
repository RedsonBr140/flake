{config, libs, pkgs, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "UbuntuMono Nerd Font Mono:size=12";
	dpi-aware = "yes";
      };

      # Gruvbox dark
      colors = {
        background = "282828";
        foreground = "ebdbb2";
        regular0 = "282828";
        regular1 = "cc241d";
        regular2 = "98971a";
        regular3 = "d79921";
        regular4 = "458588";
        regular5 = "b16286";
        regular6 = "689d6a";
        regular7 = "a89984";
        bright0 = "928374";
        bright1 = "fb4934";
        bright2 = "b8bb26";
        bright3 = "fabd2f";
        bright4 = "83a598";
        bright5 = "d3869b";
        bright6 = "8ec07c";
        bright7 = "ebdbb2";
      };

      cursor = {
        style = "beam";
	blink = "yes";
	beam-thickness = "1.5";
      };
    };
  };
}
