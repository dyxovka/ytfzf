PROG=ytfzf
PREFIX=/usr/local
BINDIR=${PREFIX}/bin
DOCDIR=${PREFIX}/share/doc/ytfzf
MANDIR=${PREFIX}/share/man
LICENSEDIR=${PREFIX}/share/licenses/ytfzf

YTFZF_SYSTEM_ADDON_DIR=${PREFIX}/share/ytfzf/addons

.DEFAULT_GOAL := default

all: lololoppo

default: install doc

doc:
	mkdir -p ${DESTDIR}${MANDIR}/man1
	mkdir -p ${DESTDIR}${MANDIR}/man5
	mkdir -p ${DESTDIR}${DOCDIR}
	mkdir -p ${DESTDIR}${LICENSEDIR}
	chmod 644 docs/man/ytfzf.1 docs/man/ytfzf.5 docs/conf.sh LICENSE
	cp docs/man/ytfzf.1 ${DESTDIR}${MANDIR}/man1
	cp docs/man/ytfzf.5 ${DESTDIR}${MANDIR}/man5
	cp docs/conf.sh ${DESTDIR}${DOCDIR}
	cp LICENSE ${DESTDIR}${LICENSEDIR}

install:
	chmod 755 ${PROG}
	mkdir -p ${DESTDIR}${BINDIR}
	cp ${PROG} ${DESTDIR}${BINDIR}/${PROG}

addons:
	chmod 755 addons/*/*
	mkdir -p ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}
	cp -r addons/interfaces ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}
	cp -r addons/scrapers ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}
	cp -r addons/sort-names ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}
	cp -r addons/thumbnail-viewers ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}
	cp -r addons/url-handlers ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}
	cp -r addons/extensions ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}

uninstall:
	rm -f ${DESTDIR}${MANDIR}/man1/ytfzf.1
	rm -f ${DESTDIR}${MANDIR}/man5/ytfzf.5
	rm -rf ${DESTDIR}${DOCDIR}
	rm -rf ${DESTDIR}${LICENSEDIR}
	rm -f ${DESTDIR}${BINDIR}/${PROG}
	rm -rf ${DESTDIR}${YTFZF_SYSTEM_ADDON_DIR}

#legacy install locations on linux
uninstall-old:
	rm -f /usr/bin/ytfzf
	rm -f /usr/share/man/man1/ytfzf.1*
	rm -f /usr/share/man/man5/ytfzf.5*

.PHONY: all default install uninstall doc addons uninstall-old
