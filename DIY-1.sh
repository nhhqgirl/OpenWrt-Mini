# DIY-1 此脚本功能：添加外部插件
# =======================================================================================================================

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# remove v2ray-geodata package from feeds (openwrt-22.03 & master)
rm -rf feeds/packages/net/v2ray-geodata

git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
make menuconfig # choose LUCI -> Applications -> luci-app-mosdns
make package/mosdns/luci-app-mosdns/compile V=s

# 1-添加 ShadowSocksR Plus+ 插件
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 2-添加 PowerOff 关机插件
git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff

# 3-添加 opentomcat 主题
git clone https://github.com/WukongMaster/luci-theme-opentomcat.git package/luci-theme-opentomcat

# 4-添加 OpenClash 插件
sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# 5-添加 PassWall 插件
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
