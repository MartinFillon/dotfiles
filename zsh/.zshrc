
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:~/scripts:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="murilasso"

plugins=(
	git
	wd
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# Distros specifics are setted here according to the distros I use and aliases
ubuntu() {
	export DEV_HOME=$HOME/dev
	export JAVA_HOME=/usr/lib/jvm/adoptopenjdk-11-hotspot-amd64
	alias ls="eza -lha --git --git-repos --icons"
	alias npmcheck='npm-check -u -E'

}

archlinux() {
	alias ls="eza -lh --git --icons --git-repos"
	alias pm="sudo pacman"
	alias lgout="hyprctl dispatch exit"
	alias mk="make -s"
	alias npmcheck='npm-check -u -E'
  alias neofetch='hayabusa'
  export PACKAGE_LIST=$DOTFILES/packages.txt
	export CONFIG_DIR=$HOME/.config
  alias fourmolu="$HOME/.cabal/bin/fourmolu -i"
  alias fgrind="valgrind --leak-check=full"
  alias eza-bleeding="~/dev/rust/eza/target/debug/eza"
  alias build-eza="cd ~/dev/rust/eza/ && cargo build && cd -"
	alias copy="xsel -ib"
	eval "$(zoxide init zsh)"
}

fedora() {
	alias ls="exa -lh --icons --git"
	alias mk="make -s"
	alias npmcheck='npm-check -u -E'
}

hostnamectl | grep "Ubuntu"  > /dev/null
if [[ $? -eq 0 ]]
then
	ubuntu
fi

hostnamectl | grep "archlinux"  > /dev/null
if [[ $? -eq 0 ]]
then
	archlinux
fi

hostnamectl | grep "Fedora"  > /dev/null
if [[ $? -eq 0 ]]
then
	fedora
fi


export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/mfn/.local/share/coursier/bin"
export PATH="$PATH:/home/mfn/.local/share/coursier/bin"
export PATH="$PATH:$HOME/.dotfiles/scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.ghcup/bin"
export PATH="$PATH:$HOME/.cabal/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GPG_TTY=$(tty)

if [ -e /home/fexkoser/.nix-profile/etc/profile.d/nix.sh ]; then . /home/fexkoser/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

FILTER_BRANCH_SQUELCH_WARNING=1
export FPATH="$HOME/dev/zappy/completions/:$FPATH"
compinit
