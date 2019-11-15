#!/bin/bash -x
echo "Welcome To Gambler Simulator"
declare -A storeAmount
STAKE=100
BET=1
PERCENT=50
goal=$STAKE
DAY=30
numberOfGoals=$(( ($PERCENT * $STAKE) / 100 ))
maxValue=$(( $STAKE + $numberOfGoals ))
minValue=$(( $STAKE - $numberOfGoals ))
for (( i=0; i<=$DAY; i++ ))
do
   goal=$STAKE 
   totalAmount=0	
   while [ $maxValue -gt $goal ] && [ $minValue -lt $goal ]
   do  
      result=$(( RANDOM%2 )) 
      if [ $result -eq 0 ]
      then
         goal=$(( $goal + $BET ))
         win=$(( $goal +  $STAKE ))
         totalAmount=$(($totalAmount + 1 ))
        
      else
         goal=$(( $goal - $BET )) 
         loose=$(( $goal - $STAKE ))
         totalAmount=$(($totalAmount - 1 ))
                 
       fi
      done
done
storeAmount["win"]=$win
storeAmount["loose"]=$loose
storeAmount["totalAmount"]=$totalAmount
echo ${storeAmount[@]}  

