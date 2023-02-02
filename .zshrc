DEFAULT_USER=$USER

export TERM="xterm-256color"

source /usr/local/share/antigen/antigen.zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# Load the oh-my-zsh's library.

antigen use oh-my-zsh
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle docker
antigen bundle encode64
antigen bundle gem
antigen bundle git
antigen bundle git-extras
antigen bundle httpie
antigen bundle kubectl
antigen bundle node
antigen bundle npm
antigen bundle pep8
antigen bundle pip
antigen bundle pipenv
antigen bundle pylint
antigen bundle python
antigen bundle ruby
antigen bundle sudo
antigen bundle vagrant
antigen bundle yarn

# Syntax highlighting and autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# pure theme
# https://github.com/sindresorhus/pure
#antigen bundle mafredri/zsh-async
#antigen bundle sindresorhus/pure

# powerlevel9k theme
# https://github.com/bhilburn/powerlevel9k
antigen theme bhilburn/powerlevel9k powerlevel9k
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# bullet train theme
# https://github.com/caiogondim/bullet-train.zsh
#antigen theme caiogondim/bullet-train.zsh bullet-train

# Tell antigen that you're done.
antigen apply

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#mysql
export PATH=$PATH:/usr/local/opt/mysql-client/bin


# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias k="kubectl"
alias tf="terraform"
alias myip="curl https://ipecho.net/plain; echo"

# Mapping for zsh to ensure pressing delete doesn't close shell
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# Improve zsh history
# Increase zsh_history size
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

export PATH="/usr/local/sbin:$PATH"

#postgres
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

#Ensure pressing delete key on empty prompt doesn't close the shell
export IGNOREEOF=5

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Autocompletion for gcloud--
CLOUD_SDK_HOME=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
source "${CLOUD_SDK_HOME}/completion.zsh.inc"

complete -o nospace -C /usr/local/bin/vault vault


# Source functions
source ~/.zfunc/load_vault_helpers.sh

notify() {
  if [[ $? = 0 ]]; then
    say Done
  else
    say Error
  fi
}

loop_until() {
    command=$1
    text_to_check=$2
    wait=$3
  
    until $(echo "$command") | grep "$2"; do
        sleep $wait
    done
}

complete -o nospace -C /usr/local/bin/terraform terraform

# SSH Aliases
alias ssm-app3='aws ssm start-session --target i-023bfbc1da06cd001 --region us-east-1'
alias ssm-app4='aws ssm start-session --target i-07fca9e841a80be72 --region us-east-1'
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"

# Created by `pipx` on 2021-11-10 09:35:03
export PATH="$PATH:/Users/daniel.moses/.local/bin"
