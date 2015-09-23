#!/bin/sh

exec 1>&2 2>/dev/null

BOOTSTRAP=$(dirname `readlink -f $0`)
XRESOURCES=$BOOTSTRAP/xresources
PATH="$PATH:$BOOTSTRAP/bin"

export XRESOURCES PATH BOOTSTRAP

xset +fp $BOOTSTRAP/fonts
xset fp rehash

xsetroot -solid \#3e4853
xsetroot -cursor_name left_ptr

xrdb -merge $XRESOURCES

sxhkd -c $BOOTSTRAP/sxhkdrc &
focus_watcher.sh &
fixkeys
wew | yawee &
pulse.sh &

exec sh -c 'while :; do sleep 10; done'
