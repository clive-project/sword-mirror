#!/bin/sh

OPTIONS="--prefix=/usr $OPTIONS"
#OPTIONS="--disable-shared $OPTIONS"
OPTIONS="--without-conf $OPTIONS"
OPTIONS="--sysconfdir=/etc $OPTIONS"
#OPTIONS="--with-icu $OPTIONS"
#OPTIONS="--with-vcl $OPTIONS"
#OPTIONS="--enable-debug $OPTIONS"
#OPTIONS="--enable-profile $OPTIONS"
#OPTIONS="--with-lucene $OPTIONS"
#OPTIONS="--enable-tests $OPTIONS"


CPPFLAGS="$CFLAGS $CPPFLAGS -DUSBINARY" ./configure $OPTIONS $*

echo ""
echo ""
echo ""
echo "Configured to NOT write a global /etc/sword.conf on 'make install'."
echo "If this is the first time you've installed sword, be sure to run"
echo "'make install_config' if you would like a basic configuration installed"
echo ""
echo "Next you might try something like: "
echo ""
echo "make"
echo "su"
echo "make install"
echo "(and optionally)"
echo "make install_config"
echo "make register"
echo ""
echo ""
echo ""
