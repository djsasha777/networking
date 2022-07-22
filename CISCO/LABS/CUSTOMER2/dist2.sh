conf t

vlan 10,20,30,777,999

vlan 10
name COMMON_INTERNET_USERS

vlan 20
name BUISNESS_INTERNET_USERS

vlan 30
name IPTV_USERS

vlan 999
name NATIVE_VLAN

vlan 777
name MANAGEMENT
hostname DISTRIBUTION1

spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 10,20,30,777 priority 28672

interface Loopback0
 ip address 11.0.1.2 255.255.255.255

interface Vlan777
 ip address 12.0.1.2 255.255.0.0
 no shutdown

interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet0/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet1/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet1/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet1/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet1/3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet2/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet2/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet2/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet2/3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet3/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet3/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet3/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet3/3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

end

wr