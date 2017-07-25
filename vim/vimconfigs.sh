cd $HOME/vim/src

./configure --prefix=$HOME/bin/vim/ \
            --with-features=huge \
            --enable-pythoninterp=yes \
            --with-python2-config-dir=/usr/bin/python2 \
            --enable-python3interp=yes \
            --with-python3-config-dir=/opt/anaconda3/bin/python \
            --enable-perlinterp=yes

make install
