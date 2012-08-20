#!/bin/bash

#Variables
my_git_dir=$HOME/Documents/mygit
vim_rc_file=.vimrc
git_config_file=.gitconfig
aliases_file=.bash_aliases
git_url=git@github.com:solon-aguiar/mystuff.git
#End of Variable Declaration

#Functions
setup_vim ( ) {
  echo Setting up vim
  cp $my_git_dir/mystuff/dotfiles/$vim_rc_file $HOME
  echo .vimrc file copied. Now run vim and type ':BundleInstall'
}

setup_git ( ) {
  echo Setting up git
  cp $my_git_dir/mystuff/dotfiles/$git_config_file $HOME
  echo Git file configured
}

show_help ( ) {
  echo Bootstrap Script - Sets up all the environment for development
  echo -e "\t-vim\tSets up the .vimrc file"
  echo -e "\t-git\tSets up the .gitconfig file"
  echo -e "\t-aliases\tSets up the bashrc aliases"
  echo -e "\t-help\tSee this help"
}

setup_aliases( ){
  echo Setting up aliases for bashrc
  cp $my_git_dir/mystuff/dotfiles/$aliases_file $HOME
  source $HOME/.bash_profile
  echo Aliases file configured
}
#End of Functions Declarations

if [ $# -eq 0 ]; then
  show_help
fi

while [ $# -gt 0 ]
do
  case $1 in
    -vim)      setup_vim;;
    -git)      setup_git;;
    -aliases)  setup_aliases;;
    -help)     show_help;;
  esac
  shift
done
