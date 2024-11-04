prefix := $(HOME)/.local

.PHONY: all
all: tmux byobu nvim zsh
	@echo all done

tmux_dir := tmux-3.5a

tmux:
	tar -zxvf $(tmux_dir).tar.gz
	cd $(tmux_dir) && ./configure --prefix=$(prefix) \
		&& $(MAKE) -j && $(MAKE) install
	cp $(tmux_dir)/tmux .

byobu_dir := byobu-6.12

byobu:
	tar -zxvf $(byobu_dir).tar.gz
	cd $(byobu_dir) && ./autogen.sh
	cd $(byobu_dir) && ./configure --prefix=$(prefix) \
		&& $(MAKE) -j && $(MAKE) install
	cp $(byobu_dir)/usr/bin/byobu .

nvim_dir := nvim-linux64

nvim:
	tar -zxvf $(nvim_dir).tar.gz
	cp -r $(nvim_dir)/* /usr/local
	cp $(nvim_dir)/bin/nvim .

zsh_dir := zsh-5.9

zsh:
	tar -Jxvf $(zsh_dir).tar.xz
	cd $(zsh_dir) && ./configure --prefix=$(prefix) \
		&& $(MAKE) -j && $(MAKE) install
	cp $(zsh_dir)/Src/zsh .
