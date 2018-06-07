#!/bin/bash


#source /opt/context/tex/setuptex


if [ -n "$1" ]; then
	compile=$1
else
	compile="UserToDev.tex"
fi


base=$(basename -s ".tex" $compile)
rm -f *.log
rm -f UserToDev.pdf
rm -f *.tuc

context --batchmode --silent $compile > run.log
retVal=$?
if [ $retVal -ne 0 ]; then
	grep -A 15 	"tex error" run.log 
	subl run.log
	exit 1
fi


platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
fi

if [[ $platform == 'linux' ]]; then
	xdg-open ${base}.pdf
else
	open ${base}.pdf
fi