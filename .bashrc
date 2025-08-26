export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# 画面ロックの設定を解除してi-searchに割り当て
if [[ $- == *i* ]]; then
  stty stop undef
  stty start undef
fi

export PATH=$PATH:~/bin
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# utilsディレクトリのコマンドを使えるようにする
export PATH="$HOME/utils:$PATH"

# 履歴サイズを大きくする
HISTSIZE=100000
HISTFILESIZE=100000

# 文字コードをUTF-8に設定
chcp.com 65001

# 履歴同期の設定
## https://zenn.dev/hankei6km/articles/persist-command-history-in-github-codesapces
HISTCONTROL=ignoreboth
shopt -s histappend
HISTFILE="$HOME/.bash_history"

## 履歴の同期.
function share_history {
  history -a
  history -c
  history -r
}
## プロンプトで実行するコマンド.
function prompt_func {
  share_history
}
PROMPT_COMMAND="prompt_func"
