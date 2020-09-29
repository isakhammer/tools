#!/bin/sh
set -e
#sudo apt install vim

# Changing escape key and capslock.
#setxkbmap -option caps:swapescape

# cd ~/.vim_runtime
# NOW=$(date +"%m-%d-%y-%T")
# echo "Making backup of your ~/.vimrc at: ~/.vimrc_backup_"$NOW
# cp ~/.vimrc ~/.vimrc_backup_$NOW

echo "Overwriting into your ~/.vimrc."
echo "Starts writing"
sleep 0.5
echo "====="
echo ""
echo 'set runtimepath+=~/.linux_runtime/vimrc

source ~/tools/vimrc/vimrcs/basic.vim
source ~/tools/vimrc/vimrcs/filetypes.vim
source ~/tools/vimrc/vimrcs/plugins_config.vim
source ~/tools/vimrc/vimrcs/extended.vim

try
source ~/.linux_runtime/vimrc/custom/my_vim_configs.vim
catch
endtry' >> ~/.vimrc

echo ""
echo "====="
sleep 0.5
echo "Finished writing"
