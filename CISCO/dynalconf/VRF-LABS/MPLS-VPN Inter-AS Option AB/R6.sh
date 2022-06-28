
!
! Last configuration change at 07:19:49 UTC Wed Jan 22 2020
upgrade fpd auto
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname R6
!
boot-start-marker
boot-end-marker
!
!
vrf definition V1
 rd 100:1
 route-target export 100:1
 route-target import 100:1
 !
 address-family ipv4
 exit-address-family
!
vrf definition V2
 rd 200:1
 route-target export 200:1
 route-target import 200:1
 !
 address-family ipv4
 exit-address-family
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
mpls label range 6000 6999
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
 ip address 6.6.6.6 255.255.255.255
!
interface FastEthernet0/0
 ip address 10.100.0.6 255.255.255.0
 duplex auto
 speed auto
 mpls bgp forwarding
!
interface FastEthernet0/1
 ip address 10.67.0.6 255.255.255.0
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
 net 49.0001.0000.0000.0006.00
 is-type level-2-only
 passive-interface Loopback0
!
router bgp 64513
 bgp log-neighbor-changes
 no bgp default ipv4-unicast
 neighbor 8.8.8.8 remote-as 64513
 neighbor 8.8.8.8 update-source Loopback0
 neighbor 10.100.0.1 remote-as 64512
 !
 address-family ipv4
 exit-address-family
 !
 address-family vpnv4
  neighbor 8.8.8.8 activate
  neighbor 8.8.8.8 send-community extended
  neighbor 8.8.8.8 next-hop-self
  neighbor 10.100.0.1 activate
  neighbor 10.100.0.1 send-community extended
 exit-address-family
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