#!/bin/bash
# Define source and backup directory

dir=$HOME/dotfiles
origdir=$HOME/dotfiles.orig

# --------------------------------------
# Put config/dir to sync in this variable
# --------------------------------------


files=(
    .tmux.conf
    .vimrc
    .zshrc
    .config/nvim
)

# --------------------------------------
# Put custom installaltion commands here
# --------------------------------------

install_ripgrep() {

    if [[ $(uname) == 'Linux' ]]; then
	sudo apt-get install ripgrep
    elif [[ $(uname) == 'Darwin' ]]; then
	brew install ripgrep
    fi
}

neovim_replace_vimrc() {
    ln -sf $dir/.config/nvim/init.vim $HOME/.vimrc
}

install_tmux_package_manager() {
    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        echo 'TMUX Package Manager has already be installed.'
    fi
}

install_ohmyzsh() {
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        echo 'oh-my-zsh has already be installed'
    fi
    cp zshrc ~/.zshrc
}

# --------------------------------------
# Start symlink files
# --------------------------------------

echo -n "Creating $origdir for backup ..."
mkdir -p $origdir
echo "done"

echo -n "cd to $dir ..."
cd $dir
echo "done"

# Symlink files
for file in ${files[@]}; do
    echo "$file"
    echo -e "\tMoving $file to $origdir"
    if [[ -z "$file" ]]; then
        echo -e "No file $file found"
        return
    fi
    mkdir -p $HOME/$(dirname $file)
    if [[ -e $HOME/$file ]]; then
	echo "backup $HOME/$file"
        mv $HOME/$file $origdir
    fi
    echo -e "\tSymlinking to $file in $dir"
    ln -sf $dir/$file $HOME/$file
done

# --------------------------------------
# Call pre-defined custom commmands here
# --------------------------------------

# confirm helper function running before installation
confirm(){
    echo
    read -p "${3:-}Confirm $1? [y/N]" response
    case $response in
        [yY][eE][sS]|[yY])
            $2
            ;;
        *)
            echo "Operation aborted."
            ;;
    esac
    echo
}

confirm "install oh-my-zsh" install_ohmyzsh 
confirm "init neovim files" neovim_replace_vimrc
confirm "install tpm (TMUX Package Manager)" install_tmux_package_manager
confirm "install ripgrep, a better grep" install_ripgrep
