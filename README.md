# mfcw-pl-stochastic-edit
智简魔方（魔方财务）插件动编脚本
### 使用方法

*当前只支持Addon*

1. 安装

   ```shell
   wget https://raw.githubusercontent.com/dizuoyun/mfcw-pl-stochastic-edit/main/main.sh -O /usr/bin/mpse && chmod +x /usr/bin/mpse
   ```

   国内服务器可以用以下命令：

   ```shell
   wget https://mirror.ghproxy.com/https://raw.githubusercontent.com/dizuoyun/mfcw-pl-stochastic-edit/main/main.sh -O /usr/bin/mpse && chmod +x /usr/bin/mpse
   ```

2. 使用方法：
  
   ```shell
   cd 网站目录/public/plugins/addons
   mpse 需要动编的Addon目录
   ```
   以“积分抵现”示例：
   ```shell
   cd /www/wwwroot/www.yunbuyun.com/public/plugins/addons
   mpse points_offset
   ```

后续每次更新重新执行1号命令就可以了。

### 注意
你下载的插件越多处理的越慢<br>
插件目录名称可以使用 Tab键 补全
