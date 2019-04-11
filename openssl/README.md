# openssl

OpenSSL cheat sheet.

```
# version
openssl version
```

```
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

```
# base64 encode
cat document.txt | openssl enc -base64 -e

# base64 decode
cat document.txt | openssl enc -base64 -d
```

```
# sha256
cat document.txt | openssl dgst -sha256

# sha256 as binary
cat document.txt | openssl dgst -sha256 -binary
```

```
# decrypt symmetric
cat document.sec | openssl enc -des -d -k mypassword

# encrypt symmetric
cat document.txt | openssl enc -des -e -k mypassword -out document.sec
```

```
# generate private key
openssl genrsa -des3 -out privkey.pem 4096

# generate public key from private
openssl rsa -in privkey.pem -pubout -out pubkey.pem

# sign
openssl dgst -sha256 -sign privkey.pem -out document.sig document.txt

# verify
openssl dgst -sha256 -verify pubkey.pem -signature document.sig document.txt

# decrypt
openssl rsautl -decrypt -inkey privkey.pem -in document.sec

# encrypt
openssl rsautl -encrypt -pubin -inkey pubkey.pem -in document.txt -out document.sec
```

Resources:
- https://en.wikipedia.org/wiki/X.509
- https://github.com/augustl/ruby-openssl-cheat-sheet
- https://jamielinux.com/docs/openssl-certificate-authority
