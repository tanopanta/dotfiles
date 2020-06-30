

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

# goの設定
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# direnvの設定
eval "$(direnv hook zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
# oh-my-zshのセットアップ
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git # <- なんかおまじないらしい
zinit cdclear -q

# プロンプトのカスタマイズ
setopt promptsubst
zinit snippet OMZT::gnzh
zinit light romkatv/powerlevel10k # <- ここで好きなテーマのGitHubリポジトリを Group/Repository で指定。

# 補完
zinit light zsh-users/zsh-autosuggestions
# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word

# jq をインタラクティブに使える。JSONを標準出力に出すコマンドを入力した状態で `Alt+j` すると jq のクエリが書ける。
# 要 jq
zinit light reegnz/jq-zsh-plugin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
