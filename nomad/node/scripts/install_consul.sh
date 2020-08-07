echo "Downloading consul"
cd /tmp && curl -s https://releases.hashicorp.com/consul/1.8.1/consul_1.8.1_linux_amd64.zip -o consul.zip

echo "Installing consul"
unzip consul.zip
chmod +x consul
mkdir /etc/consul.d
chmod a+w /etc/consul.d
mv consul /usr/bin/consul
