conf t

hostname EDGE1

ip dhcp excluded-address 10.10.10.1
ip dhcp excluded-address 10.10.10.2
ip dhcp excluded-address 10.10.10.3
ip dhcp excluded-address 10.10.10.4
ip dhcp excluded-address 10.10.10.254

ip dhcp excluded-address 10.10.20.1
ip dhcp excluded-address 10.10.20.2
ip dhcp excluded-address 10.10.20.3
ip dhcp excluded-address 10.10.20.4
ip dhcp excluded-address 10.10.20.254

ip dhcp pool pool10
 network 10.10.10.0 255.255.255.0
 default-router 10.10.10.254 
 dns-server 8.8.8.8 

ip dhcp pool pool20
 network 10.10.20.0 255.255.255.0
 default-router 10.10.20.254 
 dns-server 8.8.8.8 

no ip domain lookup
ip domain name local.domain
ip name-server 8.8.8.8

ip cef
ip cef load-sharing algorithm include-ports source destination

interface Loopback0
 ip address 10.0.0.3 255.255.255.255

interface Ethernet0/0
 ip address 80.80.80.1 255.255.255.0

interface Ethernet0/1
 bandwidth 9000
 ip address 175.2.0.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in

interface Ethernet0/2
 bandwidth 3000
 ip address 174.1.0.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in

interface Ethernet1/0
 no shutdown

interface Ethernet1/0.10
 encapsulation dot1Q 10
 ip address 10.10.10.1 255.255.255.0
 standby 10 ip 10.10.10.254
 standby 10 priority 150
 standby 10 preempt
 no shutdown

interface Ethernet2/0
 no shutdown

interface Ethernet2/0.20
 encapsulation dot1Q 20
 ip address 10.10.20.1 255.255.255.0
 standby 20 ip 10.10.20.254
 standby 20 priority 150
 standby 20 preempt
 no shutdown

interface Ethernet3/0
 no shutdown

interface Ethernet3/0.30
 encapsulation dot1Q 30
 ip address 10.10.30.1 255.255.255.0
 standby 30 ip 10.30.20.254
 standby 30 priority 150
 standby 30 preempt
 no shutdown

router ospf 1
 network 10.0.0.0 0.0.0.255 area 1
 network 80.80.80.0 0.0.0.255 area 1
 default-information originate

router bgp 56789
 bgp router-id 10.0.0.3
 bgp log-neighbor-changes
 bgp bestpath as-path multipath-relax
 bgp dmzlink-bw
 network 10.10.10.0 mask 255.255.255.0
 network 10.10.50.0 mask 255.255.255.0
 neighbor 10.0.0.4 remote-as 56789
 neighbor 10.0.0.4 update-source Loopback0
 neighbor 174.1.0.1 remote-as 3890
 neighbor 174.1.0.1 password 7 00292A36256838
 neighbor 174.1.0.1 prefix-list PREF-DEF in
 neighbor 174.1.0.1 filter-list 100 out
 neighbor 174.1.0.1 dmzlink-bw
 neighbor 175.2.0.1 remote-as 65783
 neighbor 175.2.0.1 password 7 00292A36256838
 neighbor 175.2.0.1 prefix-list PREF-DEF in
 neighbor 175.2.0.1 filter-list 100 out
 neighbor 175.2.0.1 dmzlink-bw
 maximum-paths 2
 default-information originate

ip as-path access-list 100 permit ^$

ip nat pool NATUSERS 10.10.50.1 10.10.50.100 netmask 255.255.255.0
ip nat inside source list 20 pool NATUSERS overload
ip route 10.10.50.0 255.255.255.0 Null0

ip prefix-list PREF-DEF seq 10 permit 0.0.0.0/0

access-list 10 permit 10.10.10.0 0.0.0.255
access-list 10 permit 10.10.20.0 0.0.0.255
access-list 10 permit 10.10.30.0 0.0.0.255

access-list 20 permit 10.10.20.0 0.0.0.255

no cdp log mismatch duplex

end

wr
