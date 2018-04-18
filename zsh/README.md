Setting up zsh
===============

Install

    $ brew install zsh zsh-completions


Set $ZDOTDIR

    $ echo "ZDOTDIR=$HOME/dotfiles/zsh" >> "$HOME/.zshenv"

Change shell

    $ sudo vim /etc/shells
      # add newline with new zsh path
    $ chsh -s `which zsh`

Clone presto

    $ git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/dotfiles/zsh/.zprezto"


At this point you should be good to go!
