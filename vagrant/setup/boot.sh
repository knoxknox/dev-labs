# sh boot.sh

sh script/pip.sh
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

sh local/apt.sh
sh local/pip.sh

sh script/jvm.sh
sh script/rvm.sh
sh script/vim.sh

cp themes/vimrc ~/.vimrc
cp bash/prompt ~/.bash_prompt
cp bash/aliases ~/.bash_aliases
mkdir ~/.colout && cp themes/logs ~/.colout/colout_log.py
