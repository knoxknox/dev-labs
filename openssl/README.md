# openssl

OpenSSL cheat sheet.

```sh
# show version
openssl version

# ssl/tls client
openssl s_client -connect example.com:443
```

```sh
# ca - create certificate authorities
# dgst - compute hash functions
# password - generation of "hashed passwords"
# rand - generation of pseudo-random bit strings
# rsa - rsa data management
# genrsa - generate a pair of public/private keys
# rsautl - encrypt/decrypt or sign/verify signature
# enc - encrypt/decrypt using secret key algorithms
# verify - checkings for X509
# x509 - data managing for X509
# pkcs7 - manage information according to the PKCS#7 standard
# pkcs12 - manage information according to the PKCS#12 standard
openssl list-standard-commands
```

```sh
# base64 encode
cat document.txt | openssl enc -base64 -e

# base64 decode
cat document.txt | openssl enc -base64 -d
```

```sh
# sha256
cat document.txt | openssl dgst -sha256

# sha256 as binary
cat document.txt | openssl dgst -sha256 -binary
```

```sh
# generate ca private key
openssl genrsa -des3 -out ca.key 4096

# generate certificate signing request
openssl req -new -key ca.key -out ca.csr

# generate self-signed certificate using private key
openssl req -new -x509 -days 365 -key ca.key -out ca.crt

# view certificate content
openssl x509 -text -in ca.crt

# view private and public keys
openssl rsa -noout -text -in server.key
openssl x509 -noout -text -in server.crt
```

```sh
# decrypt symmetric
cat document.sec | openssl enc -aes-256 -d -k mypassword

# encrypt symmetric
cat document.txt | openssl enc -aes-256 -e -k mypassword -out document.sec
```

```sh
# generate private key
openssl genrsa -des3 -out privkey.pem 4096

# generate public key from private
openssl rsa -in privkey.pem -pubout -out pubkey.pem

# How to use keys:
# sign = private key, verify = public key
# encrypt = public key, decrypt = private key

# sign
openssl dgst -sha256 -sign privkey.pem -out document.sig document.txt

# verify
openssl dgst -sha256 -verify pubkey.pem -signature document.sig document.txt

# decrypt
openssl rsautl -decrypt -inkey privkey.pem -in document.sec -out document.txt

# encrypt
openssl rsautl -encrypt -pubin -inkey pubkey.pem -in document.txt -out document.sec
```

Resources:
- https://en.wikipedia.org/wiki/X.509
- https://github.com/augustl/ruby-openssl-cheat-sheet
- https://jamielinux.com/docs/openssl-certificate-authority
