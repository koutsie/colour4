#   _____         _                        ___ ______                                       
#  /  __ \       | |                      /   ||  _  \                                      
#  | /  \/  ___  | |  ___   _   _  _ __  / /| || | | |  __ _   ___  _ __ ___    ___   _ __  
#  | |     / _ \ | | / _ \ | | | || '__|/ /_| || | | | / _` | / _ \| '_ ` _ \  / _ \ | '_ \ 
#  | \__/\| (_) || || (_) || |_| || |   \___  || |/ / | (_| ||  __/| | | | | || (_) || | | |
#   \____/ \___/ |_| \___/  \__,_||_|       |_/|___/   \__,_| \___||_| |_| |_| \___/ |_| |_|
#                                                                                           
#                                                                                           
# 			                                                                                      v0.1
# I know this is bad code but send me a pull and ill merge if you got any idea to make this better
while :
do
red=$(find /sys/class/leds* | grep red)
green=$(find /sys/class/leds* | grep green)
blue=$(find /sys/class/leds* | grep blue)
global=$(find /sys/class/leds* | grep global)

controller=$(lsusb | grep "Sony")
if [ -n "$controller" ]; then
  echo "Controller is connected"
	cat "/$HOME/Colour4/red.c4" > "$red"/brightness
	cat "/$HOME/Colour4/green.c4" > "$green"/brightness
	cat "/$HOME/Colour4/blue.c4" > "$blue"/brightness
else
  echo "Controller is not connected."
fi
sleep 0.2
done
