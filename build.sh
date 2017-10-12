#!/bin/bash


#source /opt/context/tex/setuptex

rm -f *.log
rm -f *.pdf
rm -f *.tuc

context --batchmode --silent $1 > run.log
grep -A 15 	"tex error" run.log 
