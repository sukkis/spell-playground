# Edit this configuration file to define what should be installed on
    
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Allow unfree
      ./allow-unfree-configuration.nix
      # Docker examples
      # /home/USER_NAME/containers/docker_examples.nix -- didn't quite work, have to tweak something.
    ];

  boot = {
    # Enable setting font early, in initrd
    earlyVconsoleSetup = true;

    loader = {
      systemd-boot.enable = true;
      #efi.efiSysMountPoint = "/boot";
      efi.canTouchEfiVariables = true;
      # Tell where to place grub
      grub = {
        #enable = true;
        efiSupport = true;
        #efiInstallAsRemovable = true;
        #version = 2;
        #backgroundColor = "#e47ecd";
        #set root=(hd0,5); 
        device = "nodev";     
        #useOSProber = true;
        font = "/home/USER_NAME/Fonts/tifax_text.ttf";  
        fontSize = 36;
        #extraEntries = ''
        #  menuentry 'Ubuntu' {
        #    configfile (hd0,3)/boot/grub/grub.cfg
        #  }
        #'';
      };

      # Limit number of Grub entries
      # generic-extlinux-compatible.configurationLimit = 6;

    };

    # set kernel version
    #kernelPackages = pkgs.linuxPackages_4_15;
  };
  
  # STUFF FOR CONTAINERS

  fileSystems."/var/lib/containers/myweb/etc/nixos/config" = { 
    device = "/home/USER_NAME/.config/USER_NAME/configurations";
    options = [ "bind" ];
  };
 
  # NAT for containers to be able to connect out
  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
    externalInterface = "eth0";
    forwardPorts = [
      {destination = "10.233.1.2:80"; sourcePort = 80;}
    ];
  };
  
  networking.networkmanager.unmanaged = [ "interface-name:ve-*" ];

  # Enable Docker 
  virtualisation.docker.enable = true;

  networking.hostName = "sukkeli-nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Select internationalisation properties
  i18n = {
    consoleFont = "Lat2-Terminus16";
    #   consoleKeyMap = "us";
    consoleKeyMap = "fi";
    defaultLocale = "en_US.UTF-8";
  };
  # Set your time zone.
  time.timeZone = "Europe/Helsinki";
  
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [  
    gcc
    manpages
    wget 
    vim
    emacs 
    gitAndTools.gitFull
    rxvt_unicode
    screen
    unzip
    tree
    lsof
    alsaUtils
    ##############
    # containers #
    ##############
    #
    gosu                   # tool that avoids TTY and signal-forwarding behavior of sudo and su
    docker_compose
    xorg.xhost
    ###########
    # browser #
    ###########
    google-chrome    

    ######################
    # Xmonad and Haskell #
    ######################
    #
    # Haskell packages for Xmonad
    haskellPackages.xmonad
    haskellPackages.xmobar
    elmPackages.elm
    stack
    # Xmonad related
    dmenu                  # launching apps
    xscreensaver
    feh                    # background pictures
    scrot                  # screenshots
    # OCaml and other functional
    ocaml
    opam 
    ocamlPackages.utop 
    ocamlPackages.findlib 
    ocamlPackages.ounit
   # ocamlPackages.ocaml_batteries 
   # ocamlPackages.ocamlbuild  -- did not work installed this one outside config, from master branch
    ocamlPackages.js_of_ocaml-ocamlbuild
    ###############
    # Programming #
    ###############
    #
    openjdk8
    jetbrains.idea-community
    #android-studio   
    #androidsdk
    #androidsdk_extras
    apktool
    openal
    
    ruby
    # web development
    nodejs
    vscode-with-extensions
 
    # IRC and messaging
    irssi
    pidgin
    ############### 
    # Other utils #
    ###############
    #
    qpdfview               # viewing pdf documents
    htop                   # system performance overview 
    bonnie                 # hard drive and file system performance
    stress                 # workload generator, CPU, memory, I/O, disk
    wireshark              # network analyzer
    quota                  # set user quotas
    xclip
    xorg.xev               # findout key codes
    os-prober
    bluez                  # enable bluetoothctl cli

    spotify 

    ######### 
    # Games #
    #########
    #
    steam
    dosbox
    gnuchess
    xboard
    fairymax
    ######################
    # Linux From Scratch #
    ######################
    #
    gnumake
    bison2
    gnum4
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 443 8080 4505 4506 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.firewall.allowPing = true;

  # name for Digital Ocean droplet -- "fedora-docker-512"
  networking.extraHosts =
    ''
      139.59.153.198 docker.me
      172.17.0.2     my-apache-app.me
      10.233.1.2 myweb
    '';

  # Enable CUPS to print documents. Has Gnome3 dependency? Need to find another version.
  #services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "fi";
    xkbOptions = "eurosign:e";
    # Xmonad
    windowManager.xmonad.enable = true;
    windowManager.default = "xmonad";
    windowManager.xmonad.enableContribAndExtras = true;

    #desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    
    displayManager = {
      sessionCommands = ''
        xscreensaver -no-splash &
      '';    
    slim = {
        enable = true;
        defaultUser = "USER_NAME";
      };
    };
   
    
    # Monitor resolution - replace xrandr option from .bashrc
    resolutions = [ { x = 1600; y = 900; } ];
 
    # Enable touchpad support.
    libinput.enable = true;

    # Back up display and desktop managers
    # Enable the KDE Desktop Environment.
    #displayManager.sddm.enable = true;
    #desktopManager.plasma5.enable = true;
  };  


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.USER_NAME = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio" "video"
      "docker"
    ];
    uid = 1000;
    packages = [ pkgs.steam ];
  };

  # These are for Steam to run properly
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;

  # Bluetooth for iPhone stuff
  hardware.bluetooth.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?
}
