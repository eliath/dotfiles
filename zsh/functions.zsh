# Extract anything
extract() {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        NAME=${1%.*}
        case "$1" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
  fi
}

# host file refresh
refresh-hosts() {
  sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder
}

docker-purge() {
  dps=`docker ps -a -q`
  if [ ${#dps[@]} -ne 0 ]; then
    docker rm -vf $(docker ps -a -q)
  fi
  dki=`docker images -a -q`
  if [ ${#dki[@]} -ne 0 ]; then
    docker rmi -f $(docker images -a -q)
  fi
}

# utility to send a macOS notification when the previous command finishes
notify-done() {
  last_cmd="$(echo $history[$HISTCMD] | sed 's/notify-done//')"
  osascript -e 'display notification "'"${last_cmd}"'" with title "Done"'
}

# Show info on ssh keys tracked by ssh-add -l
# https://unix.stackexchange.com/a/566474
ssh-listkeys() {
    while read -r line; do
        for file in ~/.ssh/*.pub;
        do
            printf "%s %s\n" "$(ssh-keygen -lf "$file" | awk '{$1=""}1')" "$file";
        done | column -t | grep --color=auto "$line" || echo "$line";
    done < <(ssh-add -l | awk '{print $2}')
}
