.PHONY: help clean

help:
	@cat Makefile

build:
	lua builder.lua

clean:
	rm plugins/*xml


