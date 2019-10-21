#!/bin/bash

# Installing inkscape
if hash inkscape 2>/dev/null
then
	echo "inkscape is ready to be used"
else
	echo "installing inkscape:"
	sudo apt-get install -y inkscape
	echo "==============================="
fi

# Installing imagemagick
if hash convert 2>/dev/null
then
	echo "convert is ready to be used"
else
	echo "installing imagemagick:"
	sudo apt-get install -y imagemagick
	echo "==============================="
fi

# Checking installs
if hash inkscape 2>/dev/null
then
	if hash convert 2>/dev/null
	then
		echo 'YOU ARE READY TO RUN "./mkico.sh"'
	else
		echo "Error! installing of imagemagick faild!"
	fi
else
	echo "Error! installing of inkscape faild!"
fi
