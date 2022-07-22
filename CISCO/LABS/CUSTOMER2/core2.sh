conf t

hostname CORE2

interface Loopback0
 ip address 10.0.0.6 255.255.255.255

interface Ethernet0/0
 ip address 172.0.0.2 255.255.255.0
 no shutdown

interface Ethernet0/1
 ip address 173.2.0.2 255.255.255.0
 no shutdown

interface Ethernet0/2
 ip address 173.4.0.2 255.255.255.0
 no shutdown

interface Ethernet1/0
 ip address 172.0.3.1 255.255.255.0
 no shutdown

interface Ethernet1/1
 ip address 172.0.5.1 255.255.255.0
 no shutdown

router ospf 1
 network 10.0.0.0 0.0.0.255 area 1
 network 172.0.0.0 0.0.0.255 area 1
 network 172.0.3.0 0.0.0.255 area 1
 network 172.0.5.0 0.0.0.255 area 1
 network 173.2.0.0 0.0.0.255 area 1
 network 173.4.0.0 0.0.0.255 area 1
 default-information originate

router bgp 56789
 bgp router-id 10.0.0.6
 bgp log-neighbor-changes
 neighbor 10.0.0.3 remote-as 56789
 neighbor 10.0.0.3 update-source Loopback0
 neighbor 10.0.0.4 remote-as 56789
 neighbor 10.0.0.4 update-source Loopback0
 neighbor 10.0.0.5 remote-as 56789
 neighbor 10.0.0.5 update-source Loopback0
 default-information originate

end

wr