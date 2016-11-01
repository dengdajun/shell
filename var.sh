#!/bin/bash
test=gogog
echo $test
length=asdfalskdjfalksdjfalksjdflaksjdflakjsdf
echo ${#length}
echo $SHELL
echo $0
if [ $UID -ne 0 ]; then
	echo not root user;
else echo root;
fi
