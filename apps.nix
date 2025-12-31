{ config, pkgs, ... }:

{

  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
      limit_fps = 165;
    };
  };

  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kate
    signal-desktop
    filezilla
    spotify
    vesktop
    joplin-desktop
    pcmanfm

  ];
}
