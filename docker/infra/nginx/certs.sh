#!/bin/bash

path="$(dirname $0)/certs"

##
# Root Certificate Authority
#
echo 'Generate root private key'
openssl genrsa -out "$path/ca.key" 4096

echo 'Generate root certificate'
subject="/C=US/O=Development/CN=local"
openssl req -new -x509 -sha256 -days 3650 -subj $subject -key "$path/ca.key" -out "$path/ca.pem"

##
# Certificate signed with Root CA
#
echo 'Generate server private key'
openssl genrsa -out "$path/dev.key" 4096

echo 'Generate certificate signing request'
subject="/C=US/O=Development/CN=development"
openssl req -new -subj $subject -key "$path/dev.key" -out "$path/dev.csr"

echo 'Generate certificate signed by root (3 years)'
openssl x509 -req -sha256 -days 1095 -CA "$path/ca.pem" -CAkey "$path/ca.key" -CAcreateserial -in "$path/dev.csr" -out "$path/dev.crt"
