#Cisco switch

Using 1710 out of 10240 bytes, uncompressed size = 3159 bytes
!
! Last configuration change at 23:26:52 UTC Mon Mar 28 2022
!
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
service password-encryption
service compress-config
!
hostname SWITCH1
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
enable secret 5 $1$W1FM$3zibVgMIYfwuToAImDgfa/
!
username admin privilege 15 secret 5 $1$kX0U$ZXTuNq.T3Ckk2.2vuYBbG.
aaa new-model
!         
!
aaa authentication login vty local
aaa authorization network default if-authenticated 
!
!
!
!
!
!
aaa session-id common
!
!
!
!
!
no ip icmp rate-limit unreachable
!
!
!
no ip domain-lookup
ip domain-name local.domain
ip name-server 8.8.8.8
ip cef    
no ipv6 cef
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 234 priority 24576
!
!
! 
!
!
!
!
!
!
!
!
!
!
!
!
interface Ethernet0/0
 no switchport
 ip address 20.20.20.1 255.255.255.0
!
interface Ethernet0/1
 no switchport
 ip address 20.20.11.2 255.255.255.0
!
interface Ethernet0/2
!
interface Ethernet0/3
!
interface Ethernet1/0
!
interface Ethernet1/1
 no switchport
 ip address 20.20.21.2 255.255.255.0
!
interface Ethernet1/2
!
interface Ethernet1/3
!
interface Ethernet2/0
 switchport access vlan 234
 switchport mode access
!
interface Ethernet2/1
 switchport access vlan 234
 switchport mode access
!
interface Ethernet2/2
 switchport access vlan 234
 switchport mode access
!
interface Ethernet2/3
 switchport access vlan 234
 switchport mode access
!
interface Ethernet3/0
 switchport access vlan 234
 switchport mode access
!
interface Ethernet3/1
 switchport access vlan 234
 switchport mode access
!
interface Ethernet3/2
 switchport access vlan 234
 switchport mode access
!
interface Ethernet3/3
 switchport access vlan 234
 switchport mode access
!
interface Ethernet4/0
!
interface Ethernet4/1
!
interface Ethernet4/2
!
interface Ethernet4/3
!
interface Ethernet5/0
!
interface Ethernet5/1
!
interface Ethernet5/2
!
interface Ethernet5/3
!         
interface Ethernet6/0
!
interface Ethernet6/1
!
interface Ethernet6/2
!
interface Ethernet6/3
!
interface Ethernet7/0
!
interface Ethernet7/1
!
interface Ethernet7/2
!
interface Ethernet7/3
!
interface Vlan1
 no ip address
 shutdown
!
interface Vlan234
 description myvlan
 ip address 192.168.2.2 255.255.255.0
 standby 0 ip 192.168.2.1
 standby 0 priority 150
 standby 0 preempt
!
router bgp 234
 bgp log-neighbor-changes
 network 192.168.2.0
 neighbor 20.20.11.1 remote-as 234
 neighbor 20.20.20.2 remote-as 234
 neighbor 20.20.21.1 remote-as 234
!
ip default-gateway 192.168.1.1
ip forward-protocol nd
!
ip tcp synwait-time 5
ip http server
ip http secure-server
!
ip ssh version 2
ip ssh server algorithm encryption aes128-ctr aes192-ctr aes256-ctr
ip ssh client algorithm encryption aes128-ctr aes192-ctr aes256-ctr
!
!         
!
!
!
!
!
control-plane
!
!
line con 0
 exec-timeout 0 0
 privilege level 15
 password 7 030752180500
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 password 7 104D000A0618
 transport input ssh
!
!
!         
end