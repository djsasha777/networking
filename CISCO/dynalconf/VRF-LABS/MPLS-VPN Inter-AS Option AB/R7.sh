
!
! Last configuration change at 06:50:01 UTC Wed Jan 22 2020
upgrade fpd auto
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname R7
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
mpls label range 7000 7999
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
 ip address 7.7.7.7 255.255.255.255
!
interface FastEthernet0/0
 ip address 10.67.0.7 255.255.255.0
 ip router isis 
 duplex auto
 speed auto
 mpls ip
!
interface FastEthernet0/1
 ip address 10.78.0.7 255.255.255.0
 ip router isis 
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
router isis
 net 49.0001.0000.0000.0007.00
 is-type level-2-only
 passive-interface Loopback0
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