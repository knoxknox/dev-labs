# chef

Run `make build` to create `base_chef` image.<br/>
This image contains pre-installed `chef` and `berkshelf`.

Next run `make test` to create container for test purposes.<br/>
Inside the container run `sh bin/chef.sh` to run cookbook recipes.
