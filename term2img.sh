#!/bin/bash

script -c $1 -O tmp
cat tmp | sed -e "s/[^M^]^A^H^[^G]//g" | sed "1d" | sed "$ d" | convert label:@- output.png
rm tmp
