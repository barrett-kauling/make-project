#!/bin/sh


select LANGUAGE in 中文 English
do
	case $LANGUAGE in
		"中文")
			PS3="欢迎光临使-项目！"
			LANGUAGE=1
			break
			;;
		"English")
			PS3="Welcome to Make-Project!"
			LANGUAGE=2
			break
			;;
		*)
			break
			;;
	esac
done
echo $PS3

case $LANGUAGE in
	"1")
		PS3="选择编译器》 "
		;;
	"2")
		PS3="Select compiler> "
		;;
	*)
		PS3="Select compiler> "
		;;
esac

for path in $(echo $PATH | tr ":" "\n")
do
	for ccx in $(find $path -name *g++)
	do
		cc="$cc $ccx:$($ccx -dumpversion)"
	done
done


select CC in $cc
do
	echo $(echo $CC | awk  -F':' '{print $1}')
	break;
done

exit

select OPT in new dir exit
do
	case $OPT in
		"new")
			echo "new"
			;;
		"dir")
			echo "dir"
			;;
		"exit")
			echo "exit"
			break
			;;
		*)
	esac
done

read OPT