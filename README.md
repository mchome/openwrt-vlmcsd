# openwrt-vlmcsd
a package for vlmcsd

```
PS:
1. srv-host=_vlmcs._tcp.lan,openwrt.lan,1688,0,100 添加到 /etc/dnsmasq.conf .
2. /etc/init.d/vlmcsd enable && /etc/init.d/vlmcsd start && /etc/init.d/dnsmasq restart
3. OK, 你的路由器下应该可以自动激活Windows或者Office了 :)
```

配套luci: [luci-app-vlmcsd](https://github.com/mchome/luci-app-vlmcsd "")
