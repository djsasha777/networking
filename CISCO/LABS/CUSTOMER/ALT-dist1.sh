conf t

vlan 10,20,254

exit

hostname DISTRIBUTION1

ip dhcp excluded-address 10.10.10.254
ip dhcp excluded-address 10.10.10.253
ip dhcp excluded-address 10.10.10.252
ip dhcp excluded-address 10.10.10.251
ip dhcp excluded-address 201.9.9.1
ip dhcp excluded-address 201.9.9.251
ip dhcp excluded-address 201.9.9.252
ip dhcp excluded-address 201.9.9.253
ip dhcp excluded-address 201.9.9.201
ip dhcp excluded-address 201.9.9.202
ip dhcp excluded-address 201.9.9.203
ip dhcp excluded-address 201.9.9.204
ip dhcp excluded-address 201.9.9.205
ip dhcp excluded-address 201.9.9.206

ip dhcp pool pool10
 network 10.10.10.0 255.255.255.0
 default-router 10.10.10.254 
 dns-server 8.8.8.8 

 exit

ip dhcp pool 254
 network 201.9.9.0 255.255.255.0
 default-router 201.9.9.1 
 dns-server 8.8.8.8 

 exit

spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 10,20,254 priority 24576
         
interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet0/1
 no switchport
 ip address 172.0.4.2 255.255.255.0
 
 no shutdown

interface Ethernet0/2
 no switchport
 ip address 172.0.5.2 255.255.255.0
 
 no shutdown

interface Ethernet1/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet1/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet1/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet1/3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Vlan10
 ip address 10.10.10.251 255.255.255.0
 standby 10 ip 10.10.10.254
 standby 10 priority 150
 standby 10 preempt
 no shutdown

interface Vlan20
 ip address 10.10.20.251 255.255.255.0
 standby 20 ip 10.10.20.254
 standby 20 priority 150
 standby 20 preempt
 no shutdown

interface Vlan254
 ip address 201.9.9.251 255.255.255.0
 standby 254 preempt
 standby 254 ip 201.9.9.1
 standby 254 priority 150
 no shutdown

end

wr

conf t

router ospf 1
 network 10.10.10.0 0.0.0.255 area 1
 network 10.10.20.0 0.0.0.255 area 1
 network 172.0.4.0 0.0.0.255 area 1
 network 172.0.5.0 0.0.0.255 area 1
 network 201.9.9.0 0.0.0.255 area 1

 end

wr