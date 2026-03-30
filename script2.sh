#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="vlc"

# Check if package is installed
if dpkg -l | grep -w $PACKAGE > /dev/null; then
    echo "$PACKAGE is installed."
    dpkg -s $PACKAGE | grep -E 'Version|Maintainer|Description'
else
    echo "$PACKAGE is NOT installed."
fi

# Case statement
case $PACKAGE in
    vlc) echo "VLC: A powerful open-source multimedia player" ;;
    apache2) echo "Apache: backbone of the web" ;;
    mysql-server) echo "MySQL: database for modern applications" ;;
    firefox) echo "Firefox: open-source browser for privacy" ;;
    git) echo "Git: version control for developers" ;;
    *) echo "Unknown package" ;;
esac
