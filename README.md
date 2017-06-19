### setting up `.vimrc`:

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

then open vim and run `:PluginInstall`

#### powerline fonts:

	git clone https://github.com/Lokaltog/powerline-fonts.git

### tmux plugin manager:

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

to install plugins: `prefix + I`

### dircolors for Linux:

    wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark -O ~/.dircolors

    # add to bash config file
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

-----

solarized theme for Terminal.app is copied from [tomislav/osx-terminal.app-colors-solarized](https://github.com/tomislav/osx-terminal.app-colors-solarized).

