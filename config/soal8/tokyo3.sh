#!/bin/bash
# tokyo3.sh - Pasang paket & jalankan listener Tokyo3-Core di TCP port 80 & 8080

ip addr replace 192.224.4.106/30 dev eth0
ip link set eth0 up
ip route replace default via 192.224.4.105
echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.conf

apt-get update
apt-get install -y iptables netcat-traditional

echo "Tokyo3-Core listening on TCP port 80 and 8080..."
(while true; do echo "Welcome to $(hostname)" | nc.traditional -l -p 80 -q 0; done) &
(while true; do echo "syifa imutz" | nc.traditional -l -p 8080 -q 0; done) &
wait
