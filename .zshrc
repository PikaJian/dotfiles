# ============================================================
# 共用 .zshrc — macOS / Ubuntu 24.04 (local zsh) 通用
# 機器專屬設定與機密請放 ~/.zshrc.local（不進版控）
# ============================================================

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# local(非 root 安裝) zsh 的目錄權限檢查會誤判，關掉
# 必須在 source oh-my-zsh.sh 之前設定
ZSH_DISABLE_COMPFIX=true

# disable git in cifs
plugins=(
  vi-mode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------
# User configuration
# ------------------------------------------------------------

# vim key binding
function zle-line-init zle-keymap-select {
    RPS1='%{$fg[blue]%}%~%{$reset_color%} ${return_code} ${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}'
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^k' kill-line

#remove key binding, binding can not be empty
#bindkey -r ''

#C-hjkl map for tmux movement not for zsh, so map to C-b C-f
bindkey '^b' backward-char
bindkey '^f' forward-char
#^[ is meta key for macos
bindkey '[C' forward-word
bindkey '[D' backward-word

# ------------------------------------------------------------
# 平台專屬
# ------------------------------------------------------------
if [[ "$OSTYPE" == darwin* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="$HOME/ffmpeg:$PATH"
    export PATH="$HOME/.antigravity/antigravity/bin:$PATH"   # Added by Antigravity
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$PATH:$HOME/Library/Python/3.9/bin"

    # nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    # conda (由 conda init 產生，已改用 $HOME 以免綁死使用者名稱)
    if [ -d "$HOME/miniconda3" ]; then
        __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        elif [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
        unset __conda_setup
        conda deactivate
    fi

    # ^Space 在 macOS 被輸入法佔用，不綁 autosuggest-accept
else
    # Ubuntu 24.04：自行解壓的工具鏈
    export PATH="$HOME/squashfs-root/usr/bin/:$PATH"
    export PATH="$HOME/ubuntu_2404_lfs/ripgrep-15.1.0-x86_64-unknown-linux-musl/:$PATH"
    export PATH="$HOME/ubuntu_2404_lfs/:$PATH"
    export PATH="$HOME/.local/bin:$PATH"

    bindkey '^ ' autosuggest-accept
fi

# ------------------------------------------------------------
# fzf：兩台機器安裝位置不同，自動偵測
# ------------------------------------------------------------
for _fzf_dir in "$HOME/.fzf" "$HOME/.local/share/nvim/lazy/fzf"; do
    [[ -d "$_fzf_dir" ]] || continue
    export PATH="$PATH:$_fzf_dir/bin"
    [[ -f "$_fzf_dir/shell/key-bindings.zsh" ]] && source "$_fzf_dir/shell/key-bindings.zsh"
    break
done
unset _fzf_dir

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up,ctrl-d:page-down,ctrl-u:page-up,ctrl-w:forward-word,ctrl-b:backward-word,ctrl-l:beginning-of-line,ctrl-e:end-of-line,ctrl-y:yank,ctrl-a:select-all,ctrl-s:kill-line'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------
# prompt: user@host:path (robbyrussell 的 git 狀態保留)
# 用 $USER 而非 %n：static musl 的 zsh 沒有 NSS，帳號來自 sss 時
# getpwuid 失敗，%n 會是空的。macOS 上結果相同，故統一使用。
# ------------------------------------------------------------
_prompt_user=${USER:-$(id -un 2>/dev/null)}
PROMPT='%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )%{$fg_bold[green]%}'"${_prompt_user}"'@%m%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)%(!.#.$) '

# ------------------------------------------------------------
# 機器專屬設定 / API keys（不進版控）
# ------------------------------------------------------------
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
