#!/bin/bash

screen_locked=$(dbus-send --session --print-reply --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.GetActive | grep 'boolean true')

notify_bedtime="22:30"
bedtime="23:00"
suspend_time="06:00"

lock_wait_time=60

current_time=$(date +%H:%M)
if [[ -z $screen_locked ]]; then
	if [[ "$current_time" < "$suspend_time" ]]; then
		notify-send -u critical "WARNING: it's bedtime, system will be suspend in $lock_wait_time seconds"
		sleep $lock_wait_time
		systemctl suspend
	elif [[ "$current_time" > "$bedtime" || "$current_time" == "$bedtime" ]]; then
		notify-send -u critical "It's to late, you should go to bed right now"
	elif [[ "$current_time" > "$notify_bedtime" || "$current_time" == "$notify_bedtime" ]]; then
		notify-send -t 10000 "It's late at night, time to sleep"
	fi
fi
