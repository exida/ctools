#!/bin/bash

for d in $(find . -name *.cocci)
do
  spatch -D report --jobs 4 --no-show-diff --very-quiet --cocci-file $d $1
done 

#
#echo -e "\n\nOther semantic patches:\n"
#for d in $(find coccinellery-master -name *.cocci)
#do
##echo -e " \n\n"
##echo $d
#
#  if grep -q 'position' "$d"; then
#     cp $d tmp.txt
#     sed -i '1s/^/virtual report\n/' tmp.txt
#     echo -e "\n@script:python depends on report@\np << r1.p;\n@@\ncoccilib.report.print_report(p[0],'Test name: $d')" >> tmp.txt
#     
#     spatch -D report --no-show-diff --very-quiet --cocci-file tmp.txt test.c
#  
#  else
#    # lack of position identifier inside code
#    spatch --no-show-diff --very-quiet --cocci-file $d test.c
#  fi
#
#  
#  
#done 
#
#
#echo -e "\n\nNicholas semantic patches:\n"
#for d in $(find cocci_nicolas -name *.cocci)
#do
#echo -e " \n\n"
#  echo $d
#
#  spatch -D report --no-show-diff --very-quiet --cocci-file $d test.c
#  
#done 







