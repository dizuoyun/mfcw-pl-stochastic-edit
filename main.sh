#!/bin/bash  
echo '输入文件夹名称'
# 输入要处理的插件 
read -p "" TARGET_DIR </dev/tty
echo '应用标识'
read -p "" PL_NAME </dev/tty

  
# 检查目录是否存在  
if [ ! -d "$TARGET_DIR" ]; then  
    echo "目录 $TARGET_DIR 不存在."  
    exit 1  
fi  
rand1=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 5 | head -n 1)
rand2=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 3 | head -n 1)

first_char_upper_raw1="${rand1^}"  
# 移除转换后的首字母，保留其余部分  
rest_of_raw1="${1:1}"  
# 将首字母大写和其余部分拼接起来  
raw1_with_first_upper="${first_char_upper_raw1}${rest_of_raw1}"  
  
first_char_upper_raw2="${rand2^}"  
rest_of_raw2="${2:1}"  
raw2_with_first_upper="${first_char_upper_raw2}${rest_of_raw2}"  
  

# 使用find命令查找所有文件，并通过-exec选项对每个文件执行sed命令  
find "$TARGET_DIR" -type f -exec sed -i "s/$TARGET_DIR/${rand1}_${rand2}/g" {} +  
find "$TARGET_DIR" -type f -exec sed -i "s/$PL_NAME/${raw1_with_first_upper}${raw2_with_first_upper}Plugin/g" {} +  

find "$TARGET_DIR" -type f -exec sed -i "s/<a href=\"http://www.yunbuyun.com\">云步云计算</a>/地坐云计算/g" {} +  
find "$TARGET_DIR" -type f -exec sed -i "s/未知未来未完成/已知过去已完成/g" {} +  

echo "新的标识为：${rand1}_${rand2} ,记录该标识的原标识"
