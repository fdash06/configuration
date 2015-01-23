#!/bin/sh

cd ~/configuration
sed -i -e 's/cyan/asdasd/g' .zshrc
sed -i -e 's/green/cyan/g' .zshrc
sed -i -e 's/asdasd/green/g' .zshrc
if [ -e .zshrc-e ]; then
    rm .zshrc-e
fi
