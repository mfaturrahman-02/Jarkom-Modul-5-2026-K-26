# PRAKTIKUM JARKOM MODUL 5 K 26 - 2026

## Angota Kelompok

| Nama                         | NRP        |
| ---------------------------- | ---------- |
| Az Zahra Fiddien Al Farabi          | 5027251021 |
| Muhammad Faturrahman | 5027241065 |

## Babak 1: Membangun Geofront 
1. Markas tanpa peta: tengah malam alarm meraung, dan Ritsuko 
terdiam. Markas sebesar ini dibangun tanpa peta alamat. Gendo 
anti pemborosan, jadi tiap subnet memakai prefix terkecil yang 
muat. Bagi prefix IP kelompokmu dengan VLSM untuk 17 LAN dan 16 
link antar-router, urut dari kebutuhan terbesar. Tunjukkan tabel 
berisi network, prefix, gateway, broadcast, IP terpakai, dan sisa. 
Tunjukkan juga gambar pohon IP, dengan subnet jalur Dummy-Plug 
ke Armisael dilingkari. Di laporan, jelaskan hitungan satu subnet.

# Hasil Perhitungan VLSM – 192.224.0.0/16

Prefix kelompok yang dipakai: **192.224.0.0/16** (dari "192.224.x.x"). Ada **17 LAN** dan **16 link antar-router**, dialokasikan berurutan dari kebutuhan terbesar.

## Aturan yang dipakai

- **Kebutuhan host LAN** = jumlah host container + 1 interface router (gateway).
- **Kebutuhan host link** = 2 interface router (link tidak punya container).
- Rumus: 2ⁿ − 2 ≥ Kebutuhan Host, lalu Prefix = 32 − n. Angka −2 pada rumus adalah Network ID dan broadcast, sehingga tidak perlu ditambahkan lagi ke kebutuhan.
- Urutan alokasi: dari block terbesar. Jika ukuran sama: **LAN dulu daripada link**, lalu urutan di tabel host. Link tidak punya nomor di tabel, jadi diurutkan dari Gendou ke luar.
- Di tiap link, router sisi pusat (lebih dekat ke Gendou) mendapat IP pertama, router sisi luar IP kedua.
- Gateway LAN = IP usable pertama.
- NAT1 bukan link antar-router, jadi tidak dihitung.
- Switch-Archive ada di tabel host tetapi tidak tampak di gambar topologi; tetap dihitung sebagai LAN ke-15 karena soal menyebut 17 LAN.

## Contoh Hitungan Satu Subnet: Switch-Lab (router Ritsuko)

Subnet ini dipilih karena termasuk jalur Dummy-Plug → Armisael.

### a. Menentukan Prefix VLSM

- **Kebutuhan Host:** 6 host (Entry-Plug 3 + Dummy-Plug 2 = 5 host, ditambah 1 interface router Ritsuko sebagai gateway).
- **Rumus:** 2ⁿ − 2 ≥ Kebutuhan Host.
- **Pencarian n (bit host):**
  - 2² − 2 = 2 (kurang)
  - 2³ − 2 = 6 (cukup, pas) → maka n = 3.
- **Prefix CIDR:** 32 − n = 32 − 3 = **/29**.

### b. Menghitung Block Size (Total IP)

- **Rumus:** 2^(32 − Prefix) = 2^(32 − 29) = 2³ = **8 IP**.
- Block size 8 kurang dari 256, jadi subnet ini hanya menggeser **oktet keempat** sebanyak 8.

### c. Menentukan Network ID (NID) dan Broadcast

- **Network ID:** subnet ini datang setelah Switch-Dock (192.224.4.32/28, block 16), sehingga NID dimulai dari `192.224.4.48`.
- **Next Network:** NID + Block Size (oktet ke-4) → 48 + 8 = 56. Subnet berikutnya dimulai di `192.224.4.56`.
- **Broadcast:** satu angka sebelum Next Network → `192.224.4.55`.

### d. Menentukan Range IP Usable

- **IP pertama:** Network ID + 1 → `192.224.4.49`.
- **IP terakhir:** Broadcast − 1 → `192.224.4.54`.
- **Range host:** `192.224.4.49 - 192.224.4.54` (6 host valid).

### e. Gateway, IP Terpakai, dan Sisa

- **Gateway:** IP pertama → `192.224.4.49` (Ritsuko).
- **IP terpakai:** 5 host + 1 gateway = 6.
- **Sisa:** 6 host valid − 6 terpakai = **0**.

## Tabel Kebutuhan dan Prefix

| Subnet | Host container | Kebutuhan (host + interface router) | n (bit host) | Prefix | Block size | Host valid | Subnet mask |
|---|---:|---:|---:|---:|---:|---:|---|
| Switch-Quarters | 500 | 501 | 9 | /23 | 512 | 510 | 255.255.254.0 |
| Switch-Comm | 200 | 201 | 8 | /24 | 256 | 254 | 255.255.255.0 |
| Switch-Hangar | 100 | 101 | 7 | /25 | 128 | 126 | 255.255.255.128 |
| Switch-Bunker | 55 | 56 | 6 | /26 | 64 | 62 | 255.255.255.192 |
| Switch-Medic | 26 | 27 | 5 | /27 | 32 | 30 | 255.255.255.224 |
| Switch-Relay | 25 | 26 | 5 | /27 | 32 | 30 | 255.255.255.224 |
| Switch-Garden | 14 | 15 | 5 | /27 | 32 | 30 | 255.255.255.224 |
| Switch-Dock | 12 | 13 | 4 | /28 | 16 | 14 | 255.255.255.240 |
| Switch-Lab | 5 | 6 | 3 | /29 | 8 | 6 | 255.255.255.248 |
| Switch-Terminal | 3 | 4 | 3 | /29 | 8 | 6 | 255.255.255.248 |
| Switch-Cage | 3 | 4 | 3 | /29 | 8 | 6 | 255.255.255.248 |
| Switch-Dogma | 2 | 3 | 3 | /29 | 8 | 6 | 255.255.255.248 |
| Switch-Monolith | 2 | 3 | 3 | /29 | 8 | 6 | 255.255.255.248 |
| Switch-Radar | 4 | 5 | 3 | /29 | 8 | 6 | 255.255.255.248 |
| Switch-Archive | 1 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Switch-Intel | 1 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Switch-Cmd | 1 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Gendou–Yui | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Gendou–Hikari | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Gendou–Fuyutsuki | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Gendou–Asuka | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Gendou–Kaji | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Gendou–Misato | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Gendou–Shigeru | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Yui–Rei | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Yui–Shinji | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Yui–Mari | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Hikari–Kaworu | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Fuyutsuki–Maya | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Fuyutsuki–Toji | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Asuka–Kensuke | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Asuka–Ritsuko | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |
| Link Shigeru–Mokoto | 0 | 2 | 2 | /30 | 4 | 2 | 255.255.255.252 |

## Tabel Hasil VLSM

★ = subnet pada jalur Dummy-Plug → Armisael (yang dilingkari di gambar pohon).

| No | Subnet | Prefix | Network ID | Range host | Broadcast | Gateway | IP terpakai | Sisa |
|---:|---|---:|---|---|---|---|---:|---:|
| 1 | Switch-Quarters | /23 | 192.224.0.0 | 192.224.0.1 - 192.224.1.254 | 192.224.1.255 | 192.224.0.1 | 501 | 9 |
| 2 | Switch-Comm | /24 | 192.224.2.0 | 192.224.2.1 - 192.224.2.254 | 192.224.2.255 | 192.224.2.1 | 201 | 53 |
| 3 | Switch-Hangar | /25 | 192.224.3.0 | 192.224.3.1 - 192.224.3.126 | 192.224.3.127 | 192.224.3.1 | 101 | 25 |
| 4 | Switch-Bunker | /26 | 192.224.3.128 | 192.224.3.129 - 192.224.3.190 | 192.224.3.191 | 192.224.3.129 | 56 | 6 |
| 5 | Switch-Medic | /27 | 192.224.3.192 | 192.224.3.193 - 192.224.3.222 | 192.224.3.223 | 192.224.3.193 | 27 | 3 |
| 6 | Switch-Relay | /27 | 192.224.3.224 | 192.224.3.225 - 192.224.3.254 | 192.224.3.255 | 192.224.3.225 | 26 | 4 |
| 7 | Switch-Garden | /27 | 192.224.4.0 | 192.224.4.1 - 192.224.4.30 | 192.224.4.31 | 192.224.4.1 | 15 | 15 |
| 8 | Switch-Dock | /28 | 192.224.4.32 | 192.224.4.33 - 192.224.4.46 | 192.224.4.47 | 192.224.4.33 | 13 | 1 |
| 9 | **Switch-Lab** ★ | /29 | 192.224.4.48 | 192.224.4.49 - 192.224.4.54 | 192.224.4.55 | 192.224.4.49 | 6 | 0 |
| 10 | Switch-Terminal | /29 | 192.224.4.56 | 192.224.4.57 - 192.224.4.62 | 192.224.4.63 | 192.224.4.57 | 4 | 2 |
| 11 | Switch-Cage | /29 | 192.224.4.64 | 192.224.4.65 - 192.224.4.70 | 192.224.4.71 | 192.224.4.65 | 4 | 2 |
| 12 | Switch-Dogma | /29 | 192.224.4.72 | 192.224.4.73 - 192.224.4.78 | 192.224.4.79 | 192.224.4.73 | 3 | 3 |
| 13 | **Switch-Monolith** ★ | /29 | 192.224.4.80 | 192.224.4.81 - 192.224.4.86 | 192.224.4.87 | 192.224.4.81 | 3 | 3 |
| 14 | Switch-Radar | /29 | 192.224.4.88 | 192.224.4.89 - 192.224.4.94 | 192.224.4.95 | 192.224.4.89 | 5 | 1 |
| 15 | Switch-Archive | /30 | 192.224.4.96 | 192.224.4.97 - 192.224.4.98 | 192.224.4.99 | 192.224.4.97 | 2 | 0 |
| 16 | Switch-Intel | /30 | 192.224.4.100 | 192.224.4.101 - 192.224.4.102 | 192.224.4.103 | 192.224.4.101 | 2 | 0 |
| 17 | Switch-Cmd | /30 | 192.224.4.104 | 192.224.4.105 - 192.224.4.106 | 192.224.4.107 | 192.224.4.105 | 2 | 0 |
| 18 | Link Gendou–Yui | /30 | 192.224.4.108 | 192.224.4.109 - 192.224.4.110 | 192.224.4.111 | - | 2 | 0 |
| 19 | Link Gendou–Hikari | /30 | 192.224.4.112 | 192.224.4.113 - 192.224.4.114 | 192.224.4.115 | - | 2 | 0 |
| 20 | Link Gendou–Fuyutsuki | /30 | 192.224.4.116 | 192.224.4.117 - 192.224.4.118 | 192.224.4.119 | - | 2 | 0 |
| 21 | **Link Gendou–Asuka** ★ | /30 | 192.224.4.120 | 192.224.4.121 - 192.224.4.122 | 192.224.4.123 | - | 2 | 0 |
| 22 | Link Gendou–Kaji | /30 | 192.224.4.124 | 192.224.4.125 - 192.224.4.126 | 192.224.4.127 | - | 2 | 0 |
| 23 | Link Gendou–Misato | /30 | 192.224.4.128 | 192.224.4.129 - 192.224.4.130 | 192.224.4.131 | - | 2 | 0 |
| 24 | **Link Gendou–Shigeru** ★ | /30 | 192.224.4.132 | 192.224.4.133 - 192.224.4.134 | 192.224.4.135 | - | 2 | 0 |
| 25 | Link Yui–Rei | /30 | 192.224.4.136 | 192.224.4.137 - 192.224.4.138 | 192.224.4.139 | - | 2 | 0 |
| 26 | Link Yui–Shinji | /30 | 192.224.4.140 | 192.224.4.141 - 192.224.4.142 | 192.224.4.143 | - | 2 | 0 |
| 27 | Link Yui–Mari | /30 | 192.224.4.144 | 192.224.4.145 - 192.224.4.146 | 192.224.4.147 | - | 2 | 0 |
| 28 | Link Hikari–Kaworu | /30 | 192.224.4.148 | 192.224.4.149 - 192.224.4.150 | 192.224.4.151 | - | 2 | 0 |
| 29 | Link Fuyutsuki–Maya | /30 | 192.224.4.152 | 192.224.4.153 - 192.224.4.154 | 192.224.4.155 | - | 2 | 0 |
| 30 | Link Fuyutsuki–Toji | /30 | 192.224.4.156 | 192.224.4.157 - 192.224.4.158 | 192.224.4.159 | - | 2 | 0 |
| 31 | Link Asuka–Kensuke | /30 | 192.224.4.160 | 192.224.4.161 - 192.224.4.162 | 192.224.4.163 | - | 2 | 0 |
| 32 | **Link Asuka–Ritsuko** ★ | /30 | 192.224.4.164 | 192.224.4.165 - 192.224.4.166 | 192.224.4.167 | - | 2 | 0 |
| 33 | Link Shigeru–Mokoto | /30 | 192.224.4.168 | 192.224.4.169 - 192.224.4.170 | 192.224.4.171 | - | 2 | 0 |

**Ringkasan:**
- Total alamat teralokasi: **1,196**
- Total IP terpakai: **1,003**
- Total sisa di dalam block: **127**
- Alamat terakhir yang dipakai: **192.224.4.171**, masih di dalam 192.224.0.0/16.

## Alamat Tiap Link Antar-Router

- Gendou–Yui: 192.224.4.108/30 → Gendou 192.224.4.109 | Yui 192.224.4.110
- Gendou–Hikari: 192.224.4.112/30 → Gendou 192.224.4.113 | Hikari 192.224.4.114
- Gendou–Fuyutsuki: 192.224.4.116/30 → Gendou 192.224.4.117 | Fuyutsuki 192.224.4.118
- Gendou–Asuka: 192.224.4.120/30 → Gendou 192.224.4.121 | Asuka 192.224.4.122
- Gendou–Kaji: 192.224.4.124/30 → Gendou 192.224.4.125 | Kaji 192.224.4.126
- Gendou–Misato: 192.224.4.128/30 → Gendou 192.224.4.129 | Misato 192.224.4.130
- Gendou–Shigeru: 192.224.4.132/30 → Gendou 192.224.4.133 | Shigeru 192.224.4.134
- Yui–Rei: 192.224.4.136/30 → Yui 192.224.4.137 | Rei 192.224.4.138
- Yui–Shinji: 192.224.4.140/30 → Yui 192.224.4.141 | Shinji 192.224.4.142
- Yui–Mari: 192.224.4.144/30 → Yui 192.224.4.145 | Mari 192.224.4.146
- Hikari–Kaworu: 192.224.4.148/30 → Hikari 192.224.4.149 | Kaworu 192.224.4.150
- Fuyutsuki–Maya: 192.224.4.152/30 → Fuyutsuki 192.224.4.153 | Maya 192.224.4.154
- Fuyutsuki–Toji: 192.224.4.156/30 → Fuyutsuki 192.224.4.157 | Toji 192.224.4.158
- Asuka–Kensuke: 192.224.4.160/30 → Asuka 192.224.4.161 | Kensuke 192.224.4.162
- Asuka–Ritsuko: 192.224.4.164/30 → Asuka 192.224.4.165 | Ritsuko 192.224.4.166
- Shigeru–Mokoto: 192.224.4.168/30 → Shigeru 192.224.4.169 | Mokoto 192.224.4.170

## Jalur Dummy-Plug → Armisael

Dummy-Plug → Switch-Lab → Ritsuko → Asuka → Gendou → Shigeru → Switch-Monolith → Armisael

Subnet yang dilingkari di pohon IP:

1. Switch-Lab: 192.224.4.48/29
2. Link Asuka–Ritsuko: 192.224.4.164/30
3. Link Gendou–Asuka: 192.224.4.120/30
4. Link Gendou–Shigeru: 192.224.4.132/30
5. Switch-Monolith: 192.224.4.80/29

## Pohon IP

![Pohon IP VLSM](asset/pohon_ip_vlsm.png)

2. Geofront gelap gulita: kabel sudah ditarik, tapi saat Misato menekan 
tombol daya, Geofront tetap gelap. Tidak ada alamat dan tidak ada 
rute. Pasang semua node di GNS3 sesuai topologi. Beri IP ke tiap 
interface router sesuai soal 1, lalu aktifkan IP forwarding di semua 
router. Hanya Gendo yang terhubung ke NAT1 dan mendapat alamat 
lewat DHCP. Router lain baru bisa memasang paket setelah soal 4, 
karena internet baru ada saat itu. Tunjukkan ip -br di tiap router dan 
ping dua ujung tiap link router ke router.

## Jawaban Soal 2: Menyalakan Geofront

### Ringkasan

- Semua router dan client dipasang di GNS3 sesuai topologi. Switch-Archive tidak ada di gambar topologi, jadi ditambahkan sendiri di **Asuka eth3** (sesuai tabel host: gateway Archive = Asuka).
- Setiap interface router diberi IP sesuai tabel VLSM soal 1. Di link, router sisi Gendou mendapat IP pertama.
- Hanya **Gendou eth0** yang tersambung ke **NAT1** dan memakai DHCP.
- IP forwarding diaktifkan di semua router lewat baris `up echo 1 > /proc/sys/net/ipv4/ip_forward`. Cara ini tidak butuh paket tambahan, jadi aman dipakai sebelum ada internet (soal 4).
- Routing antar-subnet belum dipasang. Di soal ini cukup ping antar ujung link yang terhubung langsung.
- Client belum diberi IP karena soal hanya meminta interface router.

### Tabel Interface Router

| Router | Interface | IP / Prefix | Keterangan |
|---|---|---|---|
| Gendou | eth0 | DHCP dari NAT1 | Ke internet |
| Gendou | eth1 | 192.224.4.109/30 | Link Gendou-Yui |
| Gendou | eth2 | 192.224.4.105/30 | LAN Switch-Cmd (gateway) |
| Gendou | eth3 | 192.224.4.113/30 | Link Gendou-Hikari |
| Gendou | eth4 | 192.224.4.117/30 | Link Gendou-Fuyutsuki |
| Gendou | eth5 | 192.224.4.121/30 | Link Gendou-Asuka |
| Gendou | eth6 | 192.224.4.125/30 | Link Gendou-Kaji |
| Gendou | eth7 | 192.224.4.129/30 | Link Gendou-Misato |
| Gendou | eth8 | 192.224.4.133/30 | Link Gendou-Shigeru |
| Yui | eth0 | 192.224.4.110/30 | Link Gendou-Yui |
| Yui | eth1 | 192.224.4.141/30 | Link Yui-Shinji |
| Yui | eth2 | 192.224.4.137/30 | Link Yui-Rei |
| Yui | eth3 | 192.224.4.145/30 | Link Yui-Mari |
| Yui | eth4 | 192.224.3.1/25 | LAN Switch-Hangar (gateway) |
| Rei | eth0 | 192.224.4.138/30 | Link Yui-Rei |
| Rei | eth1 | 192.224.0.1/23 | LAN Switch-Quarters (gateway) |
| Shinji | eth0 | 192.224.4.142/30 | Link Yui-Shinji |
| Shinji | eth1 | 192.224.4.1/27 | LAN Switch-Garden (gateway) |
| Mari | eth0 | 192.224.4.146/30 | Link Yui-Mari |
| Mari | eth1 | 192.224.4.33/28 | LAN Switch-Dock (gateway) |
| Hikari | eth0 | 192.224.4.114/30 | Link Gendou-Hikari |
| Hikari | eth1 | 192.224.4.149/30 | Link Hikari-Kaworu |
| Hikari | eth2 | 192.224.2.1/24 | LAN Switch-Comm (gateway) |
| Kaworu | eth0 | 192.224.4.150/30 | Link Hikari-Kaworu |
| Kaworu | eth1 | 192.224.3.225/27 | LAN Switch-Relay (gateway) |
| Fuyutsuki | eth0 | 192.224.4.118/30 | Link Gendou-Fuyutsuki |
| Fuyutsuki | eth1 | 192.224.4.57/29 | LAN Switch-Terminal (gateway) |
| Fuyutsuki | eth2 | 192.224.4.153/30 | Link Fuyutsuki-Maya |
| Fuyutsuki | eth3 | 192.224.4.157/30 | Link Fuyutsuki-Toji |
| Maya | eth0 | 192.224.4.154/30 | Link Fuyutsuki-Maya |
| Maya | eth1 | 192.224.3.193/27 | LAN Switch-Medic (gateway) |
| Toji | eth0 | 192.224.4.158/30 | Link Fuyutsuki-Toji |
| Toji | eth1 | 192.224.4.73/29 | LAN Switch-Dogma (gateway) |
| Asuka | eth0 | 192.224.4.122/30 | Link Gendou-Asuka |
| Asuka | eth1 | 192.224.4.161/30 | Link Asuka-Kensuke |
| Asuka | eth2 | 192.224.4.165/30 | Link Asuka-Ritsuko |
| Asuka | eth3 | 192.224.4.97/30 | LAN Switch-Archive (gateway) |
| Kensuke | eth0 | 192.224.4.162/30 | Link Asuka-Kensuke |
| Kensuke | eth1 | 192.224.3.129/26 | LAN Switch-Bunker (gateway) |
| Ritsuko | eth0 | 192.224.4.166/30 | Link Asuka-Ritsuko |
| Ritsuko | eth1 | 192.224.4.49/29 | LAN Switch-Lab (gateway) |
| Kaji | eth0 | 192.224.4.126/30 | Link Gendou-Kaji |
| Kaji | eth1 | 192.224.4.101/30 | LAN Switch-Intel (gateway) |
| Misato | eth0 | 192.224.4.130/30 | Link Gendou-Misato |
| Misato | eth1 | 192.224.4.65/29 | LAN Switch-Cage (gateway) |
| Shigeru | eth0 | 192.224.4.134/30 | Link Gendou-Shigeru |
| Shigeru | eth1 | 192.224.4.81/29 | LAN Switch-Monolith (gateway) |
| Shigeru | eth2 | 192.224.4.169/30 | Link Shigeru-Mokoto |
| Mokoto | eth0 | 192.224.4.170/30 | Link Shigeru-Mokoto |
| Mokoto | eth1 | 192.224.4.89/29 | LAN Switch-Radar (gateway) |

### Konfigurasi Tiap Router

Konfigurasi ditaruh di menu **Configure → Edit network configuration** (`/etc/network/interfaces`) pada tiap node router. File yang sama juga ada di folder [config/soal2](config/soal2).

<details>
<summary><b>Gendou</b></summary>

```
# Gendou - /etc/network/interfaces
auto eth0
iface eth0 inet dhcp
    # NAT1 (internet), IP dari DHCP
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # Link Gendou-Yui
    address 192.224.4.109
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    # LAN Switch-Cmd (gateway)
    address 192.224.4.105
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    # Link Gendou-Hikari
    address 192.224.4.113
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    # Link Gendou-Fuyutsuki
    address 192.224.4.117
    netmask 255.255.255.252

auto eth5
iface eth5 inet static
    # Link Gendou-Asuka
    address 192.224.4.121
    netmask 255.255.255.252

auto eth6
iface eth6 inet static
    # Link Gendou-Kaji
    address 192.224.4.125
    netmask 255.255.255.252

auto eth7
iface eth7 inet static
    # Link Gendou-Misato
    address 192.224.4.129
    netmask 255.255.255.252

auto eth8
iface eth8 inet static
    # Link Gendou-Shigeru
    address 192.224.4.133
    netmask 255.255.255.252
```

</details>

<details>
<summary><b>Yui</b></summary>

```
# Yui - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Gendou-Yui
    address 192.224.4.110
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # Link Yui-Shinji
    address 192.224.4.141
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    # Link Yui-Rei
    address 192.224.4.137
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    # Link Yui-Mari
    address 192.224.4.145
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    # LAN Switch-Hangar (gateway)
    address 192.224.3.1
    netmask 255.255.255.128
```

</details>

<details>
<summary><b>Rei</b></summary>

```
# Rei - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Yui-Rei
    address 192.224.4.138
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Quarters (gateway)
    address 192.224.0.1
    netmask 255.255.254.0
```

</details>

<details>
<summary><b>Shinji</b></summary>

```
# Shinji - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Yui-Shinji
    address 192.224.4.142
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Garden (gateway)
    address 192.224.4.1
    netmask 255.255.255.224
```

</details>

<details>
<summary><b>Mari</b></summary>

```
# Mari - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Yui-Mari
    address 192.224.4.146
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Dock (gateway)
    address 192.224.4.33
    netmask 255.255.255.240
```

</details>

<details>
<summary><b>Hikari</b></summary>

```
# Hikari - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Gendou-Hikari
    address 192.224.4.114
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # Link Hikari-Kaworu
    address 192.224.4.149
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    # LAN Switch-Comm (gateway)
    address 192.224.2.1
    netmask 255.255.255.0
```

</details>

<details>
<summary><b>Kaworu</b></summary>

```
# Kaworu - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Hikari-Kaworu
    address 192.224.4.150
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Relay (gateway)
    address 192.224.3.225
    netmask 255.255.255.224
```

</details>

<details>
<summary><b>Fuyutsuki</b></summary>

```
# Fuyutsuki - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Gendou-Fuyutsuki
    address 192.224.4.118
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Terminal (gateway)
    address 192.224.4.57
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    # Link Fuyutsuki-Maya
    address 192.224.4.153
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    # Link Fuyutsuki-Toji
    address 192.224.4.157
    netmask 255.255.255.252
```

</details>

<details>
<summary><b>Maya</b></summary>

```
# Maya - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Fuyutsuki-Maya
    address 192.224.4.154
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Medic (gateway)
    address 192.224.3.193
    netmask 255.255.255.224
```

</details>

<details>
<summary><b>Toji</b></summary>

```
# Toji - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Fuyutsuki-Toji
    address 192.224.4.158
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Dogma (gateway)
    address 192.224.4.73
    netmask 255.255.255.248
```

</details>

<details>
<summary><b>Asuka</b></summary>

```
# Asuka - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Gendou-Asuka
    address 192.224.4.122
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # Link Asuka-Kensuke
    address 192.224.4.161
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    # Link Asuka-Ritsuko
    address 192.224.4.165
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    # LAN Switch-Archive (gateway)
    address 192.224.4.97
    netmask 255.255.255.252
```

</details>

<details>
<summary><b>Kensuke</b></summary>

```
# Kensuke - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Asuka-Kensuke
    address 192.224.4.162
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Bunker (gateway)
    address 192.224.3.129
    netmask 255.255.255.192
```

</details>

<details>
<summary><b>Ritsuko</b></summary>

```
# Ritsuko - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Asuka-Ritsuko
    address 192.224.4.166
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Lab (gateway)
    address 192.224.4.49
    netmask 255.255.255.248
```

</details>

<details>
<summary><b>Kaji</b></summary>

```
# Kaji - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Gendou-Kaji
    address 192.224.4.126
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Intel (gateway)
    address 192.224.4.101
    netmask 255.255.255.252
```

</details>

<details>
<summary><b>Misato</b></summary>

```
# Misato - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Gendou-Misato
    address 192.224.4.130
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Cage (gateway)
    address 192.224.4.65
    netmask 255.255.255.248
```

</details>

<details>
<summary><b>Shigeru</b></summary>

```
# Shigeru - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Gendou-Shigeru
    address 192.224.4.134
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Monolith (gateway)
    address 192.224.4.81
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    # Link Shigeru-Mokoto
    address 192.224.4.169
    netmask 255.255.255.252
```

</details>

<details>
<summary><b>Mokoto</b></summary>

```
# Mokoto - /etc/network/interfaces
auto eth0
iface eth0 inet static
    # Link Shigeru-Mokoto
    address 192.224.4.170
    netmask 255.255.255.252
    up echo 1 > /proc/sys/net/ipv4/ip_forward

auto eth1
iface eth1 inet static
    # LAN Switch-Radar (gateway)
    address 192.224.4.89
    netmask 255.255.255.248
```

</details>


Semua perintah tes per router juga ada di [tes_soal2.sh](config/soal2/tes_soal2.sh).

#### Daftar Ping Tiap Link

| Jalankan di | Perintah | Ujung yang diping |
|---|---|---|
| Gendou | `ping -c 3 192.224.4.110` | Yui (eth0) |
| Gendou | `ping -c 3 192.224.4.114` | Hikari (eth0) |
| Gendou | `ping -c 3 192.224.4.118` | Fuyutsuki (eth0) |
| Gendou | `ping -c 3 192.224.4.122` | Asuka (eth0) |
| Gendou | `ping -c 3 192.224.4.126` | Kaji (eth0) |
| Gendou | `ping -c 3 192.224.4.130` | Misato (eth0) |
| Gendou | `ping -c 3 192.224.4.134` | Shigeru (eth0) |
| Yui | `ping -c 3 192.224.4.109` | Gendou (eth1) |
| Yui | `ping -c 3 192.224.4.138` | Rei (eth0) |
| Yui | `ping -c 3 192.224.4.142` | Shinji (eth0) |
| Yui | `ping -c 3 192.224.4.146` | Mari (eth0) |
| Rei | `ping -c 3 192.224.4.137` | Yui (eth2) |
| Shinji | `ping -c 3 192.224.4.141` | Yui (eth1) |
| Mari | `ping -c 3 192.224.4.145` | Yui (eth3) |
| Hikari | `ping -c 3 192.224.4.113` | Gendou (eth3) |
| Hikari | `ping -c 3 192.224.4.150` | Kaworu (eth0) |
| Kaworu | `ping -c 3 192.224.4.149` | Hikari (eth1) |
| Fuyutsuki | `ping -c 3 192.224.4.117` | Gendou (eth4) |
| Fuyutsuki | `ping -c 3 192.224.4.154` | Maya (eth0) |
| Fuyutsuki | `ping -c 3 192.224.4.158` | Toji (eth0) |
| Maya | `ping -c 3 192.224.4.153` | Fuyutsuki (eth2) |
| Toji | `ping -c 3 192.224.4.157` | Fuyutsuki (eth3) |
| Asuka | `ping -c 3 192.224.4.121` | Gendou (eth5) |
| Asuka | `ping -c 3 192.224.4.162` | Kensuke (eth0) |
| Asuka | `ping -c 3 192.224.4.166` | Ritsuko (eth0) |
| Kensuke | `ping -c 3 192.224.4.161` | Asuka (eth1) |
| Ritsuko | `ping -c 3 192.224.4.165` | Asuka (eth2) |
| Kaji | `ping -c 3 192.224.4.125` | Gendou (eth6) |
| Misato | `ping -c 3 192.224.4.129` | Gendou (eth7) |
| Shigeru | `ping -c 3 192.224.4.133` | Gendou (eth8) |
| Shigeru | `ping -c 3 192.224.4.170` | Mokoto (eth0) |
| Mokoto | `ping -c 3 192.224.4.169` | Shigeru (eth2) |
