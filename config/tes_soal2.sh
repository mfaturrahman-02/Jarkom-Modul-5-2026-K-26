# Tes soal 2. Jalankan blok sesuai nama router di console router tersebut.

# ===== Gendou =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.110   # Yui (eth0)
ping -c 3 192.224.4.114   # Hikari (eth0)
ping -c 3 192.224.4.118   # Fuyutsuki (eth0)
ping -c 3 192.224.4.122   # Asuka (eth0)
ping -c 3 192.224.4.126   # Kaji (eth0)
ping -c 3 192.224.4.130   # Misato (eth0)
ping -c 3 192.224.4.134   # Shigeru (eth0)
ping -c 3 8.8.8.8   # cek internet lewat NAT1

# ===== Yui =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.109   # Gendou (eth1)
ping -c 3 192.224.4.138   # Rei (eth0)
ping -c 3 192.224.4.142   # Shinji (eth0)
ping -c 3 192.224.4.146   # Mari (eth0)

# ===== Rei =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.137   # Yui (eth2)

# ===== Shinji =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.141   # Yui (eth1)

# ===== Mari =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.145   # Yui (eth3)

# ===== Hikari =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.113   # Gendou (eth3)
ping -c 3 192.224.4.150   # Kaworu (eth0)

# ===== Kaworu =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.149   # Hikari (eth1)

# ===== Fuyutsuki =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.117   # Gendou (eth4)
ping -c 3 192.224.4.154   # Maya (eth0)
ping -c 3 192.224.4.158   # Toji (eth0)

# ===== Maya =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.153   # Fuyutsuki (eth2)

# ===== Toji =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.157   # Fuyutsuki (eth3)

# ===== Asuka =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.121   # Gendou (eth5)
ping -c 3 192.224.4.162   # Kensuke (eth0)
ping -c 3 192.224.4.166   # Ritsuko (eth0)

# ===== Kensuke =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.161   # Asuka (eth1)

# ===== Ritsuko =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.165   # Asuka (eth2)

# ===== Kaji =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.125   # Gendou (eth6)

# ===== Misato =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.129   # Gendou (eth7)

# ===== Shigeru =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.133   # Gendou (eth8)
ping -c 3 192.224.4.170   # Mokoto (eth0)

# ===== Mokoto =====
ip -br a
cat /proc/sys/net/ipv4/ip_forward
ping -c 3 192.224.4.169   # Shigeru (eth2)
