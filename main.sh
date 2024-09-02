#!/bin/bash  

TARGET_DIR="${1//\//}"  

# 检查目录是否存在  
if [ ! -d "$TARGET_DIR" ]; then  
    echo "目录 $TARGET_DIR 不存在."  
    exit 1  
fi  

r1=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 5 | head -n 1)
r2=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 3 | head -n 1)

p1="${TARGET_DIR%%_*}"  
p2="${TARGET_DIR#*_}"  

cur11="${p1^}"
rfr11="${2:1}"
cur12="${p2^}"
rfr12="${2:1}"
raw1="${cur11}${rfr11}${cur12}${rfr12}"  

cur21="${r1^}"
rfr21="${2:1}"
cur22="${r2^}"
rfr22="${2:1}"
raw2="${cur21}${rfr21}${cur22}${rfr22}"  

# 使用find命令查找所有文件，并通过-exec选项对每个文件执行sed命令  
find . -type f -exec sed -i "s/${TARGET_DIR}/${r1}_${r2}/g" {} +  
find . -type f -exec sed -i "s/${raw1}/${raw2}/g" {} +  
find "$TARGET_DIR" -type f -exec sed -i 's/云步云计算/地坐云计算/g' {} +  
find "$TARGET_DIR" -type f -exec sed -i "s/未知未来未完成/已知过去已完成/g" {} +  
find "$TARGET_DIR" -type f -exec sed -i "s/www.yunbuyun.com/cn.bing.com/g" {} +  

if [ "${TARGET_DIR}/README.md" ]; then  
    rm -rf "${TARGET_DIR}/README.md"
fi  

mv "${TARGET_DIR}/${raw1}Plugin.php" "${TARGET_DIR}/${raw2}Plugin.php"
mv "${TARGET_DIR}" "${r1}_${r2}"

echo "原标识：${raw1} 新标识：${raw2}"
