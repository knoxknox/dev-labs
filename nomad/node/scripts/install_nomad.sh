echo "Downloading nomad"
cd /tmp && curl -s https://releases.hashicorp.com/nomad/0.12.1/nomad_0.12.1_linux_amd64.zip -o nomad.zip

echo "Installing nomad"
unzip nomad.zip
chmod +x nomad
mkdir /etc/nomad.d
chmod a+w /etc/nomad.d
mv nomad /usr/bin/nomad
