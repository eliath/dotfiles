# Set up brew software, mac only

brew_prefix=`brew --prefix`

# autojump
[[ -s $brew_prefix/etc/autojump.sh ]] && . $brew_prefix/etc/autojump.sh
