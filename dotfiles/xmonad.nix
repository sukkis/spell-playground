# Xmonad-related configuration on system level.
{ config, pkgs, ...}:
{
services.xserver = {
  enable = true;
  layout = "fi";
  # Xmonad
  windowManager.xmonad.enable = true;
  windowManager.xmonad.enableContribAndExtras = true;
  
  displayManager = {
    defaultSession = "none+xmonad";
    sessionCommands = ''
      xscreensaver -no-splash &
    '';
  };
  # replaces xrandr options from .bashrc
  resolutions = [ { x = 1440; y = 900; } ];

  # Enable toubpad support.
  libinput.enable = true;
};
}
