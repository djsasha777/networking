conf t

hostname CORE1

interface Ethernet0/0
 ip address 172.0.0.1 255.255.255.0
 no shutdown

interface Ethernet0/1
 ip address 173.1.0.2 255.255.255.0
 no shutdown

interface Ethernet0/2
 ip address 173.3.0.2 255.255.255.0
 no shutdown

interface Ethernet1/0
 ip address 172.0.1.1 255.255.255.0
 no shutdown

interface Ethernet1/1
 ip address 172.0.4.1 255.255.255.0
 no shutdown

 exit

router ospf 1
 network 172.0.0.0 0.0.0.255 area 1
 network 172.0.1.0 0.0.0.255 area 1
 network 172.0.4.0 0.0.0.255 area 1
 network 173.1.0.0 0.0.0.255 area 1
 network 173.3.0.0 0.0.0.255 area 1
 default-information originate

end

wr