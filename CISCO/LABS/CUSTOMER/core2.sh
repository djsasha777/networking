conf t

hostname CORE1

ip dhcp excluded-address 10.10.0.1
ip dhcp excluded-address 10.10.10.2
ip dhcp excluded-address 10.10.10.3
ip dhcp excluded-address 10.10.10.4
ip dhcp excluded-address 10.10.10.254
ip dhcp excluded-address 10.10.20.1
ip dhcp excluded-address 10.10.20.2
ip dhcp excluded-address 10.10.20.3
ip dhcp excluded-address 10.10.20.4
ip dhcp excluded-address 10.10.20.254
ip dhcp excluded-address 10.10.30.1
ip dhcp excluded-address 10.10.30.2
ip dhcp excluded-address 10.10.30.3
ip dhcp excluded-address 10.10.30.4
ip dhcp excluded-address 10.10.30.254

ip dhcp excluded-address 10.10.40.1
ip dhcp excluded-address 10.10.40.2
ip dhcp excluded-address 10.10.40.3
ip dhcp excluded-address 10.10.40.4
ip dhcp excluded-address 10.10.40.254
ip dhcp excluded-address 10.10.50.1
ip dhcp excluded-address 10.10.50.2
ip dhcp excluded-address 10.10.50.3
ip dhcp excluded-address 10.10.50.4
ip dhcp excluded-address 10.10.50.254
ip dhcp excluded-address 10.10.60.1
ip dhcp excluded-address 10.10.60.2
ip dhcp excluded-address 10.10.60.3
ip dhcp excluded-address 10.10.60.4
ip dhcp excluded-address 10.10.60.254

ip dhcp pool pool10
 network 10.10.10.0 255.255.255.0
 default-router 10.10.10.254 
 dns-server 8.8.8.8 

ip dhcp pool pool20
 network 10.10.20.0 255.255.255.0
 default-router 10.10.20.254 
 dns-server 8.8.8.8 

ip dhcp pool pool30
 network 10.10.30.0 255.255.255.0
 default-router 10.10.30.254 
 dns-server 8.8.8.8

ip dhcp pool pool40
 network 10.10.40.0 255.255.255.0
 default-router 10.10.40.254 
 dns-server 8.8.8.8 

ip dhcp pool pool50
 network 10.10.50.0 255.255.255.0
 default-router 10.10.50.254 
 dns-server 8.8.8.8 

ip dhcp pool pool60
 network 10.10.60.0 255.255.255.0
 default-router 10.10.60.254 
 dns-server 8.8.8.8

interface Loopback0
 ip address 10.0.0.6 255.255.255.255

interface Ethernet0/0
 ip address 172.0.0.2 255.255.255.0
 no shutdown

interface Ethernet0/1
 ip address 173.1.0.2 255.255.255.0
 no shutdown

interface Ethernet0/2
 ip address 173.3.0.2 255.255.255.0
 no shutdown

interface Ethernet1/0
 no shutdown

interface Ethernet1/0.10
 encapsulation dot1Q 10
 ip address 10.10.10.2 255.255.255.0
 standby 10 ip 10.10.10.254
 standby 10 priority 100
 standby 10 preempt
 no shutdown

interface Ethernet1/0.20
 encapsulation dot1Q 20
 ip address 10.10.20.2 255.255.255.0
 standby 20 ip 10.10.20.254
 standby 20 priority 100
 standby 20 preempt
 no shutdown

interface Ethernet1/0.30
 encapsulation dot1Q 30
 ip address 10.10.30.2 255.255.255.0
 standby 30 ip 10.30.20.254
 standby 30 priority 100
 standby 30 preempt
 no shutdown

interface Ethernet1/1
 no shutdown

interface Ethernet1/1.40
 encapsulation dot1Q 40
 ip address 10.10.40.2 255.255.255.0
 standby 40 ip 10.10.40.254
 standby 40 priority 100
 standby 40 preempt
 no shutdown

interface Ethernet1/1.50
 encapsulation dot1Q 50
 ip address 10.10.50.2 255.255.255.0
 standby 50 ip 10.10.50.254
 standby 50 priority 100
 standby 50 preempt
 no shutdown

interface Ethernet1/1.60
 encapsulation dot1Q 60
 ip address 10.10.60.2 255.255.255.0
 standby 60 ip 10.10.60.254
 standby 60 priority 100
 standby 60 preempt
 no shutdown

router ospf 1
 network 10.0.0.0 0.0.0.255 area 1
 network 10.10.0.0 0.0.255.255 area 1
 network 172.0.0.0 0.0.0.255 area 1
 network 173.4.0.0 0.0.0.255 area 1
 network 173.2.0.0 0.0.0.255 area 1
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