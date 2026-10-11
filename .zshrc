## --- COLOR STYLE
source ~/.zsh/zsh_colorstyle

## --- AUTOSUGGESTIONS (plugin lives in ~/.zsh/zsh-autosuggestions)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## --- ALIASES
source ~/.zsh/zsh_alias

## --- HISTORY
setopt INC_APPEND_HISTORY   # Append history from each session as commands run
setopt EXTENDED_HISTORY     # Save timestamps with commands
#setopt HIST_FIND_NO_DUPS
#setopt HIST_IGNORE_ALL_DUPS
#unsetopt share_history

export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=~/.zsh/zsh_history

## --- PATH additions (uncomment/add as needed)
#export PATH="$HOME/.local/bin:$PATH"
#export PATH="$HOME/some_tool/bin:$PATH"

## --- Libraries
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/some_lib/lib"

## --- X11 forwarding display (only if needed)
#export DISPLAY=:0

## --- Example function: SSH tunnel to a remote postgres
# usage: tunnel <host> <up|down>
tunnel() {
  if [ $# -ne 2 ]; then
    echo "Usage: tunnel <host> <up|down>"
  elif [ "$2" = "up" ]; then
    ssh -f -N -M -S /tmp/$1_postgres -L 5433:localhost:5432 "$1"
    echo "Opened ssh tunnel 5433:localhost:5432 to $1"
  elif [ "$2" = "down" ]; then
    ssh -S /tmp/$1_postgres -O exit "$1"
    echo "Closed ssh tunnel to $1"
  else
    echo "Usage: tunnel <host> <up|down>"
  fi
}
