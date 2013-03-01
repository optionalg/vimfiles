#!/bin/bash

function update() {
    type=$1
    command=${@:1}
    for dir in *.$type; do
        if [ ! -d "$dir" ]; then
            continue
        fi
        echo -e "\e[1;33mupdate:\e[1;36m${dir}\$\e[0m" "$command"
        cd $dir
        $command
        cd ..
        echo
    done
}

(
    cd ~/.vim/bundle
    update git pull --rebase
    update hg pull
    update svn update
)
