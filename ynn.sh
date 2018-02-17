#!/bin/sh
#Banner
/usr/bin/clear
cat << "BANNER"
         Script to pass all your traffic through Tor

	
	           <-. (`-')_ <-. (`-')_ 
	     .->      \( OO) )   \( OO) )
	 ,--.'  ,-.,--./ ,--/ ,--./ ,--/ 
	(`-')'.'  /|   \ |  | |   \ |  | 
	(OO \    / |  . '|  |)|  . '|  |)
	 |  /   /) |  |\    | |  |\    | 
	 `-/   /`  |  | \   | |  | \   | 
	   `--'    `--'  `--' `--'  `--' 
		By : Mr.Kara
BANNER
echo ""
echo ""
echo "[!]Updating the repositories && Downloading requirements"
sudo apt-get update
sleep 2
sudo apt-get install tor && sudo apt-get install privoxy
sleep 3
echo ""
echo "[+]All requirements have been downloaded."
echo ""
sleep 3
echo "[!]Adding the forwarding lines to Privoxy config file"
string1="localhost:9050"
serchs="/etc/privoxy/config"
if grep -q $string1 $serchs;then
        echo "[|]The lines already there :3."
else
        echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
        echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
        echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config
	sleep 3
	echo "[+]The lines have been added"
fi
echo ""
sleep 3
echo ""
echo ""
sleep 3
echo "[!]Configuring the proxy"
sleep 3
export http_proxy="http://localhost:8118"
export https_proxy="http://localhost:8118"
export socks_proxy="http://localhost:9050"
sleep 3
echo ""
echo ""
echo "[+]The proxy have been configured"
echo ""
sleep 3
echo "[!]Starting services"
service privoxy start && service tor start
sleep 3
echo ""
echo "[+]Services have been started"
echo ""
sleep 3
echo "[!]Testing the connection and showing your new ip"
echo ""
sleep 3
ipnt=$(curl ident.me)
echo ""
echo ""
echo "Your ip is $ipnt"
echo ""
