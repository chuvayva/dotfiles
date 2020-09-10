export ZSH=/Users/chuvayva/.oh-my-zsh

ZSH_THEME="mymuse"

plugins=(
  git
  asdf
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH" # recommended by brew doctor
export EDITOR=vim
export W="/Users/chuvayva/Library/Mobile Documents/com~apple~CloudDocs/+ job/work"
export HIVEMIND_PORT=3000

alias vi='mvim -v'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias gcam='git commit -a --amend'
alias r='rails'
alias b='bundle'
alias be='bundle exec'
alias gf='git fetch --prune'
alias gpush='git push -u origin head'
alias grm='git fetch --prune && git branch -r | awk '\''{print $1}'\'' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '\''{print $1}'\'' | xargs git branch -D'
alias gma='git branch -f master origin/master'

# not used
alias gb='git branch --sort=-committerdate'
alias t='rspec'
alias gla='git log --graph --pretty=format:'\''%Cred%h%Creset -%<(100,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%<(70,trunc)%d%Creset'\'' --date-order --branches'
alias gll='git log --graph --pretty=format:'\''%Cred%h%Creset -%<(100,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%<(70,trunc)%d%Creset'\'' --date-order'
alias gmb='git merge-base head master'
alias gsearch='git log --pickaxe-regex -p --color-words -S '
alias hr='heroku run bundle exec'
alias hlr='heroku local:run bundle exec'
alias hlrt='heroku local:run -e .env.test'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fim fzf
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
# export FZF_DEFAULT_COMMAND='fd --type f'

export PATH="$PATH:/path/to/elixir/bin"

. $HOME/.asdf/asdf.sh

eval "$(direnv hook zsh)"
source <(kubectl completion zsh)

