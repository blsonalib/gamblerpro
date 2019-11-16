#!/bin/bash -x
echo "Welcome To Gambler Simulator"
declare -A storeAmount
#constants
STAKE=100
BET=1
PERCENT=50

#variables
goal=$STAKE
DAY=30
counter=0
numberOfGoals=$(( ($PERCENT * $STAKE) / 100 ))
maxValue=$(( $STAKE + $numberOfGoals ))
minValue=$(( $STAKE - $numberOfGoals ))
function gambler()
{
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
}
gambler
storeAmount["win"]=$win
storeAmount["loose"]=$loose
storeAmount["totalAmount"]=$totalAmount
echo ${!storeAmount[@]}  
echo ${storeAmount[@]}
lukiestDay=$( printf "%s\n" ${!storeAmount[@]} ${storeAmount[@]} | sort -nr | head -1  )
unlukiestDay=$( printf "%s\n" ${!storeAmount[@]} ${storeAmount[@]} | sort -nr | tail -1 )
if [ $totalAmount -gt  0 ]
then
   gambler
else
   echo "Quit"
fi 



