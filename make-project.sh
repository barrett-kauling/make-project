#!/bin/sh

Select() {
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
			LN="cn"
			break
			;;
		"English")
			PS3="Welcome to Make-Project!"
			LANGUAGE=2
			LN="en"
			break
			;;
		*)
			PS3="Welcome to Make-Project!"
			LANGUAGE=2
			break
			;;
	esac
done
echo $PS3

if [ "$(uname -s)" == "MSYS_NT-10.0" ]; then
	CC_NAME="g++.exe"
	MSYS2_DIR="$(dirname $(find /c/ -name msys2.exe))"
	USR="$MSYS2_DIR/usr"
elif [ "$(uname -s)" == "Linux" ]; then
	CC_NAME="g++"
	USR="/usr"
fi

case $LANGUAGE in
	"1")
		PS3="选择编译器》 "
		break
		;;
	"2")
		PS3="Select compiler> "
		break
		;;
	*)
		PS3="Select compiler> "
		break
		;;
esac

echo "searching \$PATH for $CC_NAME compilers ..."
for path in $(echo $PATH | tr ":" "\n")
do
	for ccx in $(find $path -name *$CC_NAME 2> /dev/null)
	do
		cc="$cc $ccx:$($ccx -dumpversion)"
	done
done


select CC in $cc
do
	echo $CC | awk -F':' '{print $1}'
	echo $CC | awk  -F':' '{print $1}' > /usr/share/make-project/SYS_CC
	break;
done

case $LANGUAGE in
	"1")
		PS3="选择名录》 "
		break
		;;
	"2")
		PS3="Select directory> "
		break
		;;
	*)
		PS3="Select directory> "
		break
		;;
esac
read -p "$PS3" wd
mkdir -p $wd
stat $wd

case $LANGUAGE in
	"1")
		PS3="项目名字》 "
		break
		;;
	"2")
		PS3="Project name> "
		break
		;;
	*)
		PS3="Project name> "
		break
		;;
esac
read -p "$PS3" project_name
echo $project_name


prompt="project class exit"
if  [ $LANGUAGE == "1" ]; then
	prompt="项目 课时 离去"
elif [ $LANGUAGE == "2" ]; then
	prompt="project class exit"
fi

case $LANGUAGE in
	"1")
		PS3="菜单》 "
		break
		;;
	"2")	
		PS3="Menu> "
		break
		;;
	*)
		PS3="Menu> "
		break
		;;
esac

select OPT in $prompt
do
	case $OPT in
		"项目")
			mkdir -p $wd/{建设,并把,源码}
			break
			;;
		"project")
			mkdir -p $wd/{build,include,src}
			cp -v $USR/share/make-project/en/{README.md,Makefile,project.session,SciTE.properties,LICENSE} $wd
			cp -v $USR/share/make-project/en/main.cpp $wd/src
			break
			;;
		
		"课时")
			break
			;;
		"class")
			cp -v $USR/share/make-project/en/class.h $wd/include
			cp -v $USR/share/make-project/en/class.cpp $wd/src
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

exit
