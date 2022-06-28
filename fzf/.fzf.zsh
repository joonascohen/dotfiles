# Setup fzf
# ---------
if [[ ! "$PATH" == */home/joonas/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/joonas/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/joonas/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/joonas/.fzf/shell/key-bindings.zsh"
