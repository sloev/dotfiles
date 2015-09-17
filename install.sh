#/bin/bash
sudo apt-get install molly-guard vim python-setuptools tmux zsh
echo "installing pip"
sudo easy_install pip
echo "pip installing ipython termcolor"
sudo pip install ipython termcolor

echo "changing shell to zsh"
chsh -s /bin/zsh $(whoami)
echo "cloning vundlevim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "installing vim plugins"
vim +PluginInstall +qall

echo "trying to copy all dotfiles to root"

cp -r .* ~/ 2>/dev/null

echo "install done!!!"
