#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP and password
sed -i 's/192.168.1.1/10.6.6.1/g' package/base-files/files/bin/config_generate

# 修改连接数
# sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
# 修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# themes添加（svn export --force 命令意思：指定版本如https://github）
# git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
# git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
# git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# 添加额外软件包
# git clone https://github.com/panther706/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic

git clone https://github.com/vernesong/OpenClash.git package/OpenClash


# git clone https://github.com/kiddin9/openwrt-packages.git package/openwrt-packages
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/adguardhome package/adguardhome
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-adguardhome package/luci-app-adguardhome

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-cpufreq package/luci-app-cpufreq

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-argon-config package/luci-app-argon-config

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-openvpn-server package/luci-app-openvpn-server

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/oscam package/oscam
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-oscam package/luci-app-oscam

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-passwall package/luci-app-passwall
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/dns2socks package/dns2socks
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/dns2tcp package/dns2tcp 
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/microsocks package/microsocks
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/tcping package/tcping
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/ipt2socks package/ipt2socks
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/brook package/brook
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/chinadns-ng package/chinadns-ng
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/hysteria package/hysteria
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/naiveproxy package/naiveproxy
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/shadowsocks-rust package/shadowsocks-rust
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/shadowsocksr-libev package/shadowsocksr-libev
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/simple-obfs package/simple-obfs
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/trojan-plus package/trojan-plus
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/v2ray-plugin package/v2ray-plugin 
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/xray-plugin package/xray-plugin

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/qBittorrent package/qBittorrent
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-qbittorrent package/luci-app-qbittorrent
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/rblibtorrent package/rblibtorrent
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/qBittorrent-Enhanced-Edition package/qBittorrent-Enhanced-Edition
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/qtbase package/qtbase
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/qttools package/qttols

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-rclone package/luci-app-rclone

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-turboacc package/luci-app-turboacc
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/pdnsd-alt package/pdnsd-alt
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/dnsforwarder package/dnsforwarder
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/shortcut-fe package/shortcut-fe

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-zerotier package/luci-app-zerotier

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-wizard package/luci-app-wizard

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/vsftpd-alt package/vsftpd-alt
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-vsftpd package/luci-app-vsftpd

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-theme-argon package/luci-theme-argon
svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-theme-edge package/luci-theme-edge

svn export --force https://github.com/kiddin9/openwrt-packages/branches/master/luci-app-easymesh package/luci-app-easymesh



# 添加核心温度的显示
sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# Modify NTP Server
sed -i "s/0.openwrt.pool.ntp.org/ntp.aliyun.com/g" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/cn.ntp.org.cn/g" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/cn.pool.ntp.org/g" package/base-files/files/bin/config_generate



