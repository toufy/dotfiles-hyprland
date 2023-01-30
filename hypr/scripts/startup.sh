#!/bin/sh

for proc in waybar dunst udiskie swww 
    do
        procid=$(pgrep -f "$proc")
        if [ -n "$procid" ];then
            kill -KILL "$procid"
        fi;
done
hyprctl reload
waybar &
dunst &
udiskie &
swww init
swww img "$HOME/.bgimg.gif"
