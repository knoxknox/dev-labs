cd /tmp
wget https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go1.11.2.linux-amd64.tar.gz

echo 'export GOROOT="/usr/local/go"' >> $HOME/.profile
echo 'export GOPATH="$HOME/workspace"' >> $HOME/.profile
echo 'export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"' >> $HOME/.profile
