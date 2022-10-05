# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="powerlevel10k/powerlevel10k"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk


### Start of Zinit's plugins import

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
#zinit light zsh-users/zsh-completions

### End of Zinit's plugins import

### Start of Powerlevel9K's Cyberpunk-Neon theme


### End of Powerlevel9K's Cyberpunk-Neon theme

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='201'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_FOREGROUND='044'
POWERLEVEL9K_DIR_HOME_BACKGROUND='025'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='044'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='025'
POWERLEVEL9K_DIR_ETC_FOREGROUND='044'
POWERLEVEL9K_DIR_ETC_BACKGROUND='025'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='044'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='025'
POWERLEVEL9K_STATUS_OK_BACKGROUND='017'
POWERLEVEL9K_HISTORY_BACKGROUND='013'
POWERLEVEL9K_HISTORY_FOREGROUND='044'
POWERLEVEL9K_TIME_BACKGROUND='201'
POWERLEVEL9K_TIME_FOREGROUND='255'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

### Start of custom commands
export AWS_MINE=54.91.123.76
export GOOGLE_MINE=34.151.220.42
export BURGOS=192.168.18.9
export TERMUXU=u0_a319
export TERMUX=192.168.18.7
export MEUNAGUMO_NODE=3.81.140.140

alias execphp='docker exec -it monuv_php-fpm_1 sh'
alias execdb='docker exec -it monuv_database_1 sh'
alias execweb='docker exec -it monuv_web_1 sh'
alias cdcd="cd ~/Documents/code/"
alias cdqs="cd ~/Documents/code/quaestum"
alias cdng="cd ~/Documents/code/quaestum/nagumo"
alias cdtm="cd ~/Documents/code/the-mind"
alias cdut="cd ~/Documents/code/utfpr"
alias soundwire='~/Documents/Tools/SoundWireServer/SoundWireServer'
alias mp3="mpg123" 
alias getip='ip a | grep "inet " | grep -v 127.0.0.1'
alias open="xdg-open"
alias sshu="ssh ubuntu@$GOOGLE_MINE"
alias ssht="ssh -p 8022 $TERMUXU@$TERMUX"
alias python="python3"

alias h='history'
alias upd='docker-compose up -d'
alias down='docker-compose down'

alias la='ls -a'
alias lf='ls -F'
alias ll='ls -l'
alias L='ls -aFl'
alias Ls='L | less'
alias msg='DISPLAY=:0 zenity --info --no-wrap --text '

# open iterative terminal for a docker container
function dexec {
	if [ -n "$1" ]
	then
		docker exec -it {$1} sh
	else
   		print '[Docker exec] Usage: dexec <container>'
	fi
}

# Copy and paste the code into your bash configuration file
function mkdircd {
	if [ -n "$1" ]; then
		mkdir $1 && cd $1
	else
		print 'Usage: mkdircd <directory>'
	fi

}

# Updates the branch master from the origin remote
function gum {
	git stash
	git checkout master
	git pull origin master
}

# merges the branch master into the current branch
function gmm {
	git merge master
}

# commits the staged changes
# up to 3 parameters are supported, like 'gcm --amend -m "My commit message"'
function gc {
        git commit $1 $2 $3
}

# stashes the changes
function gs {
	git stash $1 $2 $3
}

# applies the stashed changes
# to apply another stash instead of the last,
# type "gsa n", where 'n' is the number of the stash
# Ex.: "gsa 2" will run "git stash apply stash@{2}"
function gsa {
	if [ -n "$1" ]
	then
		git stash apply stash@{$1}
	else
		git stash apply
	fi
}

# pops the stashed changes
# to pop another stash instead of the last,
# type "gsa n", where 'n' is the number of the stash
# Ex.: "gsa 2" will run "git stash pop stash@{2}"
function gsp {
	if [ -n "$1" ]
	then
		git stash pop stash@{$1}
	else
		git stash pop
	fi
}

# show git status minified
function gss {
	git status -s
}

# shows the commit log minified
function glo {
    git log --oneline
}

function set_git_aliases {
    echo "Setting git aliases"

    echo "git lo -> git log --oneline"
    git config --global alias.lo 'log --oneline' &&
    echo "git pm -> git pull origin master"
    git config --global alias.pm 'pull origin master' &&
    echo "git go -> git checkout"
    git config --global alias.go 'checkout' &&
    echo "git gm -> git go master"
    git config --global alias.gm 'go master'

    echo 'Git aliases set successfully'
}


# checks the sha256 sum of a file
function sha256 {
    if [ -n "$1" ]; then
        echo "$(cat "$1.sha256sum" | sed 's/\s.*//g') $1" | sha256sum --check
    else
	echo "[sha256] Usage: sha256 <file_to_check> # note that there's must be a <file_to_check>.sha256sum file in the same directory"
    fi
}

# uses recordmydesktop to save a timelapse video on ~/Videos/name.ogv
# name can be especified in arguments (timelapse myVideo)
function timelapse {
    FILE="/home/$(whoami)/Videos"

    [ -n "$1" ] && FILE="$FILE/$1.ogv" || FILE="$FILE/desktop_recording.ogv"

    echo "Starting recordmydesktop. Abort with Ctrl-C."
    recordmydesktop --no-sound --on-the-fly-encoding --workdir /var/temp -o "$FILE"
    echo "Stopped."
}

# Unzip *.zip files in the current directory,
# each inside its own subdirectory
#
# The default behavior of unzip is to inflate
# all files in the same, current directory
function multi-unzip {
   if [ -d "$1" ];
   then
        for file in $(ls $1/*.zip);
        do
            unzip $file -d "$(echo $file | cut -d . -f 1)";
        done
    else
        echo "Usage: multi-unzip <zip_files_directory>"
        echo "zip_files_directory: the path where your zip file are, and where they will be inflated (each inside its own subdirectory)"
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export ANDROID_SDK=~/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK
export PATH=$PATH:$JAVA_HOME

if command -v thefuck &> /dev/null; then
    eval $(thefuck --alias)
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/schuster/google-cloud-sdk/path.zsh.inc' ]; then . '/home/schuster/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/schuster/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/schuster/google-cloud-sdk/completion.zsh.inc'; fi
export EDITOR=vim
export TMUX_SESSION_NAME="default"
export TMUX_WINDOW_NAME="burgos"

# adding game directories to ~/bin
export PATH=$PATH:/home/schuster/Games/dead-cells

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/schuster/Documents/code/agesbec-viewer/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/schuster/Documents/code/agesbec-viewer/node_modules/tabtab/.completions/electron-forge.zsh