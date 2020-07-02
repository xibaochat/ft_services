# COLOR
RED="\033[31m"
YELL="\033[33m"
BLUE="\033[94m"
RED="\033[31m"
NC="\033[39m"

simple_output() {
	echo "[${YELL}+${NC}] $@"
}

sub_simple_output() {
	echo "\t[${YELL}+${NC}] $@"
}


simple_error() {
	echo "[${RED}-${NC}] $@"
}
