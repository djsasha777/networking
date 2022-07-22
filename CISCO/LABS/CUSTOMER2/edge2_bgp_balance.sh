conf t

hostname EDGE2

no ip domain lookup
ip domain name local.domain
ip name-server 8.8.8.8

ip cef
ip cef load-sharing algorithm include-ports source destination

interface Loopback0
 ip address 10.0.0.4 255.255.255.255

interface Ethernet0/0
 ip address 80.80.80.2 255.255.255.0

interface Ethernet0/1
 bandwidth 9000
 ip address 175.1.0.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in

interface Ethernet0/2
 bandwidth 3000
 ip address 174.2.0.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in

interface Ethernet1/0
 ip address 173.3.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in

interface Ethernet1/1
 ip address 173.4.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in

router ospf 1
 network 80.80.80.0 0.0.0.255 area 1
 network 173.3.0.0 0.0.0.255 area 1
 network 173.4.0.0 0.0.0.255 area 1
 default-information originate
 
exit

router bgp 56789
 bgp router-id 10.0.0.4 
 bgp log-neighbor-changes
 bgp bestpath as-path multipath-relax
 bgp dmzlink-bw
 network 10.10.10.0 mask 255.255.255.0
 network 10.10.20.0 mask 255.255.255.0
 network 10.10.30.0 mask 255.255.255.0
 neighbor 10.0.0.3 remote-as 56789
 neighbor 10.0.0.3 update-source Loopback0
 neighbor 10.0.0.5 remote-as 56789
 neighbor 10.0.0.5 update-source Loopback0
 neighbor 10.0.0.5 next-hop-self
 neighbor 10.0.0.6 remote-as 56789
 neighbor 10.0.0.6 update-source Loopback0
 neighbor 10.0.0.6 next-hop-self
 neighbor 174.2.0.1 remote-as 3890
 neighbor 174.2.0.1 password 7 062B36116D7D3A
 neighbor 174.2.0.1 prefix-list PREF-DEF in
 neighbor 174.2.0.1 filter-list 100 out
 neighbor 174.2.0.1 dmzlink-bw
 neighbor 175.1.0.1 remote-as 65783
 neighbor 175.1.0.1 password 7 12343C2733383F
 neighbor 175.1.0.1 prefix-list PREF-DEF in
 neighbor 175.1.0.1 filter-list 100 out
 neighbor 175.1.0.1 dmzlink-bw
 maximum-paths 2
 default-information originate

exit

ip as-path access-list 100 permit ^$

ip nat pool NATUSERS 10.10.30.101 10.10.30.200 netmask 255.255.255.0
ip nat inside source list 77 pool NATUSERS overload
ip route 10.10.30.0 255.255.255.0 Null0

ip prefix-list PREF-DEF seq 10 permit 0.0.0.0/0

access-list 10 permit 10.10.10.0 0.0.0.255
access-list 10 permit 10.10.20.0 0.0.0.255
access-list 10 permit 10.10.30.0 0.0.0.255

access-list 77 permit 201.9.9.0 0.0.0.255

no cdp log mismatch duplex

end

wr


