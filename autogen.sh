#! /bin/bash
aclocal
automake --add-missing
autoconf
./configure
make
