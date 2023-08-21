#!/bin/sh

prefix="--prefix .config/nvim https://github.com/Speedy6451/init.vim.git master"
twoplus=`echo $@ | tr ' ' '\n' | tail -n +2 - | tr '\n' ' '`
git subtree $1 $prefix $twoplus 
