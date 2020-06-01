# Makefile --- A simple Makefile for working on specs.

# This is a generic Makefile for generating HTML documents from Bikeshed
# source files.

# Bikeshed (.bs) is a popular format for writing specifications in. This
# Makefile assumes you have a local install of bikeshed. Installation
# instructions can be found here:
#
#     https://tabatkins.github.io/bikeshed/#installing

specs   = $(patsubst %.bs,build/%.html,$(wildcard *.bs))

.PHONY: all clean pristine
.SUFFIXES: .bs .html

all: build $(specs)

clean:
	rm -f $(specs) *~

pristine: clean
	rm -rf build

build:
	mkdir -p build

build/%.html: %.bs
	bikeshed spec $< $@
