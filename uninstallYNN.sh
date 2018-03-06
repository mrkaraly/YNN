#!/bin/sh
sleep 3
echo "[:(]Removing the forwarding lines from Privoxy config file"
sleep 2
sed -i "/forward-socks5 \/ localhost:9050 ./d" /etc/privoxy/config
sed -i "/forward-socks4 \/ localhost:9050 ./d" /etc/privoxy/config
sed -i "/forward-socks4a \/ localhost:9050 ./d" /etc/privoxy/config
sleep 3
echo "[:(] Disable the proxy settings"
unset http_proxy
unset https_proxy
unset socks_proxy
sleep 3
echo "[:(] Removing the export lines from bash.bashrc file"
sleep 2
sed -i "/export http_proxy=\"http\:\/\/localhost:8118\"/d" /etc/bash.bashrc
sed -i "/export https_proxy=\"http\:\/\/localhost:8118\"/d" /etc/bash.bashrc
sed -i "/export socks_proxy=\"http\:\/\/localhost:9050\"/d" /etc/bash.bashrc
sleep 2
echo "[:(] Removing the export lines from profile config file"
sleep 2
sed -i "/export http_proxy=\"http\:\/\/localhost:8118\"/d" /etc/profile
sed -i "/export https_proxy=\"http\:\/\/localhost:8118\"/d" /etc/profile
sed -i "/export socks_proxy=\"http\:\/\/localhost:9050\"/d" /etc/profile
sleep 3
echo "[:(] Restoring gnome proxy settings"
gsettings set org.gnome.system.proxy.http host ''
gsettings set org.gnome.system.proxy.http port 0
gsettings set org.gnome.system.proxy.https host ''
gsettings set org.gnome.system.proxy.https port 0
gsettings set org.gnome.system.proxy.socks host ''
gsettings set org.gnome.system.proxy.socks port 0
gsettings set org.gnome.system.proxy mode 'none'
sleep 3
echo "[+] The proxy Disabled! :("
sleep 2
echo "[:(] Deleting the ynn command from .bashrc file"
sed -i "/alias ynn='service tor start && service privoxy start'/d" /root/.bashrc
sleep 2
/usr/bin/clear
sleep 1
echo "[♥] Thanks for using my script"
echo "[♥] I hope it works for you"
echo "[♥] Mr Kara Ly"
echo "[♥] Twitter : @MrKaraLy"
echo "[♥] FaceBook : @hackerlibya100"
echo "[♥] GoodBye . "
