#!/bin/bash

for i in $(objdump -d shell | grep "^ " | cut -f2); do echo -n '\x'$i; done; echo
