mkdir ~/tmp
cd ~/tmp

# install autoconfig
curl -O http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz
tar xf autoconf-latest.tar.gz
cd autoconf-*/
./configure --prefix=/Users/john/local/
make
make install
cd ..

# install automake
curl -O http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
tar xf automake-1.14.tar.gz
cd automake-1.14
./configure --prefix=/Users/john/local/
make
make install
cd ..

# install emacs
git clone git://git.savannah.gnu.org/emacs.git
cd emacs
git checkout emacs-24
make configure
./configure --prefix=/Users/john/local/
make install
cd ..

# remove emacs that ships with osx
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs

# install node
git clone https://github.com/joyent/node.git
cd node
git checkout v0.10.33
./configure --prefix=/Users/john/local
make
make install
