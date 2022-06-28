enable

conf t

hostname R1

ip multicast-routing

interface FastEthernet0/0
 ip address 192.168.10.1 255.255.255.0
 ip pim sparse-mode
 no shutdown

interface FastEthernet0/1
 ip address 192.168.12.1 255.255.255.0
 ip pim sparse-mode
 no shutdown

router ospf 1
 network 0.0.0.0 255.255.255.255 area 0

ip pim rp-address 2.2.2.2
ip pim spt-threshold infinity

end

wr