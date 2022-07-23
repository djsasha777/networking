conf t

vlan 20,777,999

vlan 20
name GREY_INTERNET_USERS

vlan 999
name NATIVE_VLAN

vlan 777
name MANAGEMENT

hostname GREY_USERS_SWITCH

spanning-tree mode pvst
spanning-tree extend system-id

interface Loopback0
 ip address 11.0.0.2 255.255.255.255

interface Vlan777
 ip address 12.0.0.2 255.255.0.0
 no shutdown

interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 20,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 20,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet0/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 20,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet0/3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 20,777
 switchport trunk native vlan 999
 description TRUNKING
 no shutdown

interface Ethernet1/0
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet1/1
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet1/2
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet1/3
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet2/0
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet2/1
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet2/2
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet2/3
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown
        
interface Ethernet3/0
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet3/1
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet3/2
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

interface Ethernet3/3
 switchport access vlan 20
 switchport mode access
 description GREY_INTERNET_USERS
 no shutdown

end

wr