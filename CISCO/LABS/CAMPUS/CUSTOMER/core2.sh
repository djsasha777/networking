conf t

hostname CORE2

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

 exit

router ospf 1
 network 172.0.0.0 0.0.0.255 area 1
 network 172.0.3.0 0.0.0.255 area 1
 network 172.0.5.0 0.0.0.255 area 1
 network 173.2.0.0 0.0.0.255 area 1
 network 173.4.0.0 0.0.0.255 area 1
 default-information originate

end

wr