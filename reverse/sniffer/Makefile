arp:
	arp -a

run:
	sudo bettercap -caplet ~/sniffer/src/sniffer.cap

certs:
	adb push ~/.bettercap/bettercap-ca.cert.pem /sdcard/Download/
	adb push ~/.mitmproxy/mitmproxy-ca-cert.cer /sdcard/Download/

rules-osx:
	rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8080
	rdr pass inet proto tcp from any to any port 443 -> 127.0.0.1 port 8080

rules-linux:
	sysctl -w net.ipv4.ip_forward=1
	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8080
