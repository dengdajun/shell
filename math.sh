#!/bin/bash
test1=1;
test2=2;
let result=test1+test2
echo $result
let result++
echo $result
result=$[result+result]
echo $result;
result=$[$result+1]
echo $result;
result=$((result+90));
echo $result;
result=´expr 3+4´
echo $result;
result=$(expr $result+8);
echo $result;

