
#!/bin/bash -x
echo "Welcome To Gambler Simulator"

#constants
STAKE=100
BET=1
PERCENT=50
DAY=30
 
#variables
initialGoal=$STAKE
totalAmountWinLoss=0

declare -A storeDayAmount

numberOfinitialGoals=$(( ($PERCENT * $STAKE) / 100 ))
maxNumberOfGoals=$(( $STAKE + $numberOfinitialGoals ))
minNumberOfGoals=$(( $STAKE - $numberOfinitialGoals ))
function gambler()
{
 for (( day=0; day<=$DAY; day++ ))
 do
   initialGoal=$STAKE 	
   while [  $initialGoal -lt $maxNumberOfGoals ] && [  $initialGoal -gt $minNumberOfGoals ]
   do  
      result=$(( RANDOM%2 )) 
      if [ $result -eq 0 ]
      then
         initialGoal=$(( $initialGoal + $BET ))
         totalAmountWinLoss=$(($totalAmountWinLoss + 1 ))
      else
         initialGoal=$(( $initialGoal - $BET ))
         totalAmountWinLoss=$(($totalAmountWinLoss - 1 ))
       fi
      done
 done
}
gambler

storeDayAmount["totalAmountWinLoss"]=$totalAmountWinLoss
echo ${!storeDayAmount[@]}  
echo ${storeDayAmount[@]}
maxNumberOfGoalsWin=$( printf "%s\n" ${!storeDayAmount[@]} ${storeDayAmount[@]} | sort -nr | head -1  )
minNumberOfGoalsLoose=$( printf "%s\n" ${!storeDayAmount[@]} ${storeDayAmount[@]} | sort -nr | tail -1 )

if [ $totalAmountWinLoss -gt  0 ]
then
   echo "continue to play"
   gambler
else
   echo "Quit"
fi


