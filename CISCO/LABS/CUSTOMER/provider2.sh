conf t

hostname PROVIDER2

interface Loopback0
 ip address 10.0.0.2 255.255.255.255
 
interface Ethernet0/0
 ip address 192.168.1.31 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
 no shutdown

interface Ethernet1/0
 ip address 175.1.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
 no shutdown

interface Ethernet1/1
 ip address 175.2.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
 no shutdown

router bgp 65783
 bgp log-neighbor-changes
 network 0.0.0.0
 neighbor 175.1.0.2 remote-as 56789
 neighbor 175.1.0.2 password MYPASS
 neighbor 175.2.0.2 remote-as 56789
 neighbor 175.2.0.2 password MYPASS

 exit

ip nat inside source list 100 interface Ethernet0/0 overload
ip route 0.0.0.0 0.0.0.0 192.168.1.1

access-list 100 permit ip any any

end

wr