#/bin/bash
sudo apt-get install git molly-guard vim python-setup-tools tmux zsh
sudo easy_install pip
sudo pip install ipython

chsh -s /bin/zsh $(whoami)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

echo "trying to copy all dotfiles to root"

cp -r .* ~/ 2>/dev/null
