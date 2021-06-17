#!/bin/bash

command(){
	curl wttr.in/Brampton
	$SHELL
}
export -f command
gnome-terminal -e "bash -c 'command'"
