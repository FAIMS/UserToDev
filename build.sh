#!/bin/bash


#source /opt/context/tex/setuptex


if [ -n "$1" ]; then
	compile=$1
else
	compile="UserToDev.tex"
fi


base=$(basename -s ".tex" $compile)
rm -f *.log
rm -f *.pdf
rm -f *.tuc

context --batchmode --silent $compile > run.log
grep -A 15 	"tex error" run.log 

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