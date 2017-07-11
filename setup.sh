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
git clone https://github.com/itchyny/lightline.vim.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/vim-syntastic/syntastic.git
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
rm snippets
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
# }}}
# vim: set foldmethod=marker foldlevel=0:
