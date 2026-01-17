zshrc := $(HOME)/.zshrc
oh-my-zsh := dotfiles/.oh-my-zsh/

$(zshrc): $(oh-my-zsh)
	ln -sf $(realpath .)/$(oh-my-zsh) $(HOME)/.oh-my-zsh
	ln -sf $(realpath dotfiles/.zshrc) $(zshrc)
	touch dotfiles/.zshrc # touch .zshrc makes it newer than oh-my-zsh

$(oh-my-zsh):
	git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh $(oh-my-zsh)
	git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git $(oh-my-zsh)/custom/plugins/zsh-syntax-highlighting
	git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $(oh-my-zsh)/custom/plugins/zsh-autosuggestions
	git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git $(oh-my-zsh)/custom/plugins/fast-syntax-highlighting
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $(oh-my-zsh)/custom/plugins/zsh-autocomplete
