#/bin/bash
sudo apt-get install molly-guard vim python-setup-tools tmux zsh
sudo easy_install pip
sudo pip install ipython

chsh -s /bin/zsh $(whoami)

vim +PluginInstall +qall

