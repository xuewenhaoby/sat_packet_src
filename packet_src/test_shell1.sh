ip netns add sat1
ip netns exec sat1 ip link set dev lo up
ip netns exec sat1 sysctl net.ipv4.conf.all.forwarding=1


ip netns add sat2
ip netns exec sat2 ip link set dev lo up
ip netns exec sat2 sysctl net.ipv4.conf.all.forwarding=1


ip netns add sat3
ip netns exec sat3 ip link set dev lo up
ip netns exec sat3 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat4
ip netns exec sat4 ip link set dev lo up
ip netns exec sat4 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat5
ip netns exec sat5 ip link set dev lo up
ip netns exec sat5 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat6
ip netns exec sat6 ip link set dev lo up
ip netns exec sat6 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat7
ip netns exec sat7 ip link set dev lo up
ip netns exec sat7 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat8
ip netns exec sat8 ip link set dev lo up
ip netns exec sat8 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat9
ip netns exec sat9 ip link set dev lo up
ip netns exec sat9 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat10
ip netns exec sat10 ip link set dev lo up
ip netns exec sat10 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat11
ip netns exec sat11 ip link set dev lo up
ip netns exec sat11 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat12
ip netns exec sat12 ip link set dev lo up
ip netns exec sat12 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat13
ip netns exec sat13 ip link set dev lo up
ip netns exec sat13 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat14
ip netns exec sat14 ip link set dev lo up
ip netns exec sat14 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat15
ip netns exec sat15 ip link set dev lo up
ip netns exec sat15 sysctl net.ipv4.conf.all.forwarding=1

ip netns add sat16
ip netns exec sat16 ip link set dev lo up
ip netns exec sat16 sysctl net.ipv4.conf.all.forwarding=1

ip link add sat1p0 type veth peer name sat2p0
ip link set sat1p0 netns sat1
ip link set sat2p0 netns sat2
ip netns exec sat1 ip link set dev sat1p0 up
ip netns exec sat2 ip link set dev sat2p0 up
ip netns exec sat1 ip addr add 190.0.1.3/24 broadcast 190.0.1.255 dev sat1p0
ip netns exec sat2 ip addr add 190.0.1.2/24 broadcast 190.0.1.255 dev sat2p0

ip link add sat2p1 type veth peer name sat3p0
ip link set sat2p1 netns sat2
ip link set sat3p0 netns sat3
ip netns exec sat2 ip link set dev sat2p1 up
ip netns exec sat3 ip link set dev sat3p0 up
ip netns exec sat2 ip addr add 190.0.5.1/24 broadcast 190.0.5.255 dev sat2p1
ip netns exec sat3 ip addr add 190.0.5.2/24 broadcast 190.0.5.255 dev sat3p0


ip link add sat3p1 type veth peer name sat4p0
ip link set sat3p1 netns sat3
ip link set sat4p0 netns sat4
ip netns exec sat3 ip link set dev sat3p1 up
ip netns exec sat4 ip link set dev sat4p0 up
ip netns exec sat3 ip addr add 190.0.8.1/24 broadcast 190.0.8.255 dev sat3p1
ip netns exec sat4 ip addr add 190.0.8.2/24 broadcast 190.0.8.255 dev sat4p0

ip link add sat11p0 type veth peer name sat3p3
ip link set sat11p0 netns sat11
ip link set sat3p3 netns sat3
ip netns exec sat11 ip link set dev sat11p0 up
ip netns exec sat3 ip link set dev sat3p3 up
ip netns exec sat11 ip addr add 190.0.10.2/24 broadcast 190.0.10.255 dev sat11p0
ip netns exec sat3 ip addr add 190.0.10.1/24 broadcast 190.0.10.255 dev sat3p3

ip link add sat4p1 type veth peer name sat5p0
ip link set sat4p1 netns sat4
ip link set sat5p0 netns sat5
ip netns exec sat4 ip link set dev sat4p1 up
ip netns exec sat5 ip link set dev sat5p0 up
ip netns exec sat4 ip addr add 190.0.11.1/24 broadcast 190.0.11.255 dev sat4p1
ip netns exec sat5 ip addr add 190.0.11.2/24 broadcast 190.0.11.255 dev sat5p0

ip link add sat5p1 type veth peer name sat6p0
ip link set sat5p1 netns sat5
ip link set sat6p0 netns sat6
ip netns exec sat5 ip link set dev sat5p1 up
ip netns exec sat6 ip link set dev sat6p0 up
ip netns exec sat5 ip addr add 190.0.14.1/24 broadcast 190.0.14.255 dev sat5p1
ip netns exec sat6 ip addr add 190.0.14.2/24 broadcast 190.0.14.255 dev sat6p0

ip link add sat6p1 type veth peer name sat7p0
ip link set sat6p1 netns sat6
ip link set sat7p0 netns sat7
ip netns exec sat6 ip link set dev sat6p1 up
ip netns exec sat7 ip link set dev sat7p0 up
ip netns exec sat6 ip addr add 190.0.17.1/24 broadcast 190.0.17.255 dev sat6p1
ip netns exec sat7 ip addr add 190.0.17.2/24 broadcast 190.0.17.255 dev sat7p0

ip link add sat7p1 type veth peer name sat8p0
ip link set sat7p1 netns sat7
ip link set sat8p0 netns sat8
ip netns exec sat7 ip link set dev sat7p1 up
ip netns exec sat8 ip link set dev sat8p0 up
ip netns exec sat7 ip addr add 190.0.20.1/24 broadcast 190.0.20.255 dev sat7p1
ip netns exec sat8 ip addr add 190.0.20.2/24 broadcast 190.0.20.255 dev sat8p0


ip link add sat11p3 type veth peer name sat12p2
ip link set sat11p3 netns sat11
ip link set sat12p2 netns sat12
ip netns exec sat11 ip link set dev sat11p3 up
ip netns exec sat12 ip link set dev sat12p2 up
ip netns exec sat11 ip addr add 190.0.30.1/24 broadcast 190.0.30.255 dev sat11p3
ip netns exec sat12 ip addr add 190.0.30.2/24 broadcast 190.0.30.255 dev sat12p2

ip link add sat12p3 type veth peer name sat13p2
ip link set sat12p3 netns sat12
ip link set sat13p2 netns sat13
ip netns exec sat12 ip link set dev sat12p3 up
ip netns exec sat13 ip link set dev sat13p2 up
ip netns exec sat12 ip addr add 190.0.33.1/24 broadcast 190.0.33.255 dev sat12p3
ip netns exec sat13 ip addr add 190.0.33.2/24 broadcast 190.0.33.255 dev sat13p2

ip link add sat12p0 type veth peer name sat4p3
ip link set sat12p0 netns sat12
ip link set sat4p3 netns sat4
ip netns exec sat12 ip link set dev sat12p0 up
ip netns exec sat4 ip link set dev sat4p3 up
ip netns exec sat12 ip addr add 190.0.13.2/24 broadcast 190.0.13.255 dev sat12p0
ip netns exec sat4 ip addr add 190.0.13.1/24 broadcast 190.0.13.255 dev sat4p3

ip link add sat13p0 type veth peer name sat5p3
ip link set sat13p0 netns sat13
ip link set sat5p3 netns sat5
ip netns exec sat13 ip link set dev sat13p0 up
ip netns exec sat5 ip link set dev sat5p3 up
ip netns exec sat13 ip addr add 190.0.16.2/24 broadcast 190.0.16.255 dev sat13p0
ip netns exec sat5 ip addr add 190.0.16.1/24 broadcast 190.0.16.255 dev sat5p3

