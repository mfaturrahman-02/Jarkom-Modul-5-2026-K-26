#!/bin/bash
# gendo.sh - Firewall & NAT Gendou (Soal 2-5)

# Pastikan IP forwarding aktif (Soal 2)
echo 1 > /proc/sys/net/ipv4/ip_forward

# Reset semua chain agar tidak duplikat saat dijalankan ulang
iptables -F
iptables -X
iptables -t nat -F

# Policy default OUTPUT ACCEPT, INPUT & FORWARD DROP (Soal 5)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# NAT Masquerade untuk traffic internal keluar ke NAT1 / eth0 (Soal 4)
iptables -t nat -A POSTROUTING -s 192.224.0.0/16 -o eth0 -j MASQUERADE

# Loopback dan DHCP dari NAT1 (eth0) tetap jalan
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 67 --dport 68 -j ACCEPT

# (a) Balasan koneksi yang sudah ada (ESTABLISHED, RELATED)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# (d) Traffic dari jaringan internal ke Gendou sendiri
iptables -A INPUT ! -i eth0 -s 192.224.0.0/16 -j ACCEPT

# (b) Traffic dari jaringan internal ke internet (keluar lewat eth0)
iptables -A FORWARD ! -i eth0 -s 192.224.0.0/16 -o eth0 -j ACCEPT

# (c) Traffic antar-LAN di dalam jaringan internal
iptables -A FORWARD ! -i eth0 -s 192.224.0.0/16 -d 192.224.0.0/16 -j ACCEPT
