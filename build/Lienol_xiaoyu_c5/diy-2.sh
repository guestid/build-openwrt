#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-123'' package/default-settings/files/zzz-default-settings

# 内核显示增加自己个性名称（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些为后期增加）
#sed -i "s/OpenWrt /281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）（小闪存机子不建议使用）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 如果你的K2P支持32MB闪存的请开启，默认K2P固件不能超过15.3MB的（如果有其他mt7621芯片一起编译要注意,打开这个会把整个文件的16m改成32m）
sed -i 's/ralink_default_fw_size_16M/ralink_default_fw_size_32M/g' target/linux/ramips/image/mt7621.mk

# 修改插件名字（修改名字后不知道会不会对插件功能有影响，自己多测试）
