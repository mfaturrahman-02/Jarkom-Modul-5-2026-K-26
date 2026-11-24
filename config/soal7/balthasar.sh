#!/bin/bash
# balthasar.sh - Pastikan jaringan & DNS aktif, pasang paket, lalu jalankan listener (port 5000 & 5001)

ip addr replace 192.224.4.59/29 dev eth0
ip link set eth0 up
ip route replace default via 192.224.4.57
echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.conf

apt-get update
apt-get install -y iptables netcat-traditional

echo "Magi-Balthasar listening on TCP port 5000 and 5001..."
(while true; do nc.traditional -l -p 5000 | tee -a /root/balthasar_5000.log; done) &
(while true; do nc.traditional -l -p 5001 | tee -a /root/balthasar_5001.log; done) &
wait
