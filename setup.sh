#!/bin/sh

cd ~
rm .vimrc
rm .zshrc
rm .tigrc
\rm -rf .vim
\rm -rf .zsh
ln -s configuration/.vimrc
ln -s configuration/.zshrc
ln -s configuration/.vim
ln -s configuration/.zsh
ln -s configuration/.tigrc
