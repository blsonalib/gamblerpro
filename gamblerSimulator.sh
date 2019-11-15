#!/bin/bash -x
echo "Welcome To Gambler Simulator"
declare -A storeAmount
declare -A days
STAKE=100
BET=1
PERCENT=50
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
         counterDay=$(($counter+1))  
         
      else
         goal=$(( $goal - $BET )) 
         loose=$(( $goal - $STAKE ))
         totalAmount=$(($totalAmount - 1 ))
         counterDay=$((counter-1 ))        
       fi
      done
 done
}
gambler
storeAmount["win"]=$win
storeAmount["loose"]=$loose
storeAmount["totalAmount"]=$totalAmount
days=["counterDay"]=$counterDay
echo ${days[@]}
echo ${!storeAmount[@]}  
echo ${storeAmount[@]}
MaxValueWin=$( printf "%s\n" ${!storeAmount[@]} ${storeAmount[@]} | sort -nr | head -1  )
minValueLoose=$( printf "%s\n" ${!storeAmount[@]} ${storeAmount[@]} | sort -nr | tail -1 )
if [ $totalAmount -gt  0 ]
then
   echo "continue to play"
else
   echo "Quit"
fi

