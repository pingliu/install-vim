yum install lua lua-devel ncurses-devel gcc install python-devel ruby ruby-devel perl perl-devel perl-ExtUtils-Embed -y

# install LuaJIT-2.0.4
wget http://luajit.org/download/LuaJIT-2.0.4.tar.gz
tar -xzvf LuaJIT-2.0.4.tar.gz
cd LuaJIT-2.0.4
make -j `awk '/processor/{a++}END{print a}' /proc/cpuinfo` && make install && cd ..

# clone vim
git clone https://github.com/vim/vim.git
cd vim
./configure --prefix=/usr/local/vim7.4 --disable-selinux --enable-luainterp=yes --enable-fail-if-missing --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --enable-cscope --enable-gui=auto --enable-gtk2-check --enable-gnome-check --with-features=huge --with-luajit --with-x --with-python-config-dir=/usr/lib64/python2.7/config/ --with-tlib=ncurses 

make -j `awk '/processor/{a++}END{print a}' /proc/cpuinfo` && make install && cd ..
ln -sv /usr/local/lib/libluajit-5.1.so.2 /lib64/libluajit-5.1.so.2
echo "export PATH=/usr/local/vim7.4/bin:\$PATH" > /etc/profile.d/vim74.sh
source /etc/profile

vim --version|grep -Eo '\+(python|ruby|perl|lua)'


