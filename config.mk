# st version
VERSION = 0.1

# paths
PREFIX = /usr/local

# basic os detection
ifeq ("$(shell uname)","Darwin")
	# osx
	X11INC = /usr/X11/include
	X11LIB = /usr/X11/lib
	FTINC  = ${X11INC}/freetype2
	LIBS   = -L${X11LIB} -lm -lX11 -lXft -lXrandr -lfontconfig
else
	# linux
	X11INC = /usr/include/X11
	X11LIB = /usr/lib
	FTINC  = /usr/include/freetype2
	LIBS   = -L${X11LIB} -lm -lX11 -lXft -lXrandr -lfontconfig -lcrypt -lutil
endif

# includes and libs
INCS = -I${X11INC} -I${FTINC}

# flags
CFLAGS   += -g -std=c99 -pedantic -Os ${INCS} ${CPPFLAGS}
LDFLAGS  += -g ${LIBS}
CPPFLAGS += -DVERSION=\"${VERSION}\" \
			-D_DEFAULT_SOURCE \
			-D_BSD_SOURCE \
			-D_XOPEN_SOURCE=700 \
			-D_POSIX_C_SOURCE=20080

# xinerama
CPPFLAGS += -DXINERAMA
LDFLAGS  += -lXinerama
