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

## 現況（2026-08-19）

macOS 端已經收斂完成：

- `~/.zshrc` 是 symlink → `~/dotfiles/.zshrc`，改設定就直接改 repo 這份
- 合併前實際在跑的那份備份在 `~/dotfiles.orig/.zshrc.pre-merge-20260819`
- 金鑰已抽到 `~/.zshrc.local`（`600`）：`GOOGLE_API_KEY`、`OPENAI_API_KEY`、
  `FINNHUB_API_KEY`、`CLAUDE_CODE_OAUTH_TOKEN`

**還沒做的事：**

1. **Ubuntu 24.04 那台還沒套用**這份合併版。過去那台是獨立維護一份 `.zshrc`，
   套用時要一併建 `~/.zshrc.local`，否則該機需要的環境變數會消失。
2. `CLAUDE_CODE_OAUTH_TOKEN` 等 key 曾經以明文存在非版控的 `~/.zshrc` 裡一段時間，
   雖然沒進過 git，仍建議找時間輪替一次。
3. commit 尚未 push（remote 是 public，push 前再確認一次沒帶到機密）。

## 已知的 bootstrap.sh 問題

動到它時順手修：

- `files=()` 裡列了 `.vimrc` 和 `.config/nvim`，但 repo 裡沒有這兩個 → 會建出斷掉的 symlink。
  實際上 `~/.vimrc` → `~/.config/nvim/vimrc`、`~/.config/nvim` → `nvim_pikajian`，都不是指向這個 repo
- `install_ohmyzsh()` 最後一行 `cp zshrc ~/.zshrc` 檔名少了點（repo 裡是 `.zshrc`），
  而且會蓋掉前面 symlink 迴圈剛建好的連結 —— `~/.zshrc` 之前不是 symlink 很可能就是這行造成的
- `.bashrc`、`.inputrc` 在 repo 裡但不在 `files=()` 清單內，不會被 symlink
- `~/.tmux.conf` 目前也還是普通檔案，不是 symlink

## 慣例

- commit message 沿用現有風格：簡短英文祈使句，例如 `Update tmux.conf and zshrc.`
- 分支就是 `master`，直接 commit
