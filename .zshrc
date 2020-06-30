

HISTSIZE=10000
HISTFILESIZE=20000


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# 色を使用
autoload -Uz colors ; colors

# エディタをvimに設定
export EDITOR=vim


# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# カッコの対応などを自動的に補完する
setopt auto_param_keys


PROMPT='%F{cyan}%n@%m%f:%~# '

# 自動補完を有効にする
autoload -Uz compinit ; compinit

# コマンドミスを修正
setopt correct

# 他のターミナルとヒストリーを共有
setopt share_history


# -------------

# Pyenvの設定
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH=/home/taro/.local/bin:$PATH
