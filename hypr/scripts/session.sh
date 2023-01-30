#!/bin/sh
if [ $# -eq 1 ]
	then
		ans=$1
	else
		ans=$(zenity --info \
		--title="session options" --text "what do you want to do?" \
		--ok-label="cancel" \
        --extra-button "lock" \
		--extra-button "suspend" \
		--extra-button "log-out" \
		--extra-button "restart" \
		--extra-button "shut down"
		)
fi
case $ans in
    "lock")
        "$XDG_CONFIG_HOME/hypr/lock.sh";;
	"suspend")
		systemctl suspend -i \
		&& "$XDG_CONFIG_HOME/hypr/lock.sh";;
	"log-out")
		qlogout=$(zenity --warning \
		--title="log out" --text "log out?" \
		--ok-label="no" \
		--extra-button "yes"
		)
		if [ "$qlogout" = 'yes' ]; then
			hyprctl dispatch exit 1
		fi;;
	"restart")
		qrestart=$(zenity --warning \
		--title="log out" --text "restart?" \
		--ok-label="no" \
		--extra-button "yes"
		)
		if [ "$qrestart" = 'yes' ]; then
			reboot
		fi;;
	"shut down")
		qshutdown=$(zenity --warning \
		--title="log out" --text "shut down?" \
		--ok-label="no" \
		--extra-button "yes"
		)
		if [ "$qshutdown" = 'yes' ]; then
			shutdown now
		fi;;
esac