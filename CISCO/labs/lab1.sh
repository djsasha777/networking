#proider1

!
! Last configuration change at 10:22:24 UTC Tue Feb 1 2022
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname provider1
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
!
no aaa new-model
mmi polling-interval 60
no mmi auto-configure
no mmi pvc
mmi snmp-timeout 180
no ip icmp rate-limit unreachable
!
!
!
!


!
!
!
!
no ip domain lookup
ip cef
no ipv6 cef
!
multilink bundle-name authenticated
!
!
!
!
!
!
!
!         
!
redundancy
!
!
ip tcp synwait-time 5
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
 ip address 192.168.1.30 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet0/1
 ip address 10.10.10.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet0/2
 no ip address
!
interface Ethernet0/3
 ip address 10.10.30.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/0
 no ip address
!
interface Ethernet1/1
 no ip address
!
interface Ethernet1/2
 no ip address
!
interface Ethernet1/3
 no ip address
!
interface Ethernet2/0
 no ip address
!
interface Ethernet2/1
 no ip address
!
interface Ethernet2/2
 no ip address
!
interface Ethernet2/3
 no ip address
!
interface Ethernet3/0
 no ip address
!
interface Ethernet3/1
 no ip address
!
interface Ethernet3/2
 no ip address
!
interface Ethernet3/3
 no ip address
!
router bgp 1
 bgp log-neighbor-changes
 network 0.0.0.0
 network 10.10.10.0 mask 255.255.255.0
 neighbor 10.10.10.2 remote-as 3
 neighbor 10.10.30.2 remote-as 3
!
ip forward-protocol nd
!
!
no ip http server
no ip http secure-server
ip nat inside source list 100 interface Ethernet0/0 overload
ip route 0.0.0.0 0.0.0.0 192.168.1.1
!
!
ip prefix-list static_default seq 5 permit 0.0.0.0/0
access-list 100 permit ip any any
!
route-map static_default permit 10
 match ip address prefix-list static_default
!
!
!
control-plane
!
!
!
!
!
!
!
line con 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 login
 transport input all
!         
!
end

#provider2

!
! Last configuration change at 04:33:10 UTC Sat Feb 12 2022
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname provider2
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
!
no aaa new-model
mmi polling-interval 60
no mmi auto-configure
no mmi pvc
mmi snmp-timeout 180
no ip icmp rate-limit unreachable
!
!
!
!


!
!
!
!
no ip domain lookup
ip cef
no ipv6 cef
!
multilink bundle-name authenticated
!
!
!
!
!
!
!
!         
!
redundancy
!
!
ip tcp synwait-time 5
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
 ip address 192.168.1.31 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet0/1
 ip address 10.10.20.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet0/2
 no ip address
!
interface Ethernet0/3
 ip address 10.10.40.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/0
 no ip address
!
interface Ethernet1/1
 no ip address
!
interface Ethernet1/2
 no ip address
!
interface Ethernet1/3
 no ip address
!
interface Ethernet2/0
 no ip address
!
interface Ethernet2/1
 no ip address
!
interface Ethernet2/2
 no ip address
!
interface Ethernet2/3
 no ip address
!
interface Ethernet3/0
 no ip address
!
interface Ethernet3/1
 no ip address
!
interface Ethernet3/2
 no ip address
!
interface Ethernet3/3
 no ip address
!
router bgp 2
 bgp log-neighbor-changes
 network 0.0.0.0
 network 10.10.40.0 mask 255.255.255.0
 neighbor 10.10.20.2 remote-as 3
 neighbor 10.10.40.2 remote-as 3
!
ip forward-protocol nd
!
!
no ip http server
no ip http secure-server
ip nat inside source list 100 interface Ethernet0/0 overload
ip route 0.0.0.0 0.0.0.0 192.168.1.1
!
!
ip prefix-list static_default seq 5 permit 0.0.0.0/0
access-list 100 permit ip any any
!
route-map static_default permit 10
 match ip address prefix-list static_default
!
!
!
control-plane
!
!
!
!
!
!
!
line con 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 login
 transport input all
!         
!
end

#edge1

!
! Last configuration change at 10:41:42 UTC Mon Feb 14 2022
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname edge1
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
!
no aaa new-model
mmi polling-interval 60
no mmi auto-configure
no mmi pvc
mmi snmp-timeout 180
no ip icmp rate-limit unreachable
!
!
!
!


!
!
!
!
no ip domain lookup
ip cef
ip cef load-sharing algorithm include-ports source destination
no ipv6 cef
!
multilink bundle-name authenticated
!
!
!
!
!
!
!         
!
!
redundancy
!
!
ip tcp synwait-time 5
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
 no ip address
 ip nat outside
 ip virtual-reassembly in
!         
interface Ethernet0/1
 bandwidth 9000
 ip address 10.10.10.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet0/2
 no ip address
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet0/3
 bandwidth 3000
 ip address 10.10.40.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet1/0
 ip address 107.0.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/1
 ip address 200.0.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/2
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/3
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/0
 ip address 137.0.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/1
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/2
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/3
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet3/0
 no ip address
!
interface Ethernet3/1
 no ip address
!
interface Ethernet3/2
 no ip address
!
interface Ethernet3/3
 no ip address
!         
router ospf 1
 network 107.0.0.0 0.0.0.255 area 1
 network 137.0.0.0 0.0.0.255 area 1
 network 200.0.0.0 0.0.0.255 area 1
 default-information originate
!
router bgp 3
 bgp log-neighbor-changes
 bgp bestpath as-path multipath-relax
 bgp dmzlink-bw
 network 10.10.10.0 mask 255.255.255.0
 network 10.10.40.0 mask 255.255.255.0
 network 201.9.9.0
 neighbor 10.10.10.1 remote-as 1
 neighbor 10.10.10.1 prefix-list INCOME in
 neighbor 10.10.10.1 filter-list 10 out
 neighbor 10.10.10.1 dmzlink-bw
 neighbor 10.10.40.1 remote-as 2
 neighbor 10.10.40.1 prefix-list INCOME in
 neighbor 10.10.40.1 filter-list 10 out
 neighbor 10.10.40.1 dmzlink-bw
 maximum-paths 2
!         
ip forward-protocol nd
!
ip as-path access-list 10 permit ^$
!
no ip http server
no ip http secure-server
ip nat pool MYNAT1 201.9.9.0 201.9.9.32 netmask 255.255.255.0
ip nat pool MYNAT2 201.9.9.33 201.9.9.65 netmask 255.255.255.0
ip nat inside source list 1 pool MYNAT1 overload
ip nat inside source static 172.1.1.200 201.9.9.240
ip nat inside source static 173.1.1.1 201.9.9.241
ip nat inside source static 173.1.2.1 201.9.9.242
ip nat inside source static 138.0.0.2 201.9.9.245
ip route 201.9.9.0 255.255.255.0 Null0
!
!
ip prefix-list INCOME seq 10 permit 0.0.0.0/0
access-list 1 permit 172.0.0.0 0.255.255.255
access-list 1 permit 137.0.0.0 0.0.0.255
!
route-map setlocalin permit 10
 set local-preference 150
!         
!
!
control-plane
!
!
!
!
!
!
!
line con 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 login
 transport input all
!
!         
end

#edge2

!
! Last configuration change at 11:19:34 UTC Mon Feb 14 2022
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname edge2
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
!
no aaa new-model
mmi polling-interval 60
no mmi auto-configure
no mmi pvc
mmi snmp-timeout 180
no ip icmp rate-limit unreachable
!
!
!
!


!
!
!
!
no ip domain lookup
ip cef
ip cef load-sharing algorithm include-ports source destination
no ipv6 cef
!
multilink bundle-name authenticated
!
!
!
!
!
!
!         
!
!
redundancy
!
!
ip tcp synwait-time 5
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
 no ip address
 ip nat outside
 ip virtual-reassembly in
!         
interface Ethernet0/1
 bandwidth 2000
 ip address 10.10.20.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet0/2
 no ip address
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet0/3
 bandwidth 9000
 ip address 10.10.30.2 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet1/0
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/1
 ip address 110.0.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/2
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/3
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/0
 ip address 108.0.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/1
 ip address 100.0.0.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/2
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/3
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet3/0
 no ip address
!
interface Ethernet3/1
 no ip address
!
interface Ethernet3/2
 no ip address
!
interface Ethernet3/3
 no ip address
!         
router ospf 1
 network 100.0.0.0 0.0.0.255 area 1
 network 108.0.0.0 0.0.0.255 area 1
 network 110.0.0.0 0.0.0.255 area 1
 default-information originate
!
router bgp 3
 bgp log-neighbor-changes
 bgp bestpath as-path multipath-relax
 bgp dmzlink-bw
 network 10.10.20.0 mask 255.255.255.0
 network 10.10.30.0 mask 255.255.255.0
 network 201.9.9.0
 neighbor 10.10.20.1 remote-as 2
 neighbor 10.10.20.1 prefix-list INCOME in
 neighbor 10.10.20.1 filter-list 10 out
 neighbor 10.10.20.1 dmzlink-bw
 neighbor 10.10.30.1 remote-as 1
 neighbor 10.10.30.1 prefix-list INCOME in
 neighbor 10.10.30.1 filter-list 10 out
 neighbor 10.10.30.1 dmzlink-bw
 maximum-paths 2
!         
ip forward-protocol nd
!
ip as-path access-list 10 permit ^$
!
no ip http server
no ip http secure-server
ip nat pool MYNAT3 201.9.9.66 201.9.9.98 netmask 255.255.255.0
ip nat pool MYNAT4 201.9.9.99 201.9.9.131 netmask 255.255.255.0
ip nat inside source list 1 pool MYNAT3 overload
ip nat inside source static 172.1.1.200 201.9.9.240
ip nat inside source static 173.1.1.1 201.9.9.241
ip nat inside source static 173.1.2.1 201.9.9.242
ip nat inside source static 138.0.0.2 201.9.9.245
ip route 201.9.9.0 255.255.255.0 Null0
!
!
ip prefix-list INCOME seq 10 permit 0.0.0.0/0
access-list 1 permit 110.0.0.0 0.0.0.255
access-list 1 permit 100.0.0.0 0.0.0.255
access-list 1 permit 172.0.0.0 0.255.255.255
!
!
!         
control-plane
!
!
!
!
!
!
!
line con 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 login
 transport input all
!
!
end

#server

root@ubuntu:~# cat /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static 
address 173.1.1.1 
netmask 255.255.255.0 
gateway 173.1.1.254
dns-nameservers 12.34.56.78 12.34.56.79

auto eth1
iface eth1 inet static
address 173.1.2.1  
netmask 255.255.255.0

#core1

!
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
service password-encryption
!
hostname core1
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
enable secret 5 $1$uvjk$HMsmI/F7EzzA2jgJDU/cF/
!
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
aaa session-id common
mmi polling-interval 60
no mmi auto-configure
no mmi pvc
mmi snmp-timeout 180
no ip icmp rate-limit unreachable
!
!
!
!


!
ip dhcp excluded-address 172.1.1.1
ip dhcp excluded-address 172.2.1.1
ip dhcp excluded-address 172.3.1.1
!
ip dhcp pool pool1
 network 172.1.1.0 255.255.255.0
 default-router 172.1.1.1 
 dns-server 8.8.8.8 
!
ip dhcp pool pool2
 network 172.2.1.0 255.255.255.0
 dns-server 8.8.8.8 
 default-router 172.2.1.1 
!
ip dhcp pool pool3
 network 172.3.1.0 255.255.255.0
 default-router 172.3.1.1 
 dns-server 8.8.8.8 
!
!
!
no ip domain lookup
ip domain name local.domain
ip name-server 8.8.8.8
ip cef
no ipv6 cef
!
multilink bundle-name authenticated
!         
!
!
!
!
!
!
!
username admin privilege 15 secret 5 $1$H84W$J5GsxepW40L2mFe.BnY38/
!
redundancy
!
!
ip tcp synwait-time 5
ip ssh version 2
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
 no ip address
!
interface Ethernet0/1
 no ip address
!
interface Ethernet0/2
 ip address 110.0.0.2 255.255.255.0
!
interface Ethernet0/3
 no ip address
!
interface Ethernet0/3.1
 encapsulation dot1Q 10
 ip address 172.1.1.1 255.255.255.0
!
interface Ethernet0/3.2
 encapsulation dot1Q 20
 ip address 172.2.1.1 255.255.255.0
!         
interface Ethernet0/3.3
 encapsulation dot1Q 30
 ip address 172.3.1.1 255.255.255.0
!
interface Ethernet0/3.999
 encapsulation dot1Q 999 native
!
interface Ethernet1/0
 no ip address
!
interface Ethernet1/1
 ip address 173.1.1.254 255.255.255.0
!
interface Ethernet1/2
 no ip address
!
interface Ethernet1/3
 no ip address
!
interface Ethernet2/0
 ip address 137.0.0.2 255.255.255.0
!
interface Ethernet2/1
 ip address 100.0.0.2 255.255.255.0
!
interface Ethernet2/2
 no ip address
!
interface Ethernet2/3
 no ip address
!
interface Ethernet3/0
 no ip address
!
interface Ethernet3/1
 no ip address
!
interface Ethernet3/2
 no ip address
!
interface Ethernet3/3
 no ip address
!
router ospf 1
 network 100.0.0.0 0.0.0.255 area 1
 network 110.0.0.0 0.0.0.255 area 1
 network 137.0.0.0 0.0.0.255 area 1
 network 172.1.1.0 0.0.0.255 area 1
 network 172.2.1.0 0.0.0.255 area 1
 network 172.3.1.0 0.0.0.255 area 1
 network 173.1.1.0 0.0.0.255 area 1
!
ip forward-protocol nd
!
!
no ip http server
no ip http secure-server
!
!
!
!
!
!
control-plane
!
!
!
!
!         
!
!
line con 0
 exec-timeout 0 0
 privilege level 15
 password 7 045802150C2E
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 password 7 0822455D0A16
 transport input ssh
!
!
end

#core2

!
! Last configuration change at 06:09:20 UTC Mon Feb 14 2022
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname core2
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
!
no aaa new-model
mmi polling-interval 60
no mmi auto-configure
no mmi pvc
mmi snmp-timeout 180
no ip icmp rate-limit unreachable
!
!
!
!


!
ip dhcp excluded-address 192.1.1.1
ip dhcp excluded-address 192.2.1.1
!
ip dhcp pool pool50
 network 192.1.0.0 255.255.0.0
 default-router 192.1.1.1 
 dns-server 8.8.8.8 
!
ip dhcp pool pool60
 network 192.2.0.0 255.255.0.0
 default-router 192.2.1.1 
 dns-server 8.8.8.8 
!
!
!
no ip domain lookup
ip cef
no ipv6 cef
!
multilink bundle-name authenticated
!
!
!
!
!
!
!
!
!
redundancy
!
!
ip tcp synwait-time 5
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
 no ip address
!
interface Ethernet0/1
 no ip address
!
interface Ethernet0/2
 no ip address
!
interface Ethernet0/3
 no ip address
!
interface Ethernet1/0
 ip address 200.0.0.2 255.255.255.0
!
interface Ethernet1/1
 ip address 110.0.0.2 255.255.255.0
!
interface Ethernet1/2
 ip address 173.1.2.254 255.255.255.0
!
interface Ethernet1/3
 no ip address
!
interface Ethernet1/3.50
 encapsulation dot1Q 50
 ip address 192.1.1.1 255.255.0.0
!
interface Ethernet1/3.60
 encapsulation dot1Q 60
 ip address 192.2.1.1 255.255.0.0
!
interface Ethernet2/0
 no ip address
!
interface Ethernet2/1
 no ip address
!
interface Ethernet2/2
 no ip address
!
interface Ethernet2/3
 no ip address
!
interface Ethernet3/0
 no ip address
!
interface Ethernet3/1
 no ip address
!
interface Ethernet3/2
 no ip address
!
interface Ethernet3/3
 no ip address
!
router ospf 1
 network 110.0.0.0 0.0.0.255 area 1
 network 173.1.2.0 0.0.0.255 area 1
 network 192.1.0.0 0.0.255.255 area 1
 network 192.2.0.0 0.0.255.255 area 1
 network 200.0.0.0 0.0.0.255 area 1
!         
ip forward-protocol nd
!
!
no ip http server
no ip http secure-server
!
!
!
!
control-plane
!
!
!
!
!
!
!
line con 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 login
 transport input all
!
!
end


#distribution1
# add vlan 10,20,30,40,999

!
! Last configuration change at 16:00:00 UTC Tue Jan 11 2022
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
service password-encryption
service compress-config
!
hostname distrib1
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
enable secret 4 /n9hy1MFVzWUJLS35zrF7v6FT835qvE0EN3BU7twjuM
!
username admin privilege 15 secret 4 tnhtc92DXBhelxjYk8LWJrPV36S2i4ntXrpb4RFmfqY
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
aaa session-id common
no ip icmp rate-limit unreachable
!
ip cef
!
!
no ip domain-lookup
ip domain-name local.domain
ip name-server 8.8.8.8
no ipv6 cef
ipv6 multicast rpf use-bgp
!
!
!
!         
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
!
!
!
vlan internal allocation policy ascending
!
ip tcp synwait-time 5
ip ssh version 2
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
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 10,20,30
 switchport mode trunk
 duplex auto
!
interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 10,20,30
 switchport mode trunk
 duplex auto
!
interface Ethernet0/2
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 10,20,30
 switchport mode trunk
 duplex auto
!
interface Ethernet0/3
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 10,20,30
 switchport mode trunk
 duplex auto
!
interface Vlan1
 no ip address
 shutdown
!
!
no ip http server
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
 password 7 094F471A1A0A
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 password 7 13061E010803
 transport input ssh
!
end

#distribution2
# add vlan 10,20,30,40,999

!
! Last configuration change at 09:58:13 UTC Sun Feb 13 2022
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname distrib2
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
!
no aaa new-model
no ip icmp rate-limit unreachable
!
ip cef    
!         
!
no ip domain-lookup
no ipv6 cef
ipv6 multicast rpf use-bgp
!
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
!
!
!
vlan internal allocation policy ascending
!
ip tcp synwait-time 5
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
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 50,60
 switchport mode trunk
 duplex auto
!
interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 50,60
 switchport mode trunk
 duplex auto
!
interface Ethernet0/2
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 50,60
 switchport mode trunk
 duplex auto
!
interface Ethernet0/3
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 50,60
 switchport mode trunk
 duplex auto
!
interface Vlan1
 no ip address
 shutdown
!
!
no ip http server
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
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 login
!
end



#acesss

!
! Last configuration change at 15:25:34 UTC Tue Jan 11 2022
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
service password-encryption
service compress-config
!
hostname access1.1
!
boot-start-marker
boot-end-marker
!
!
logging discriminator EXCESS severity drops 6 msg-body drops EXCESSCOLL 
logging buffered 50000
logging console discriminator EXCESS
enable secret 4 /n9hy1MFVzWUJLS35zrF7v6FT835qvE0EN3BU7twjuM
!
username admin privilege 15 secret 4 tnhtc92DXBhelxjYk8LWJrPV36S2i4ntXrpb4RFmfqY
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
aaa session-id common
no ip icmp rate-limit unreachable
!
ip cef
!
!
no ip domain-lookup
ip domain-name local.domain
ip name-server 8.8.8.8
no ipv6 cef
ipv6 multicast rpf use-bgp
!
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!         
!
!
!
vlan internal allocation policy ascending
!
ip tcp synwait-time 5
ip ssh version 2
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
 switchport access vlan 10
 switchport mode access
 duplex auto
!
interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport trunk allowed vlan 10
 switchport mode trunk
 duplex auto
!
interface Ethernet0/2
 switchport access vlan 10
 switchport mode access
 duplex auto
!
interface Ethernet0/3
 switchport access vlan 10
 switchport mode access
 duplex auto
!
interface Vlan1
 no ip address
 shutdown
!
!
no ip http server
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
 password 7 045802150C2E
 logging synchronous
line aux 0
 exec-timeout 0 0
 privilege level 15
 logging synchronous
line vty 0 4
 password 7 030752180500
 transport input ssh
!
end