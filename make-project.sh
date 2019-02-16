#!/bin/sh

select()
{
	case $LANGUAGE in
		"1")
			break
			;;
		"2")
			break
			;;
		*)
			break
			;;
	esac
}

select LANGUAGE in 中文 English
do
	case $LANGUAGE in
		"中文")
			PS3="欢迎光临使-项目！"
			LANGUAGE=1
			break
			;;
		"English")
		*)
			PS3="Welcome to Make-Project!"
			LANGUAGE=2
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

case $LANGUAGE in
	"1")
		PS3="选择名录》 "
		break
		;;
	"2")
	*)
		PS3="Select directory> "
		break
		;;
esac
read $directory

case $LANGUAGE in
	"1")
		PS3="项目名字》 "
		break
		;;
	"2")
	*)
		PS3="Project name> "
		break
		;;
esac
read $project_name

prompt="project class exit"
if  [ $LANGUAGE == "1" ]; then
	prompt="项目 课时 离去"
elif [ $LANGUAGE == "2" ]; then
	prompt="project class exit"
fi

select OPT in $prompt
do
	case $OPT in
		"项目")
		"project")
			mkdir -p $directory/{build,include,src}
			cp -v README.md Makefile project.session SciTE.properties LICENSE $directory
			cp -v main.cpp $directory/src
			break
			;;
		
		"课时")
		"class")
			cp -v class.h $directory/include
			cp -v class.cpp $directory/src
			break
			;;
		
		"离去")
			echo "离去"
			break
			;;
			
		"exit")
			echo "exit"
			break
			;;
			
		*)
			break
			;;
	esac
done

read OPT