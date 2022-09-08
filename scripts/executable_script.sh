#!/bin/bash

# script to config gtk theme

GTK_VERSION=3
TWEAK_APP=lxappearance

# paths
user_home=/home/${USER}
theme_name=$@ # all arguments....
theme_dir=${user_home}/.themes
system_theme_dir=/usr/share/themes

CURRENT_GTK_THEME=$(grep gtk-theme-name ${HOME}/.config/gtk-${GTK_VERSION}.0/settings.ini | awk '{split($0,a,"="); print a[2]}')
echo 
echo "Your theme is: ${CURRENT_GTK_THEME}"

if [ $# -eq 0 ]; then
		echo
		echo "Avaliable Gtk${GTK_VERSION} themes:"
		find ${system_theme_dir} -type d -name "gtk-${GTK_VERSION}.0"| awk -F'/' '{print "   " $5}'

      if [ -d ${theme_dir} ]; then
		    find ${theme_dir} -type d -name "gtk-${GTK_VERSION}.0" | awk -F'/' '{print "   " $5}'
      fi
		echo 
		echo "To change to one of them:"
		echo "   $ $(basename $0) <theme_name>"
    exit
fi

# Check if theme exists then copy it if it does
flag=0
for x in $system_theme_dir $theme_dir; do
	if [ -d ${x}/"${theme_name}"/gtk-${GTK_VERSION}.0 ]; then
  	   cp -a ${x}/"${theme_name}"/gtk-${GTK_VERSION}.0 ${user_home}/.config
  	   echo "Gtk${GTK_VERSION} theme ${theme_name} installed"
  	   flag=1
	fi
done


