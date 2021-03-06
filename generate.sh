#!/bin/bash

bash gfwlist2dnsmasq.sh -d 10.10.1.4 -p 53 -o gfwlist.conf -s gfwlist --extra-domain-file gfwlist2domain.txt


grep -IFvf exclude_domain_regex  gfwlist.conf > gfwlist.conf.2

mv -fvi gfwlist.conf.2 gfwlist.conf

scp gfwlist.conf home:/etc/dnsmasq.d
scp ip_ext.txt home:/root


#ssh home "source /etc/profile && service dnsmasq restart"
ssh home "/etc/init.d/dnsmasq restart"


