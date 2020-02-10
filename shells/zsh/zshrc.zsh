#!/usr/local/bin/zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

source $ZSH/zplugin.zsh

vterm_prompt_end() {
  vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}

vof () {
  vterm_cmd find-file "$(realpath "$@")"
}

vofb() {
  vterm_cmd find-file-below "$(realpath "$@")"
}

vofa() {
  vterm_cmd find-file-above "$(realpath "$@")"
}


if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  PROMPT="%8F%m%f %4F>%f %{$(vterm_prompt_end)%}"
else
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f $DOTFILES/shells/zsh/themes/p10k.zsh ]] || source $DOTFILES/shells/zsh/themes/p10k.zsh
fi

eval "$(direnv hook $0)"
eval "$(pyenv init -)"
# If zsh init ends with a failing command (like a conditional) the prompt will
# show the "error" colour on first launch. To avoid this, we simply end with a
# true command:
true
