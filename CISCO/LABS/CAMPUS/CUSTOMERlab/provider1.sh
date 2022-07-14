conf t

hostname PROVIDER1

interface Ethernet0/0
 ip address 192.168.1.30 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
 no shutdown

interface Ethernet1/0
 ip address 174.1.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
 no shutdown

interface Ethernet1/1
 ip address 174.2.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
 no shutdown

 exit

router bgp 3890
 bgp log-neighbor-changes
 network 0.0.0.0
 neighbor 174.1.0.2 remote-as 56789
 neighbor 174.1.0.2 password MYPASS
 neighbor 174.2.0.2 remote-as 56789
 neighbor 174.2.0.2 password MYPASS


 exit

ip nat inside source list 100 interface Ethernet0/0 overload
ip route 0.0.0.0 0.0.0.0 192.168.1.1

access-list 100 permit ip any any

end

wr