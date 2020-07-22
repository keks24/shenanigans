# custom
# tmux
if [[ $(pgrep -u "$(id -un)" tmux) ]]
then
    tmux attach > /dev/null 2>&1

else
    tmux new-session #-n "$(id -un)@$(hostname)"
fi

alias locate="locate -d ~/.locate.db"
alias updatedb="updatedb -l 0 -o ~/.locate.db"
