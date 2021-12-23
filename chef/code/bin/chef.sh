#!/bin/bash

cd /code/cookbooks/base-cookbook/
berks vendor /tmp/cookbooks/ --delete
chef-solo -o 'base-cookbook::default' -E stage -c /code/bin/settings.rb
