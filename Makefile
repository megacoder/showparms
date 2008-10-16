PREFIX	=/opt
BINDIR	=${PREFIX}/bin

all::	showparms

check::	showparms
	sudo /sbin/modprobe qla2xxx
	./showparms /sys/module/qla2xxx/ql*
	-sudo /sbin/modprobe -r qla2xxx 1>/dev/null 2>&1

clean::

distclean clobber:: clean

install:: showparms
	install -D -c showparms ${BINDIR}/showparms

uninstall::
	${RM} ${BINDIR}/showparms
