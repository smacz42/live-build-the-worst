#!/bin/bash

# Script to download the latest 32 bit tor browser bundle and make it
# available to the openbox menu.

tput clear
header
say \
'
This quick script will install the Tor Browser Bundle.

Once this script completes, you may access the Tor Browser from the menu entry in the desktop menu:

> Network
>> WWW Browsers
>>> Tor"'
'

prompt $"  Hit \"Enter\" to continue, or \"q\" to quit..." Q && exit 0

cd ~/tmp

echo "Downloading the Tor Browser Bundle" && sleep 3

wget -O tor-browser.tar.xz \
    $(wget -O - https://www.torproject.org/download/download-easy.html.en \
    | grep "lintbb32 =" \
    | sed -e "s/'+lang+'/en-US/g" \
          -e 's^[ ^t]*//g' \
          -e "s/var lintbb32 = '..\//https:\/\/www.torproject.org\//g"
          -e "s/';$//g" \)

echo "Unpacking the Tor Browser Bundle" && sleep 3

tar -xvf tor-browser.tar.xz

header
say '
 _____ ___ _   _ ___ ____  _   _ _____ ____  _
|  ___|_ _| \ | |_ _/ ___|| | | | ____|  _ \| |
| |_   | ||  \| || |\___ \| |_| |  _| | | | | |
|  _|  | || |\  || | ___) |  _  | |___| |_| |_|
|_|   |___|_| \_|___|____/|_| |_|_____|____/(_)


You may now start the Tor Broswer by accessing it in the desktop menu:

> Network
>> WWW Browsers
>>> Tor

Hit any key to exit...'

read -srn1
clear
exit 0
