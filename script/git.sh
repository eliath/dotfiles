# create gitconfig if not there already
if [ ! -f ~/.gitconfig ]; then
  echo "[user]
  email = emc@eliath.biz" > ~/.gitconfig
fi

echo "[include]
  path = $DOTFILES/git/config" | \
  cat - ~/.gitconfig > /tmp/gitconfig && \
  mv /tmp/gitconfig ~/.gitconfig
