
PREFIX := /usr
INSTALL = install

all:
	@echo "Nothing to make. Just do make install."

install:
	$(INSTALL) -m 755 fpm-aufs $(PREFIX)/bin/
