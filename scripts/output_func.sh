# COLOR
RED="\e[31m"
YELL="\e[33m"
BLUE="\e[94m"
RED="\e[31m"
NC="\e[39m"

simple_output() {
	echo "[${YELL}+${NC}] $@"
}

sub_simple_output() {
	echo "\t[${YELL}+${NC}] $@"
}


simple_error() {
	echo "[${RED}-${NC}] $@"
}
