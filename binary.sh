#!/bin/bash
#进制转换
no=100
echo "obase=2;$no" | bc
1100100
no=1100100
echo "obase=10;ibase=2;$no" | bc
#平方跟
echo "sqrt(100)" | bc #Square root
echo "10^10" | bc #Square
