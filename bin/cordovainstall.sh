#!/bin/sh 
if [ "$1" == "--help" ] ;then
	echo "Loading....Need to add all the help content"    
else
	read -p "Are you sure want to install Yeoman Setup (yes / no) : " yeoman
	if [ "$yeoman" == "yes" ]; then

		read -p "Please provide the application name: " appName	
		read -p "Are you sure include cordova Setup(yes / no)  : " corset

		if [ "$corset" == "yes" ]; then

			read -p "Please provide the package folder name : " folder
			read -p "Please provide the bundle identifier : " idn
			read -p "Are you sure want to install Android (yes / no) : " androidname
			read -p "Are you sure want to install IOS (yes / no) : " iosname
		fi	

		echo "Loading...."
		yo mytemp $appName
		

		if [ "$corset" == "yes" ]; then

			
			# read -p "Your application name is : $appName , Have you changed application name for cordova project (yes / no)" appnCh
			# if [ "$appnCh" == "yes" ]; then
			# 	read -p "Please provide the application name: " tit
			# else
			# 	tit="$appName"
			# fi
			# # read -p "Please provide the application name: " tit
			# echo "appName: $tit"

			if [ "$idn" != "" ] && [ "$appName" != "" ] ; then
				echo "Loading...."
				cordova create $folder com.$idn $appName
			else
				echo "you went something wrong.please see the help 'sh cordovainstall.sh --help' "
				exit
			fi
			cd $folder

			echo "which platforms you want to add "

			# read -p "Are you sure want to install Android (yes / no) : " androidname

			if [ "$androidname" == "yes" ] ;then
				echo "Loading...."
				cordova platform add android
			fi

			# read -p "Are you sure want to install IOS (yes / no) : " iosname

			if [ "$iosname" == "yes" ]; then
				echo "Loading...."
				cordova platform add ios
			fi
			echo "If you want add more platforms you can add manaually."
			echo "Thanks.."

			echo "If you want more help you can use sh cordovainstall.sh --help."
			exit
		else
			echo "If you want more help you can use sh cordovainstall.sh --help."
			exit;
		fi	
	else
		echo "If you want more help you can use sh cordovainstall.sh --help."
		exit
	fi
fi


