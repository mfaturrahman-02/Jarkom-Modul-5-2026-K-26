#!/bin/bash
# casper.sh - Pastikan jaringan & DNS aktif, pasang paket, lalu jalankan listener (port 5000)

ip addr replace 192.224.4.58/29 dev eth0
ip link set eth0 up
ip route replace default via 192.224.4.57
echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.conf

apt-get update
apt-get install -y iptables netcat-traditional

echo "Magi-Casper listening on TCP port 5000..."
while true; do
    nc.traditional -l -p 5000 | tee -a /root/casper.log
done
