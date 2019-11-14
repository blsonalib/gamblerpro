#!/bin/bash -x
echo "Welcome To Gambler Simulator"
stack=100
BET=1
result=$(( RANDOM%2 ))
if [ $result -eq 0 ]
then
    stack=$(( $stack + 1 ))
else
    stack=$(( $stack - 1 ))
fi

     

