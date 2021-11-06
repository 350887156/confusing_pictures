#! /bin/bash
function read_dir() {
    for file in `ls $1`
        do
        if [ -d $1"/"$file ]
        then
        read_dir $1"/"$file
        else
            filename="$1"/"$file"
            if [ -n $filename ];then
                png="png"
                jpg="jpg"
                suffix="${filename##*.}"
                if [ "$png" = "$suffix" ];then
                    echo $2 >> $filename
                    echo "处理完成 $filename"
                elif [ "$jpg" = "$suffix" ];then
                    echo $2 >> $filename
                    echo "处理完成 $filename"
                else
                    echo "未处理文件 $filename"
                fi
            fi
        fi
    done
} 
read_dir $1 $2