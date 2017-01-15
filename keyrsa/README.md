# keyrsa
SSH authentication with RSA.
- https://tools.ietf.org/html/rfc3447
- https://tools.ietf.org/html/rfc4252
- https://tools.ietf.org/html/rfc4253

Short introduction and key points.
- send a signature created with a private key of the user;
- server must check that the key is valid & signature is valid;
- if both hold, the request must be accepted, otherwise - rejected;
- passphrase can be used to encrypt private key at the client's host;
