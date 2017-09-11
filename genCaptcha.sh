#!/usr/bin/env sh

SOLUTION=$(pwgen -B 4 1)

echo $SOLUTION > captcha/$1
toilet -s -f bigascii12 $SOLUTION

