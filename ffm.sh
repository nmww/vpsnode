#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
             echo "you chose choice 1 ts to mp4"
            read -r -e -p "ts name == " inputName
            # 去掉最后 /前 内容       outname=${tsname##*/}
            # 去掉 扩展名 . 和之后内容   outname2=${tsname%.*}
            tsname=${inputName##*/}
            outname=${tsname%.*}".mp4"
            echo "inname = $inputName"
            echo "tsname = $tsname"
            echo "outname = $outname"
            ffmpeg -i $tsname -acodec copy -vcodec copy -absf aac_adtstoasc $outname
            ;;
        "Option 2")
            echo "you chose choice 2 cut 00:00:00 - long time m"

            read -r -e -p "input mp4 name = " inname
            read -r -e -p "input start time 00:00:00 = " stime
            read -r -e -p "input long time 秒= " ltime
            mname=${inname##*/}
            ffmpeg -i $mname -ss $stime -t $ltime outcut.mp4
            ;;
        "Option 3")
            echo "you chose choice 3"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
