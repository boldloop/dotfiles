# Preamble {{{
# Author: Gus Brocchini

# This file's purpose is to setup new computers with all the goodies
# that I want.
# It does the following:
    # clones plugins
    # symlinks folders
    # probably more later
# }}}
# vim plugins {{{
rm -rf $HOME/.vim/bundle
mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle
echo "starting vim plugin clones"
git clone -q https://github.com/itchyny/lightline.vim.git
git clone -q https://github.com/ervandew/supertab.git
git clone -q https://github.com/SirVer/ultisnips.git
git clone -q https://github.com/vim-syntastic/syntastic.git
git clone -q https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update -q --init --recursive
cd $HOME
if [[ ! -d "ycm_build" ]]
    then
    mkdir -p ycm_build
    cd ycm_build
    rm *
    cmake -G "Unix Makefiles" . \
                        ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make
fi
echo "finished plugin clones"
# }}}
# local config checks {{{
# bashrc {{{
cd $HOME
if [[ -h .bashrc ]]
then
    if [[ $(readlink .bashrc) = "git/dotfiles/bash/bashrc" ]]
    then
        :
    elif [[ $(readlink .bashrc) = "$HOME/git/dotfiles/bash/bashrc" ]]
    then
        :
    else
        bash_pointer="# reference personal bashrc\n"
        bash_pointer+="if [ -f $HOME/git/dotfiles/bash/bashrc ]\n"
        bash_pointer+="then\n"
        bash_pointer+="    . $HOME/git/dotfiles/bash/bashrc\n"
        bash_pointer+="fi"
        if grep -q "$bash_pointer" .bashrc
        then
            :
        else
            echo "$bash_pointer" >> .bashrc
        fi
    fi
elif [[ -a .bashrc ]]
then
    if grep -q "$bash_pointer" .bashrc
    then
        :
    else
        echo "$bash_pointer" >> .bashrc
    fi
    echo "$bash_pointer" >> .bashrc
else
    ln -s git/dotfiles/bash/bashrc $HOME/.bashrc
fi
# }}}
# vimrc {{{
cd $HOME
if [[ -h .vimrc ]]
then
    if [[ $(readlink .vimrc) = "git/dotfiles/vim/vimrc" ]]
    then
        :
    elif [[ $(readlink .vimrc) = "$HOME/git/dotfiles/vim/vimrc" ]]
    then
        :
    else
        vim_pointer+="\" reference personal vimrc\n"
        vim_pointer+="source git/dotfiles/vim/vimrc"
        if grep -q "$vim_pointer" .vimrc
        then
            :
        else
            echo "$vim_pointer" >> .vimrc
        fi
    fi
elif [[ -a .vimrc ]]
then
    if grep -q "$vim_pointer" .vimrc
    then
        :
    else
        echo "$vim_pointer" >> .vimrc
    fi
else
    ln -s git/dotfiles/vim/vimrc $HOME/.vimrc
fi
# }}}
# }}}
# symlinks {{{
cd $HOME/.vim/
if [[ -a snippets ]]
    then
    rm snippets
fi

if [[ -h UltiSnips ]]
    then
    if [[ $(readlink UltiSnips) = ../git/dotfiles/vim/UltiSnips ]]
    then
        :
    else
        rm UltiSnips
        ln -s ../git/dotfiles/vim/UltiSnips .
    fi
else
    rm UltiSnips
    ln -s ../git/dotfiles/vim/UltiSnips .
fi

mkdir -p after

cd after

if [[ -h ftplugin ]]
    then
    if [[ $(readlink ftplugin) = ../../git/dotfiles/vim/ftplugin ]]
    then
        :
    else
        rm ftplugin
        ln -s ../../git/dotfiles/vim/ftplugin .
    fi
else
    rm -r ftplugin
    ln -s ../../git/dotfiles/vim/ftplugin .
fi
# }}}
# vim: set foldmethod=marker foldlevel=0:
