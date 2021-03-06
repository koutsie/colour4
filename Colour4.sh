#!/bin/bash
#  _____       _                    ___ 
# /  __ \     | |                  /   |
# | /  \/ ___ | | ___  _   _ _ __ / /| |
# | |    / _ \| |/ _ \| | | | '__/ /_| |
# | \__/\ (_) | | (_) | |_| | |  \___  |
#  \____/\___/|_|\___/ \__,_|_|      |_/
#
# Change your PS4 controllers colours!
# 			      v0.1 RC3
# I know this is bad code but send me a pull and ill merge if you got any idea to make this better

mkdir -p /$HOME/Colour4/
while getopts "d,t,h,o,0,1,c,r,s" opt; do
      	red=$(find /sys/class/leds* | grep red)
	green=$(find /sys/class/leds* | grep green)
	blue=$(find /sys/class/leds* | grep blue)
	global=$(find /sys/class/leds* | grep global)
  case $opt in
    d)
	echo "Red is $red"
	echo "Green is $green"
	echo "Blue is $blue"
	echo "Global is $global"

	echo 0 > "$global"/brightness
	sleep 0.2
	echo 1 > "$global"/brightness
	exit 1
      ;;
    c)
	Red='\033[0;31m'
	read -p "Color (1(Red) 2(Green) 3(Blue) 4(Orange) 5(Pink)): " CONDITION;
	Color_Off='\033[0m'

	if [ "$CONDITION" == "1" ]; then
	    clear
		echo 255 > "$red"/brightness
		echo 0 > "$green"/brightness
		echo 0 > "$blue"/brightness
	        exit
	fi

	if [ "$CONDITION" == "2" ]; then
	    clear
		echo 0 > "$red"/brightness
		echo 255 > "$green"/brightness
		echo 0 > "$blue"/brightness
	        exit
	fi

	if [ "$CONDITION" == "3" ]; then
	    clear
		echo 0 > "$red"/brightness
		echo 0 > "$green"/brightness
		echo 255 > "$blue"/brightness
	        exit
	fi

	if [ "$CONDITION" == "4" ]; then
	    clear
		echo 255 > "$red"/brightness
		echo 165 > "$green"/brightness
		echo 0 > "$blue"/brightness
	        exit
	fi

	if [ "$CONDITION" == "5" ]; then
	    clear
		echo 255 > "$red"/brightness
		echo 20 > "$green"/brightness
		echo 147 > "$blue"/brightness
	        exit
	fi

      ;;
    0)
	echo 0 > "$global"/brightness
	exit 1
      ;;
    1)
	echo 1 > "$global"/brightness
	exit 1
      ;;
    r)
	read -p "How much red: " CONDITION;
	echo "$CONDITION" > "$red"/brightness
	read -p "How much green: " CONDITION;
	echo "$CONDITION" > "$green"/brightness
	read -p "How much blue: " CONDITION;
	echo "$CONDITION" > "$blue"/brightness
	exit 1
      ;;
    s)
	read -p "How much red: " CONDITION;
	echo "$CONDITION" > "$red"/brightness
	echo "$CONDITION" > /tmp/red.c4
	read -p "How much green: " CONDITION;
	echo "$CONDITION" > "$green"/brightness
	echo "$CONDITION" > /tmp/green.c4
	read -p "How much blue: " CONDITION;
	echo "$CONDITION" > "$blue"/brightness
	echo "$CONDITION" > /tmp/blue.c4
	read -p "Is this the colour you want (yes/no): " CONDITION;
	if [ "$CONDITION" == "yes" ]; then
	   clear
		mv /tmp/red.c4 /$HOME/Colour4/red.c4
		mv /tmp/green.c4 /$HOME/Colour4/green.c4
		mv /tmp/blue.c4 /$HOME/Colour4/blue.c4
	       exit
	fi
	if [ "$CONDITION" == "no" ]; then
	    clear
	        exit
	fi
	exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

echo "Remember: Colour4 needs root!"
echo "  _____       _                    ___  ";
echo " /  __ \     | |                  /   | ";
echo " | /  \/ ___ | | ___  _   _ _ __ / /| | ";
echo " | |    / _ \| |/ _ \| | | | '__/ /_| | ";
echo " | \__/\ (_) | | (_) | |_| | |  \___  | ";
echo "  \____/\___/|_|\___/ \__,_|_|      |_/ ";
echo "                                        ";
echo "                                	      ";
echo "Help:";
echo "c - Show the colour list";
echo "1/0 - Turn on/off the leds"
echo "r - set an RGBA for the leds"
echo "s - Set the default colour for Colour4Daemon"
echo "d - Debug mode"
		
	
