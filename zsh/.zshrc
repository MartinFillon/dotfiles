# Config file for zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DEV_HOME=$HOME/dev
export ZSH="$HOME/.oh-my-zsh"
export PACKAGE_LIST=$DOTFILES/packages.txt
export CONFIG_DIR=$HOME/.config

ZSH_THEME="murilasso"

plugins=(
	git
	wd
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
alias ls="eza -lh --git --icons --git-repos"
alias pm="sudo pacman"
alias lgout="hyprctl dispatch exit"
alias mk="make -s"
alias npmcheck='npm-check -u -E'
alias fourmolu="$HOME/.cabal/bin/fourmolu -i"
alias fgrind="valgrind --leak-check=full"
alias eza-bleeding="~/dev/rust/eza/target/debug/eza"
alias build-eza="cd ~/dev/rust/eza/ && cargo build && cd -"
alias copy="xsel -ib"
eval "$(zoxide init zsh)"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
export PATH="$PATH:$HOME/.dotfiles/scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.ghcup/bin"
export PATH="$PATH:$HOME/.cabal/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GPG_TTY=$(tty)
if [ -e /home/fexkoser/.nix-profile/etc/profile.d/nix.sh ]; then . /home/fexkoser/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export FILTER_BRANCH_SQUELCH_WARNING=1
export FPATH="$HOME/dev/zappy/completions/:$FPATH"
source /usr/share/nvm/init-nvm.sh
export EMSDK_QUIET=1
source "$DEV_HOME/emsdk/emsdk_env.sh"
compinit
