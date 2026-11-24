#!/bin/bash
# penpen.sh - Pasang paket & jalankan listener Pen-Pen di TCP port 80

ip addr replace 192.224.3.194/27 dev eth0
ip link set eth0 up
ip route replace default via 192.224.3.193
echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.conf

apt-get update
apt-get install -y iptables netcat-traditional

echo "Pen-Pen listening on TCP port 80..."
while true; do
    echo "Welcome to $(hostname)" | nc.traditional -l -p 80 -q 0
done
