#!/bin/sh

cd ~
rm .vimrc
rm .zshrc
ln -s configuration/.vimrc
ln -s configuration/.zshrc
