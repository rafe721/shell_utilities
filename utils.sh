#!/bin/bash

BLACK='\033[0;30m'
DARK_GRAY='\033[1;30m'
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
LIGHT_GREY='\033[0;37m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# printf "I ${RED}love${NC} Stack Overflow\n"
# echo -e "I ${RED}love${NC} Stack Overflow"

PROPERTY_FILE=app.properties
# Usage: getProperty <property_key> <property_file> <optional: default if property_value for property_key not found>
function getProperty {
	PROP_KEY=$1
	if [ ! -z $2 ]; then
		PROPERTY_FILE=$2
	fi
	# default return
	DEFAULT=""
	if [ ! -z $3 ]; then
		DEFAULT=$3
	fi
	# read file | find 'prop_key' | ignore lines starting with '#' | from the top |
	# delimit with '=' second field | remove carriaged return
	PROP_VALUE=`cat $PROPERTY_FILE | grep "$PROP_KEY" | grep -v "#" | head -1 | cut -d'=' -f2 | tr '\r' ' '`
	if [ ! -z $PROP_VALUE ]; then
		echo $PROP_VALUE
	else
		echo $DEFAULT
	fi
}
