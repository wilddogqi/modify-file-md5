#! /bin/bash
# sh modify_image_md5.sh {目标路径}
 function modify_md5_dir(){
     for file in `ls $1`       #注意此处这是两个反引号，表示运行系统命令
     do
         if [ -d $1"/"$file ]  #注意此处之间一定要加上空格，否则会报错
         then
             modify_md5_dir $1"/"$file
         else
           if [ "${file##*.}"x = "png"x ]||[ "${file##*.}"x = "jpg"x ]
           then
             #在此处处理文件即可
             #往文件后面添加 字符串，改变文件的 MD5 值
             echo ' ' >> $1"/"$file
           fi
         fi
     done
 }
 #读取第一个参数
 modify_md5_dir $1
