# sh boot.sh

sh bin/apt.sh
sh dev/pip.sh
sh bin/pip.sh
sh dev/jvm.sh
sh dev/rvm.sh

mkdir -p ~/.vim/colors
cp home/.bash_prompt ~/.bash_prompt
cp home/.bash_aliases ~/.bash_aliases
echo 'source ~/.bash_prompt' >> ~/.bashrc

wget https://raw.githubusercontent.com/knoxknox/dotfiles/master/home/.vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/knoxknox/dotfiles/master/home/.vim/colors/hybrid.vim -P ~/.vim/colors
