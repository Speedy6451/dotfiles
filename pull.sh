#!/bin/sh

for synced in `cat synced`; do
    echo -n $synced...
    dir=`dirname -- $synced`
    mkdir -p $dir
    cp $HOME/$synced $dir
    echo done
done
