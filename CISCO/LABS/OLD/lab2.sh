# PROVIDER 1

Using 2252 out of 32768 bytes
!
! Last configuration change at 01:24:02 UTC Mon Mar 14 2022
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
 no ip address
!
interface Ethernet0/2
 no ip address
!
interface Ethernet0/3
 no ip address
!
interface Ethernet1/0
 no ip address
!
interface Ethernet1/1
 ip address 172.17.0.1 255.255.255.252
 ip nat inside
 ip virtual-reassembly in
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
 ip address 172.17.0.5 255.255.255.252
 ip nat inside
 ip virtual-reassembly in
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
 neighbor 172.17.0.2 remote-as 3
 neighbor 172.17.0.2 default-originate
 neighbor 172.17.0.6 remote-as 3
 neighbor 172.17.0.6 default-originate
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



# PROVIDER 2

Using 2252 out of 32768 bytes
!
! Last configuration change at 01:25:50 UTC Mon Mar 14 2022
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
 no ip address
!
interface Ethernet0/2
 no ip address
!
interface Ethernet0/3
 no ip address
!
interface Ethernet1/0
 no ip address
!
interface Ethernet1/1
 ip address 172.16.0.5 255.255.255.252
 ip nat inside
 ip virtual-reassembly in
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
 ip address 172.16.0.1 255.255.255.252
 ip nat inside
 ip virtual-reassembly in
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
 neighbor 172.16.0.2 remote-as 3
 neighbor 172.16.0.2 default-originate
 neighbor 172.16.0.6 remote-as 3
 neighbor 172.16.0.6 default-originate
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

# CORE-EDGE 1

Using 4440 out of 32768 bytes
!
! Last configuration change at 03:30:28 UTC Tue Mar 22 2022
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
ip dhcp excluded-address 10.10.255.1
ip dhcp excluded-address 10.20.255.1
!
ip dhcp pool pool10
 network 10.10.0.0 255.255.0.0
 default-router 10.10.255.1 
 dns-server 8.8.8.8 
!
ip dhcp pool pool20
 network 10.20.0.0 255.255.0.0
 default-router 10.20.255.1 
 dns-server 8.8.8.8 
!
!
!
no ip domain lookup
ip domain name local.domain
ip name-server 8.8.8.8
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
username admin privilege 15 secret 5 $1$H84W$J5GsxepW40L2mFe.BnY38/
!
redundancy
!
!
ip tcp synwait-time 5
ip ssh version 2
!
track 1 interface Ethernet3/0 line-protocol
!
track 3 interface Ethernet3/0 line-protocol
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
 ip address 173.1.1.1 255.255.255.252
 ip nat inside
 ip virtual-reassembly in
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
interface Ethernet0/3.10
 encapsulation dot1Q 10
!
interface Ethernet1/0
 no ip address
!         
interface Ethernet1/1
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/1.10
 description users
 encapsulation dot1Q 10
 ip address 10.10.255.4 255.255.0.0
 ip nat inside
 ip virtual-reassembly in
 standby 0 ip 10.10.255.1
 standby 0 priority 160
 standby 0 preempt
 standby 0 track 1 decrement 10
!
interface Ethernet1/1.70
 encapsulation dot1Q 70
 ip address 201.9.9.254 255.255.255.0
 standby 70 ip 201.9.9.151
 standby 70 priority 160
 standby 70 preempt
 standby 70 track 3 decrement 10
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
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/1.20
 encapsulation dot1Q 20
 ip address 10.20.255.7 255.255.0.0
 ip nat inside
 ip virtual-reassembly in
 standby 1 ip 10.20.255.1
 standby 1 priority 160
 standby 1 preempt
 standby 1 track 2 decrement 10
!
interface Ethernet2/2
 no ip address
!
interface Ethernet2/3
 no ip address
!
interface Ethernet3/0
 ip address 10.255.0.1 255.255.255.252
!
interface Ethernet3/1
 bandwidth 3000
 ip address 172.16.0.2 255.255.255.252
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet3/2
 bandwidth 9000
 ip address 172.17.0.6 255.255.255.252
 ip nat outside
 ip virtual-reassembly in
!         
interface Ethernet3/3
 no ip address
!
router bgp 3
 bgp log-neighbor-changes
 bgp bestpath as-path multipath-relax
 bgp dmzlink-bw
 network 201.9.9.0
 neighbor 10.255.0.2 remote-as 3
 neighbor 172.16.0.1 remote-as 2
 neighbor 172.16.0.1 prefix-list DEFAULT in
 neighbor 172.16.0.1 dmzlink-bw
 neighbor 172.17.0.5 remote-as 1
 neighbor 172.17.0.5 prefix-list DEFAULT in
 neighbor 172.17.0.5 dmzlink-bw
 maximum-paths 2
!
ip forward-protocol nd
!
!
no ip http server
no ip http secure-server
ip nat pool NATADMINS 201.9.9.0 201.9.9.65 netmask 255.255.255.0
ip nat pool NATUSERS 201.9.9.66 201.9.9.98 netmask 255.255.255.0
ip nat pool NATCOMMERCIALS 201.9.9.99 201.9.9.150 netmask 255.255.255.0
ip nat pool NATRESERVED 201.9.9.151 201.9.9.255 netmask 255.255.255.0
ip nat inside source list 88 pool NATUSERS overload
ip route 201.9.9.0 255.255.255.0 Null0
!
!
ip prefix-list DEFAULT seq 10 permit 0.0.0.0/0
access-list 77 permit 201.9.9.0 0.0.0.255
access-list 88 permit 173.1.1.0 0.0.0.3
access-list 88 permit 10.10.0.0 0.0.255.255
access-list 88 permit 10.20.0.0 0.0.255.255
access-list 88 permit 173.1.1.4 0.0.0.3
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


# CORE-EDGE 2

Using 3867 out of 32768 bytes
!
! Last configuration change at 03:30:23 UTC Tue Mar 22 2022
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname Edge-Core2
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
ip dhcp excluded-address 10.10.255.1
ip dhcp excluded-address 10.20.255.1
!
ip dhcp pool pool10
 network 10.10.0.0 255.255.0.0
 default-router 10.10.255.1 
 dns-server 8.8.8.8 
!
ip dhcp pool pool20
 network 10.20.0.0 255.255.0.0
 default-router 10.20.255.1 
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
track 1 interface Ethernet3/0 line-protocol
!
track 2 interface Ethernet3/0 line-protocol
!
track 3 interface Ethernet3/0 line-protocol
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
 ip address 173.1.1.5 255.255.255.252
 ip nat inside
 ip virtual-reassembly in
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
 no ip address
!
interface Ethernet1/1
 bandwidth 9000
 ip address 172.17.0.2 255.255.255.252
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet1/2
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet1/2.20
 encapsulation dot1Q 20
 ip address 10.20.255.6 255.255.0.0
 ip nat inside
 ip virtual-reassembly in
 standby 1 ip 10.20.255.1
 standby 1 track 2 decrement 10
!
interface Ethernet1/3
 no ip address
!
interface Ethernet2/0
 no ip address
 ip nat inside
 ip virtual-reassembly in
!
interface Ethernet2/0.10
 encapsulation dot1Q 10
 ip address 10.10.255.5 255.255.0.0
 standby 0 ip 10.10.255.1
 standby 0 track 1 decrement 10
!
interface Ethernet2/0.70
 encapsulation dot1Q 70
 ip address 201.9.9.253 255.255.255.0
 standby 70 ip 201.9.9.151
 standby 70 track 3 decrement 10
!
interface Ethernet2/1
 bandwidth 3000
 ip address 172.16.0.6 255.255.255.252
 ip nat outside
 ip virtual-reassembly in
!
interface Ethernet2/2
 no ip address
!
interface Ethernet2/3
 no ip address
!
interface Ethernet3/0
 ip address 10.255.0.2 255.255.255.252
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
router bgp 3
 bgp log-neighbor-changes
 bgp bestpath as-path multipath-relax
 bgp dmzlink-bw
 network 201.9.9.0
 neighbor 10.255.0.1 remote-as 3
 neighbor 172.16.0.5 remote-as 2
 neighbor 172.16.0.5 prefix-list DEFAULT in
 neighbor 172.16.0.5 dmzlink-bw
 neighbor 172.17.0.1 remote-as 1
 neighbor 172.17.0.1 prefix-list DEFAULT in
 neighbor 172.17.0.1 dmzlink-bw
 maximum-paths 2
!
ip forward-protocol nd
!
!
no ip http server
no ip http secure-server
ip nat pool NATUSERS 201.9.9.66 201.9.9.98 netmask 255.255.255.0
ip nat pool NATCOMMERCIALS 201.9.9.99 201.9.9.150 netmask 255.255.255.0
ip nat pool NATRESERVED 201.9.9.151 201.9.9.255 netmask 255.255.255.0
ip nat pool NATADMINS 201.9.9.0 201.9.9.65 netmask 255.255.255.0
ip nat inside source list 88 pool NATUSERS overload
ip route 201.9.9.0 255.255.255.0 Null0
!
!
ip prefix-list DEFAULT seq 10 permit 0.0.0.0/0
access-list 88 permit 10.10.0.0 0.0.255.255
access-list 88 permit 10.20.0.0 0.0.255.255
access-list 88 permit 173.1.1.0 0.0.0.3
access-list 88 permit 173.1.1.4 0.0.0.3
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


# DISTRIBUTION 1

Using 1158 out of 8192 bytes
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname Distribution1
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
!
ip cef
!
!
no ip igmp snooping
no ipv6 cef
ipv6 multicast rpf use-bgp
!         
!
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 10 priority 28672
!
!
!
!
vlan internal allocation policy ascending
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
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!
interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!
interface Ethernet0/2
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!
interface Ethernet0/3
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!
ip default-gateway 10.10.255.1
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
 logging synchronous
line aux 0
line vty 0 4
 login
!
end


# DISTRIBUTION 2

Using 1606 out of 8192 bytes
!
! Last configuration change at 03:53:18 UTC Tue Mar 15 2022
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname Distribution2
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
no ip igmp snooping
no ipv6 cef
ipv6 multicast rpf use-bgp
!
!
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 10 priority 28672
spanning-tree vlan 20 priority 24576
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
 switchport mode trunk
 duplex auto
!
interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!         
interface Ethernet0/2
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!
interface Ethernet0/3
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!
interface Vlan1
 no ip address
 shutdown
!
ip default-gateway 10.10.255.1
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


# ACCESS

Using 1142 out of 8192 bytes
!
! Last configuration change at 02:10:51 UTC Wed Mar 16 2022
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname Access1
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
!
ip cef
!
!
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
 switchport mode trunk
 duplex auto
!
interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport trunk native vlan 999
 switchport mode trunk
 duplex auto
!
interface Ethernet0/2
 switchport access vlan 70
 switchport mode access
 duplex auto
!
interface Ethernet0/3
 switchport access vlan 10
 switchport mode access
 duplex auto
!         
interface Vlan10
 description users
 ip address 10.10.255.10 255.255.0.0
!
ip default-gateway 10.10.255.1
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
 logging synchronous
line aux 0
line vty 0 4
 login
!
end


#linux ansible management unit

auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug eth0
iface eth0 inet static 
address 173.1.1.2 
netmask 255.255.255.252 
gateway 173.1.1.1
dns-nameservers 8.8.8.8

allow-hotplug eth0
iface eth1 inet static
address 173.1.1.6  
netmask 255.255.255.252

post-up ip route add 173.1.1.4/30 dev eth1 table rt2
post-up ip route add default via 173.1.1.5 dev eth1 table rt2
post-up ip rule add from 173.1.1.4/30 table rt2
post-up ip rule add to 173.1.1.4/30 table rt2

#######
vi /etc/iproute2/rt_tables

#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
#1      inr.ruhep
1 rt2