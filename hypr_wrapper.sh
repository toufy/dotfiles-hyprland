#!/bin/sh
source "$HOME/.env_vars"
exec systemd-cat --identifier=hyprland /usr/bin/Hyprland $@
