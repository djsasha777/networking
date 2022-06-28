conf t

vlan 10,20,254

exit

hostname SWITCH1

spanning-tree mode pvst
spanning-tree extend system-id

interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet0/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet0/3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 no shutdown

interface Ethernet1/0
 switchport access vlan 10
 switchport mode access
 no shutdown

interface Ethernet1/1
 switchport access vlan 10
 switchport mode access
 no shutdown

interface Ethernet1/2
 switchport access vlan 10
 switchport mode access
 no shutdown

interface Ethernet1/3
 switchport access vlan 10
 switchport mode access
 no shutdown

interface Ethernet2/0
 switchport access vlan 20
 switchport mode access
 no shutdown

interface Ethernet2/1
 switchport access vlan 20
 switchport mode access
 no shutdown

interface Ethernet2/2
 switchport access vlan 20
 switchport mode access
 no shutdown

interface Ethernet2/3
 switchport access vlan 20
 switchport mode access
 no shutdown
        
interface Ethernet3/0
 switchport access vlan 254
 switchport mode access
 no shutdown

interface Ethernet3/1
 switchport access vlan 254
 switchport mode access
 no shutdown

interface Ethernet3/2
 switchport access vlan 254
 switchport mode access
 no shutdown

interface Ethernet3/3
 switchport access vlan 254
 switchport mode access
 no shutdown

interface Vlan10
 ip address 10.10.10.201 255.255.255.0
 no shutdown

interface Vlan20
 ip address 10.10.20.201 255.255.255.0
 no shutdown

interface Vlan254
 ip address 201.9.9.201 255.255.255.0
 no shutdown

 exit

ip default-gateway 10.10.10.1

end

wr