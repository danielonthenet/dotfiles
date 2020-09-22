DEFAULT_USER=$USER

export TERM="xterm-256color"

source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
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
alias myip="curl https://ipecho.net/plain; echo"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
