echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

asdf plugin add ruby   # install ruby with `asdf install ruby {version}`
asdf plugin add java   # install java with `asdf install java {version}`
asdf plugin add nodejs # install nodejs with `asdf install nodejs {version}`
asdf plugin add python # install python with `asdf install python {version}`
asdf plugin add golang # install golang with `asdf install golang {version}`
asdf plugin add elixir # install elixir with `asdf install elixir {version}`
asdf plugin add erlang # install erlang with `asdf install erlang {version}`
