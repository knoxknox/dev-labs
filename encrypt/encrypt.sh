#!/bin/bash

user=$1

if [ -z "$user" ]
then
  echo "User is empty"
else
  echo "Encrypt data for $user"
  curl -s https://github.com/$user.keys > $user.key
  ssh-keygen -e -m PKCS8 -f $user.key > $user.pubkey
  openssl rsautl -encrypt -pubin -inkey $user.pubkey -in secrets.txt -out secrets.sec

  rm $user.key $user.pubkey
  echo "Use next command to decrypt data:"
  echo "openssl rsautl -decrypt -inkey {private.pem} -in secrets.sec -out secrets.txt"
fi
