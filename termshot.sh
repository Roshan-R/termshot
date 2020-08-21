#!/bin/bash

Help()
{
    echo "term2img - Record application output and convert to image"
    echo
    echo "Syntax: term2img executable outputimage"
    echo
    echo "executable  : path to the executable file"
    echo "outputimage : Name of the ouput image file"
}

installed=$(which converasl)

if [[ -z "$installed" ]];then
    echo
    echo "make sure imagemagick is installed"
fi


if [[ $# != 2 ]];then
    Help
else
    script -c "$1" -O tmp
    cat tmp | sed -e "s/[^M^]^A^H^[^G]//g" | sed "1d" | sed "$ d" | convert label:@- "$2"
    rm tmp
fi
