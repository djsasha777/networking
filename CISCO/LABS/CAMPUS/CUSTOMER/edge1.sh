conf t

hostname EDGE1

interface Ethernet0/0
 ip address 80.80.80.1 255.255.255.0
 duplex auto
 no shutdown

interface Ethernet0/1
 ip address 175.2.0.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
 duplex auto
 no shutdown

interface Ethernet0/2
 ip address 174.1.0.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
 duplex auto
 no shutdown

interface Ethernet1/0
 ip address 173.1.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
 duplex auto
 no shutdown

interface Ethernet1/1
 ip address 173.2.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
 duplex auto
 no shutdown

 exit
        
router ospf 1
 network 80.80.80.0 0.0.0.255 area 1
 network 173.1.0.0 0.0.0.255 area 1
 network 173.2.0.0 0.0.0.255 area 1
 default-information originate

 exit

router bgp 56789
 bgp log-neighbor-changes
 network 10.10.10.0 mask 255.255.255.0
 network 10.10.20.0 mask 255.255.255.0
 network 10.10.30.0 mask 255.255.255.0
 neighbor 174.1.0.1 remote-as 3890
 neighbor 174.1.0.1 password MYPASS
 neighbor 175.2.0.1 remote-as 65783
 neighbor 175.2.0.1 password MYPASS
 default-information originate

 exit

ip nat pool NATUSERS 10.10.30.1 10.10.30.100 netmask 255.255.255.0
ip nat inside source list 77 pool NATUSERS overload
ip route 10.10.30.0 255.255.255.0 Null0
access-list 77 permit 201.9.9.0 0.0.0.255

end

wr