HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export GTK_THEME=Adwaita:dark

source /usr/share/nvm/init-nvm.sh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(~/.zsh/zsh-completions/src $fpath)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias cd="z"
alias ls='eza --icons --long --all'
