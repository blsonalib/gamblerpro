#!/bin/bash -x
echo "Welcome To Gambler Simulator"
stack=100
BET=1
percent=50
goal=$stack
numberOfGoals=$(( ($percent * 100) / 100 ))
maxValue=$(( $stack + $numberOfGoals ))
minValue=$(( $stack - $numberOfGoals ))
while [ $maxValue -gt $goal ] && [ $minValue -lt $goal ]
do
   result=$(( RANDOM%2 )) 
   if [ $result -eq 0 ]
   then
      goal=$(( $goal + 1 ))
    else
      goal=$(( $goal - 1 )) 
     fi
done 


