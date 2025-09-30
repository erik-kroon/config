if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jandedobbeleer.omp.json)"
fi
eval "$(pyenv init --path)"
export LC_ALL=en_US.UTF-8

branch() {
  git checkout -b "RD-$1" && git push -u origin "RD-$1"
}

alias k9s='TERM=xterm-256color k9s'
alias py='python'
git_done() {
    local branch=$(git rev-parse --abbrev-ref HEAD)
    git add .
    git commit -m "$branch #done"
    # Uncomment the next line if you want to automatically push
    # git push origin "$branch"
    echo "Changes committed with message: $branch #done"
}

commit() {
  if [ -z "$1" ]; then
    echo "Error: No commit message provided."
    return 1
  fi
  git add . && git commit -m "$1" && git push
}

alias c∂='cd'
alias pr='gh pr create --web'
alias pn='pnpm'
alias färdig='git_done'
alias gdone='git_done'
alias z="zed ."
alias main="git checkout main && git pull origin main"
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Google Cloud SDK
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
source "$HOME/google-cloud-sdk/path.zsh.inc"
source "$HOME/google-cloud-sdk/completion.zsh.inc"

   # NVM setup
   export NVM_DIR="$HOME/.nvm"
   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

   # Node.js and npm
   export PATH=$HOME/.nvm/versions/node/$(nvm current)/bin:$PATH

   # Homebrew
   eval "$(/opt/homebrew/bin/brew shellenv)"

     export PATH=$PATH:/usr/local/bin

   # Bun
   export BUN_INSTALL="$HOME/.bun"
   export PATH="$BUN_INSTALL/bin:$PATH"

   # Bun completions
   [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun completions
[ -s "/Users/erik/.bun/_bun" ] && source "/Users/erik/.bun/_bun"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/erik/.lmstudio/bin"
