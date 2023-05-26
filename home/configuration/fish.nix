{config, libs, pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableFishIntegration = false; # we use jethrokuan/fzf instead
    defaultOptions = [
      "--color=bg+:#302D41,bg:#282828,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      export WLR_NO_HARDWARE_CURSORS=1
    '';

    plugins = with pkgs.fishPlugins; [
      { name = "grc"; src = grc.src; }
      { name = "fzf"; src = fzf-fish.src; }
      { name = "autopair.fish"; src = autopair-fish.src; }
      {
        name = "theme-clearance";
	src = pkgs.fetchFromGitHub {
	  owner = "oh-my-fish";
	  repo = "theme-clearance";
          rev = "10683bae6e8481b1ca4196b2079881ab1862fa97";
          sha256 = "r8/wT8PgJcE05UcxJR8ZRf9xBnDajmwKDOiD12TRWyk=";
        };
      }
    ];
  };
}
