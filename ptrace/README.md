# ptrace

Example of shell code injection.<br/>
See: http://man7.org/linux/man-pages/man2/ptrace.2.html

Build asm to shellcode: `make shell`<br/>
Compile C sources into /tmp folder: `make compile`<br/>
Run `/tmp/target` and inject shell `/tmp/infect $(pgrep target)`

Install nasm:
```
wget http://security.ubuntu.com/ubuntu/pool/main/n/nasm/nasm_2.10.09-1ubuntu0.1_amd64.deb
sudo dpkg -i nasm_2.10.09-1ubuntu0.1_amd64.deb && rm nasm_2.10.09-1ubuntu0.1_amd64.deb && nasm -v
```
