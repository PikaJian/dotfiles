# CLAUDE.md — dotfiles

個人 dotfiles repo，remote 是 `github.com/PikaJian/dotfiles`（public）。
同一份設定要同時跑在 **macOS (Apple Silicon)** 和 **公司 server 的 Ubuntu 24.04** 上。

## 檔案

| 檔案 | 說明 |
|---|---|
| `.zshrc` | zsh 設定，oh-my-zsh + `vi-mode` + `zsh-autosuggestions`，theme `robbyrussell` |
| `.bashrc` | bash 設定 |
| `.tmux.conf` | tmux 設定（`.tmux.conf.bak` 是舊版備份） |
| `.inputrc` | readline |
| `bootstrap.sh` | 把上列檔案 symlink 到 `$HOME`，舊檔備份到 `~/dotfiles.orig` |
| `lsp_config/` | clangd compile_commands 產生工具（`bear_make_app.sh`、`gen_compile_commands.py`、`linux_kernel.sh`），不在 bootstrap 的同步清單內 |

## 兩個平台的差異必須寫在同一份 `.zshrc` 裡

不要為 macOS / Linux 各開一份檔案。用 `[[ "$OSTYPE" == darwin* ]]` 分支，共用的部分只寫一次。
目前已知的平台差異：

- **PATH**：mac 是 homebrew (`/opt/homebrew/bin`)、conda、nvm、`~/.cargo/bin`、`~/Library/Python/3.9/bin`；
  Ubuntu 那台沒有 root，工具都自行解壓在 `~/squashfs-root/usr/bin`、`~/ubuntu_2404_lfs/`（含 ripgrep）
- **fzf 安裝位置不同**：mac 在 `~/.fzf`，Ubuntu 在 `~/.local/share/nvim/lazy/fzf`。
  用迴圈偵測目錄存在才 `source`，不要無條件 source（路徑不存在時每次開 shell 都噴錯）
- **`bindkey '^ ' autosuggest-accept`**：只在 Linux 綁，macOS 的 `^Space` 被輸入法切換佔用
- **`ZSH_DISABLE_COMPFIX=true`**：Ubuntu 的 zsh 是自己裝在 home 底下，oh-my-zsh 的目錄權限檢查會誤判。
  必須設在 `source $ZSH/oh-my-zsh.sh` **之前**
- **PROMPT 一律用 `${USER:-$(id -un)}`，不要用 `%n`**：Ubuntu 那台是 static musl 編的 zsh，沒有 NSS，
  帳號來自 sss 時 `getpwuid` 會失敗導致 `%n` 是空字串。mac 上兩者結果相同，所以統一用前者即可

寫死路徑時用 `$HOME`，不要用 `/Users/pikajian`（conda init 產生的區塊要手動改掉）。

## 機密絕對不要進這個 repo

remote 是 public。API key、token 一律放 `~/.zshrc.local`（`chmod 600`，不納入版控），
`.zshrc` 結尾用這行載入：

```zsh
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
```

會出現在 local 的東西：`GOOGLE_API_KEY`、`OPENAI_API_KEY`、`FINNHUB_API_KEY`、`CLAUDE_CODE_OAUTH_TOKEN`。
commit 前掃一次：`git diff --cached | grep -iE 'api_key|token|secret|sk-'`。

## 改完 `.zshrc` 一定要做的驗證

```zsh
zsh -n .zshrc          # 語法檢查，改完必跑
zsh -i -c exit         # 起一個 interactive shell 確認沒有 error 噴出來
```

## 現況（2026-08-19）需要注意

1. **`~/.zshrc` 和 `~/.tmux.conf` 目前是普通檔案，不是 symlink**。`bootstrap.sh` 的連結沒生效
   （或曾生效後被 oh-my-zsh 安裝程式覆寫）。也就是說**這個 repo 裡的 `.zshrc` 不是實際在跑的那份**。
   要動設定前先確認你改的是哪一份，收斂回 symlink 之後才能只維護一處。
2. **`.zshrc` 是舊的**（147 行，2025-04 那次 commit），實際在用的 `~/.zshrc` 已經多了 nvm、conda、
   homebrew、ffmpeg、cargo 等區塊。下次更新要以實際跑的那份為準，不要直接 pull 覆蓋。
3. `bootstrap.sh` 有兩個問題，動到它時順手修：
   - `files=()` 裡列了 `.vimrc` 和 `.config/nvim`，但 repo 裡沒有這兩個 → 會建出斷掉的 symlink
   - `install_ohmyzsh()` 最後一行 `cp zshrc ~/.zshrc` 檔名少了點（repo 裡是 `.zshrc`），
     而且會蓋掉前面 symlink 迴圈剛建好的連結
4. `.bashrc` 也在 repo 裡但不在 `bootstrap.sh` 的 `files=()` 清單內，不會被 symlink。

## 慣例

- commit message 沿用現有風格：簡短英文祈使句，例如 `Update tmux.conf and zshrc.`
- 分支就是 `master`，直接 commit
