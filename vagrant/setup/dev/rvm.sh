name="hkp://pool.sks-keyservers.net"
keys="409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB"

gpg --keyserver $name --recv-keys $keys && curl -sSL https://get.rvm.io | bash -s stable
