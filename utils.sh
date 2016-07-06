#!bin/sh

# Conts
# ----------------------------------
ARROW="→"
CHECK="✔"
CLOSE="✗"
HEART="♥"

# Loggers
# ----------------------------------

function msg() {
	echo "\033[0;37m$1\033[0m";
}

function msg_bold() {
	echo "\033[1;34m$1\033[0m";
}

function msg_ok() {
	echo "$ARROW\033[1;32m  $1 $CHECK\033[0m";
}

function msg_run() {
	echo "$ARROW\033[1;35m  $1 $ $2\033[0m";
}

function msg_done() {
	echo "$ARROW\033[1;37m  $1 \033[0m";
}

# Conditions
# ----------------------------------

function has() {
	[[ -x "$(command -v "$1")" ]];
}

function has_not() {
	! has "$1" ;
}

function has_dir() {
	[[ -d "$1" ]];
}

function has_not_dir() {
	! has_dir "$1" ;
}

function hello() {
	msg ""
	msg_bold "    _____      _ "
	msg_bold "   / ____|    | | "
	msg_bold "  | (___   ___| |_ _   _ _ __ "
	msg_bold "   \___ \ / _ \ __| | | | '_ \ "
	msg_bold "   ____) |  __/ |_| |_| | |_) | "
	msg_bold "  |_____/ \___|\__|\__,_| .__/ "
	msg_bold "                       | | "
	msg_bold "                       |_| "
	msg ""
	msg "   \e[3mMade by @iagodahlem with \033[1;31m♥\033[0m "
	msg ""
	msg " ------------------------------- "
	msg ""
}
