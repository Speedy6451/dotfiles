#!/bin/sh

for synced in `cat synced`; do
    echo -n $synced...
    dir=`dirname -- $synced`
    mkdir -p $HOME/$dir
    cp $synced $HOME/$dir
    echo done
done
