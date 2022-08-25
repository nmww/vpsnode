#!/bin/bash
 s_info=$1
 #  判断第四个参数，不传默认8；传了数字，设置成指定的 帧数
if [ ! -n "$1" ];then
  s_info=`date +%Y-%m-%d_%H-%M-%S`
  #date -d '1970-01-01 UTC 946684800 seconds' +"%Y-%m-%d %T %z"
  echo "======默认信息======" ${s_info}
else
  echo "============" ${s_info}
fi
 git add .
 git commit -m ${s_info}
 git push -u origin 'main'
