# install

First time setup:
```
$ mkdir -p $HOME/workspace/src
$
$ cd $HOME/workspace
$ git clone <project>
$ sh src/scripts/setup.sh
```

Check your profile:
```
$ cat ~/.profile
> ...
> export GOROOT="/usr/local/go"
> export GOPATH="$HOME/workspace"
> export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"
```

Example of project structure:
```
$ echo $HOME
> /home/ubuntu

$ tree ~/workspace
> └── src
>     ├── app
>     │   ├── main
>     │   │   └── main.go
>     │   └── version
>     │       └── version.go
>     └── scripts
>         └── setup.sh
>     │   ├── Makefile
>     │   ├── Gopkg.toml
```
