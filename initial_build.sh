#!/bin/bash

# Global parameters
DIVIDINGLINE="--------------------------------------------------------------------------------"
DATE=`date +%Y%m%d`
WORKINGDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Let's get functional
lines() {
	echo $DIVIDINGLINE
	echo $DIVIDINGLINE
}

fresh() {
	clear
	lines
}

# Sayin' hey
fresh
echo "Welcome to your fresh Linode."
echo -n "Press any key to continue."
read -n 1 -s -p ""

# Asking the important questions
fresh
echo "What's your fully-qualified domain name? (i.e. test.kdor.io) "
echo ""
echo -n -e "\t--> "
read FQDN
echo $FQDN | grep -q "."
if [ $? -eq 0 ]
	then
		echo ""
		echo -n -e "\tThanks!"
		SHORTNAME=`echo $FQDN | cut -d"." -f1` # Taking out the domain, we won't need that
		sleep 2
	else
		echo -n "Seems like your missing a domain name - let's try that again. "
		read FQDN
fi
