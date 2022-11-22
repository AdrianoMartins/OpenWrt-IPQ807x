#!/bin/bash

# Modify netfilter parameters
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# Packages
#git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone https://github.com/gSpotx2f/luci-app-temp-status.git package/luci-app-temp-status

# Packages Repo
#git clone https://github.com/kiddin9/openwrt-packages.git package/openwrt-packages
#shopt -s extglob

#PACKAGES="("adguardhome"|"luci-app-adguardhome"|"luci-app-cpufreq"|"luci-app-argon-config"|"luci-app-openvpn-server"|"openwrt_oscam"|"luci-app-oscam"|"qBittorrent"|"luci-app-qbittorrent"|"rblibtorrent"|"qBittorrent-Enhanced-Edition"|"qtbase"|"qttools"|"luci-app-rclone"|"luci-app-zerotier"|"luci-app-wizard"|"vsftpd-alt"|"luci-app-vsftpd"|"luci-theme-argon"|"luci-theme-edge")"
#rm -R -f package/openwrt-packages/!$PACKAGES

# Modify NTP Server 
sed -i "s/0.openwrt.pool.ntp.org/pool.ntp.org/g" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/0.south-america.pool.ntp.org/g" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/0.europe.pool.ntp.org/g" package/base-files/files/bin/config_generate

# Kernel Patch
curl -sfL https://raw.githubusercontent.com/Boos4721/openwrt/master/target/linux/ipq807x/patches-5.15/700-ipq8074-overclock-cpu-2.2ghz.patch -o target/linux/ipq807x/patches-5.15/700-ipq8074-overclock-cpu-2.2ghz.patch
cp patchs/* target/linux/ipq807x/patches-5.15/
sed -i 's/uci_write_config 0 schedutil 1017600 $CPU_MAX_FREQ/uci_write_config 0 ondemand 1017600 1382400/g' package/openwrt-packages/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq

sed -i '$a  \
CONFIG_CPU_FREQ_GOV_POWERSAVE=y \
CONFIG_CPU_FREQ_GOV_USERSPACE=y \
CONFIG_CPU_FREQ_GOV_ONDEMAND=y \
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y \
' target/linux/ipq807x/config-5.15