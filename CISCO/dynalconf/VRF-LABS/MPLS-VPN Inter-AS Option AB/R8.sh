
!
! Last configuration change at 07:39:23 UTC Wed Jan 22 2020
upgrade fpd auto
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname R8
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
mpls label range 8000 8999
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
 ip address 8.8.8.8 255.255.255.255
!
interface FastEthernet0/0
 ip address 10.78.0.8 255.255.255.0
 ip router isis 
 duplex auto
 speed auto
 mpls ip
!
interface FastEthernet0/1
 vrf forwarding V1
 ip address 172.16.89.8 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet1/0
 vrf forwarding V2
 ip address 172.16.108.8 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet1/1
 no ip address
 shutdown
 duplex auto
 speed auto
!
!
router eigrp EIGRP1
 !
 address-family ipv4 unicast vrf V2 autonomous-system 1
  !
  topology base
   redistribute bgp 64513 metric 100000 100 255 1 1500
  exit-af-topology
  network 172.16.108.0 0.0.0.255
 exit-address-family
!
router ospf 200 vrf V1
 redistribute bgp 64513 subnets
 network 172.16.89.0 0.0.0.255 area 0
!
router isis
 net 49.0001.0000.0000.0008.00
 is-type level-2-only
 passive-interface Loopback0
!
router bgp 64513
 bgp log-neighbor-changes
 no bgp default ipv4-unicast
 neighbor 6.6.6.6 remote-as 64513
 neighbor 6.6.6.6 update-source Loopback0
 !
 address-family ipv4
 exit-address-family
 !
 address-family vpnv4
  neighbor 6.6.6.6 activate
  neighbor 6.6.6.6 send-community extended
 exit-address-family
 !
 address-family ipv4 vrf V1
  redistribute ospf 200
 exit-address-family
 !
 address-family ipv4 vrf V2
  redistribute eigrp 1
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