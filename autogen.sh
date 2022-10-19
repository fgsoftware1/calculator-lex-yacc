#!/bin/sh
aclocal
autoscan
automake --add-missing
autoconf
./configure
make