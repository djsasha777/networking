
!
! Last configuration change at 06:49:34 UTC Wed Jan 22 2020
upgrade fpd auto
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname R2
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
!
!
!
!
!
!
ip cef
no ipv6 cef
!
multilink bundle-name authenticated
mpls label range 2000 2999
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
redundancy
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
interface Loopback0
 ip address 2.2.2.2 255.255.255.255
!
interface FastEthernet0/0
 ip address 10.12.0.2 255.255.255.0
 duplex auto
 speed auto
 mpls ip
!
interface FastEthernet0/1
 ip address 10.23.0.2 255.255.255.0
 duplex auto
 speed auto
 mpls ip
!
interface FastEthernet1/0
 no ip address
 shutdown
 duplex auto
 speed auto
!
interface FastEthernet1/1
 no ip address
 shutdown
 duplex auto
 speed auto
!
router ospf 1
 passive-interface Loopback0
 network 2.2.2.2 0.0.0.0 area 0
 network 10.12.0.0 0.0.0.255 area 0
 network 10.23.0.0 0.0.0.255 area 0
!
ip forward-protocol nd
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
mgcp profile default
!
!
!
gatekeeper
 shutdown
!
!
line con 0
 exec-timeout 0 0
 logging synchronous
 stopbits 1
line aux 0
 stopbits 1
line vty 0 4
 login
 transport input all
!
!
end