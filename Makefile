.PHONY: help clean

help:
	@cat Makefile

build:
	lua builder.lua > Horseclock.xml
	@cat Horseclock.xml

clean:
	rm Horseclock.xml


