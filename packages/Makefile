prefix := $(HOME)/.local

nvim := $(prefix)/bin/nvim
zsh := $(prefix)/bin/zsh
tmux := $(prefix)/bin/tmux
byobu := $(prefix)/bin/byobu

.PHONY: all
all: $(nvim) $(zsh) $(tmux) $(byobu)
	@echo all done

nvim_dir := nvim-linux64

$(nvim):
	tar -zxvf $(nvim_dir).tar.gz
	mkdir -p $(dir $(nvim))
	ln -s $(realpath .)/$(nvim_dir)/bin/nvim $(nvim)

zsh_dir := zsh-5.9

$(zsh):
	tar -Jxvf $(zsh_dir).tar.xz
	cd $(zsh_dir) && ./configure --prefix=$(prefix) \
		&& $(MAKE) -j && $(MAKE) install

tmux_dir := tmux-3.5a

$(tmux):
	tar -zxvf $(tmux_dir).tar.gz
	cd $(tmux_dir) && ./configure --prefix=$(prefix) \
		&& $(MAKE) -j && $(MAKE) install

byobu_dir := byobu-6.12

$(byobu):
	tar -zxvf $(byobu_dir).tar.gz
	cd $(byobu_dir) && ./autogen.sh
	cd $(byobu_dir) && ./configure --prefix=$(prefix) \
		&& $(MAKE) -j && $(MAKE) install
