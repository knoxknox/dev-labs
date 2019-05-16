##
# Script for project initialization.
#
# Usage:
# > git clone <PROJECT_URL> /tmp/project
# > sh /tmp/project/goimc/scripts/setup.sh
#
cd /tmp
mkdir -p $HOME/workspace/src
mv /tmp/project/goimc/* $HOME/workspace/src

wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go1.12.5.linux-amd64.tar.gz

echo 'export GOROOT="/usr/local/go"' >> $HOME/.profile
echo 'export GOPATH="$HOME/workspace"' >> $HOME/.profile
echo 'export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"' >> $HOME/.profile
