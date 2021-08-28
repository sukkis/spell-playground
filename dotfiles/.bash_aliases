# work VPN setup

# Run as underprivileged user. Then Okta login, then sudo password.
alias work-vpn='gp-saml-gui -P --gateway gp-vpn1.work.fi'
alias work-vpn2='gp-saml-gui -P --gateway gp-vpn2.work.fi'

# Knowledge base
#alias kb='/home/$USER/kb/kb2.sh 2> /dev/null'
alias kb='python3 /home/$USER/code/python/search/search.py'
alias kbemacs='/home/$USER/kb/kb2.sh 2> /dev/null | emacsclient ~/temp/kb/search'

# Development tools
alias pycharm='cd /opt/pycharm-*/bin;sh pycharm.sh'
alias robocop-docker='docker run -v $PWD:/home/code -it robocop:latest bash'
alias emc='emacsclient'

# Sandboxing spyware
alias facebook='nix-shell -p firefox --run "firefox -private -url facebook.com"'
alias google='nix-shell -p firefox --run "firefox -private -url www.google.com"'

# Dynamic terminal colours
export PATH="$HOME/.dynamic-colors/bin:$PATH"

# Pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
