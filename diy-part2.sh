#!/bin/bash

# Modify netfilter parameters
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# Modify NTP Server 
sed -i "s/0.openwrt.pool.ntp.org/pool.ntp.org/g" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/0.south-america.pool.ntp.org/g" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/0.europe.pool.ntp.org/g" package/base-files/files/bin/config_generate