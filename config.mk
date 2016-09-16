# st version
VERSION = 0.1

# paths
PREFIX = /usr/local

# osx
#X11INC = /usr/X11/include
#X11LIB = /usr/X11/lib
#FTINC  = ${X11INC}/freetype2

# linux
FTINC  = /usr/include/freetype2
X11INC = /usr/include/X11
X11LIB = /usr/lib

# includes and libs
INCS = -I${X11INC} -I${FTINC}
LIBS = -L${X11LIB} -lm -lX11 -lXft -lXrandr -lfontconfig -lcrypt -lutil

# flags
CFLAGS   += -g -std=c99 -pedantic -Os ${INCS} ${CPPFLAGS}
LDFLAGS  += -g ${LIBS}
CPPFLAGS += -DVERSION=\"${VERSION}\" \
			-D_DEFAULT_SOURCE \
			-D_BSD_SOURCE \
			-D_XOPEN_SOURCE=700 \
			-D_POSIX_C_SOURCE=20080

# Xinerama
CPPFLAGS += -DXINERAMA
LDFLAGS  += -lXinerama
