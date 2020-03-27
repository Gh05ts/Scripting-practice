#!/bin/bash
echo "Gonna build a rocket ship!"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo 'The build version is' $version
echo 'Enter y to continue, n to exit'
read versioncontinue
if [ $versioncontinue == 'y' ]
  then 
    echo 'OK'
    for filename in source/*
    do 
      if [ $filename != source/secretinfo.md ]
        then echo $filename 'is being copied'
             cp $filename build/
        else echo $filename 'is not begin copied'
      fi
    done
    cd build/
    echo 'Build version $version contains'
    ls
    cd ..
    echo 'make git update?'
    read yn
    if [ $yn == 'y']
    	then git add .
	     git commit -m 'Updating to $version'
	     git push
	else echo 'OK, no version control for you, living dangerously'
    fi
  else
    echo 'Come back when you grow up, kid'
fi
