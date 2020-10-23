.PHONY: deps compile test

default: deps compile test

deps:
	scripts/dep.sh Olical aniseed v3.8.0
	scripts/dep.sh rxi lume master
	scripts/dep.sh luafun luafun master

compile:
	rm -rf lua
	deps/aniseed/scripts/compile.sh
	deps/aniseed/scripts/embed.sh aniseed vim-next-hunk
	cp deps/lume/lume.lua lua/vim-next-hunk/
	cp deps/luafun/fun.lua lua/vim-next-hunk/
	cp deps/utils/utils.lua lua/vim-next-hunk/

test:
	rm -rf test/lua
	deps/aniseed/scripts/test.sh
