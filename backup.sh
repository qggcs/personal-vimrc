#!/bin/sh

if [ $(dirname $0) != "." ]; then
    echo "must be executed in root"
    exit 1
fi

CONF=.config
DIST=.

backup_linux_conf() {
    cp $HOME/.Xresources $DIST
    cp $HOME/.xprofile $DIST
    cp $HOME/$CONF/libinput-gestures.conf $DIST/$CONF
    cp -r $HOME/$CONF/i3 $DIST/$CONF
    cp -r $HOME/$CONF/zsh $DIST/$CONF

}

backup_arch() {
    pacman -Qqen >$DIST/pacman.list
    pacman -Qqem >$DIST/aur.list
}

cp $HOME/.vimrc $DIST
cp $HOME/.ideavimrc $DIST
cp $HOME/.zshrc $DIST
cp -r $HOME/$CONF/alacritty $DIST/$CONF
cp -r $HOME/$CONF/zsh $DIST/$CONF
cp -r $HOME/$CONF/tmux $DIST/$CONF

os=${uname}
if [ "$os"=="Linux" ]; then
    backup_linux_conf
fi

/usr/bin/which pacman
if [ $? -eq 0 ]; then
    backup_arch
fi