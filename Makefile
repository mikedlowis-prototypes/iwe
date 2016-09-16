include config.mk

.PHONY: all install clean

all: dmenu/dmenu dmenu/stest dwm/dwm slock/slock st/st

install:
	#cp dmenu/dmenu ${PREFIX}/bin/
	#cp dmenu/dmenu_run ${PREFIX}/bin/
	#cp dmenu/dmenu_patches ${PREFIX}/bin/

.c.o:
	${CC} -c -o $@ ${CFLAGS} $<

.o:
	${CC} -o $@ $^ ${LDFLAGS}

dmenu/dmenu.o: dmenu/config.h
dmenu/stest.o: dmenu/config.h
dmenu/config.h: config/dmenu.h
	cp $^ $@

dwm/dwm.o: dwm/config.h
dwm/config.h: config/dwm.h
	cp $^ $@

slock/slock.o: slock/config.h
slock/config.h: config/slock.h
	cp $^ $@

st/st.o: st/config.h
st/config.h: config/st.h
	cp $^ $@

dmenu/dmenu: dmenu/dmenu.o dmenu/drw.o dmenu/util.o
dmenu/stest: dmenu/stest.o
dwm/dwm: dwm/drw.o dwm/dwm.o dwm/util.o
slock/slock: slock/slock.o slock/explicit_bzero.o
st/st: st/st.o

clean:
	${RM} dmenu/dmenu dmenu/stest dwm/dwm slock/slock st/st */*.o */config.h
