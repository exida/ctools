#!/bin/bash

#$1 source file path
#$2 stdout file path
#$3 stderr file path

sourcefile=$1
stdoutfile=$2
stderrfile=$3

filename=$(basename -- "$sourcefile")
filenameext=$filename
extension="${filename##*.}"
filename="${filename%.*}"

find_line_nums_with_tag()
{
	local tag="$1"
	ret=`grep -n "$tag" "$sourcefile" | grep -Eo '^[^:]+'`
	echo $ret
}

global_class="none"

check_single_tag_in_result()
{
    local line=$1
    local pattern="${filenameext}:${line}"
    local pattern2="src.c:${line}"
    local resfile=$2
    local tag=$3

    if [[ $resfile = *"framac"* ]]; then
        pattern="\[value:alarm\].*$pattern"
    elif [[ $resfile = *"klee"* ]]; then
        pattern=$pattern2
    fi

#TODO check -w flag as well if it fix a problem of matching substrings, e.g. .c:30 for line no 3
    if grep -qE "$pattern" "$resfile";
    then
        global_class=$tag
    fi

    #if grep -q "$pattern2" "$resfile";
    #then
    #    global_class=$tag
    #fi
}

err_line=$(find_line_nums_with_tag "ERROR_LINE" $sourcefile)
err_func=$(find_line_nums_with_tag "ERROR_FUNC" $sourcefile)
err_var=$(find_line_nums_with_tag "ERROR_VAR" $sourcefile)

for line in $err_var;
do
    check_single_tag_in_result $line $stderrfile "variable"
    check_single_tag_in_result $line $stdoutfile "variable"
done

for line in $err_func;
do
    check_single_tag_in_result $line $stderrfile "function"
    check_single_tag_in_result $line $stdoutfile "function"
done

for line in $err_line;
do
    check_single_tag_in_result $line $stderrfile "line"
    check_single_tag_in_result $line $stdoutfile "line"
done

echo -n $global_class

#echo $sourcefile $stdoutfile $stderrfile
#echo $filename
#echo $extension
#echo "lines: $err_lines"
#echo "func: $err_func"
#echo "var: $err_var"
