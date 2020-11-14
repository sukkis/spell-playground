with import <nixpkgs> {};

vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = ''
      syntax enable
      set backspace=indent,eol,start  
    '';
    # Use the default plugin list shipped with nixpkgs
    vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
    vimrcConfig.vam.pluginDictionaries = [
        { names = [
            # Here you can place all your vim plugins
            # They are installed managed by `vam` (a vim plugin manager)
            "Syntastic"
            "ctrlp"
            "hlint-refactor-vim"
            "vim-stylish-haskell"
            "vim-nix"
            "elm-vim"
            "vim-javascript"
        ]; }
    ];
}
