.PHONY: help clean

help:
	@cat Makefile

build:
	lua builder.lua
	@cat Horseclock.xml

clean:
	rm Horseclock.xml


