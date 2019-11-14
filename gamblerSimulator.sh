#!/bin/bash -x
echo "Welcome To Gambler Simulator"
declare -A storeAmount
STAKE=100
BET=1
PERCENT=50
goal=$STAKE
DAY=20
numberOfGoals=$(( ($PERCENT * $STAKE) / 100 ))
maxValue=$(( $STAKE + $numberOfGoals ))
minValue=$(( $STAKE - $numberOfGoals ))
for (( i=1; i<=$DAY; i++ ))
do
   goal=$STAKE 	
   while [ $maxValue -gt $goal ] && [ $minValue -lt $goal ]
   do
      result=$(( RANDOM%2 )) 
      if [ $result -eq 0 ]
      then
         goal=$(( $goal + 1 ))
         win=$(( $goal +  $STAKE ))
         totalAmount=$(( $totalAmount + 1 ))
      else
         goal=$(( $goal - 1 )) 
         loose=$(( $goal - $STAKE ))
         totalAmount=$(( $totalAmount - 1))
       fi
      done
done  


