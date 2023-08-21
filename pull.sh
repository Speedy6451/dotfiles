#!/bin/sh

for synced in `cat synced`; do
    echo -n $synced...
    mkdir -p `dirname -- $synced`
    cp $HOME/$synced .
    echo done
done
