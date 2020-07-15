#!/bin/bash

# Welcome Message
echo "Welcome to the world of Gambling."

declare -A gamblerPaidPerDay

# Declare variables and assign values. 
STAKE_MONEY_PER_DAY=100;
TOTAL_DAYS_PLAYED=20;
STAKE_PERCENT=$(($((STAKE_MONEY_PER_DAY))*50/100));
MAX_MONEY_WIN_PER_DAY=$((STAKE_MONEY_PER_DAY+STAKE_PERCENT));
MIN_MONEY_LOST_PER_DAY=$((STAKE_MONEY_PER_DAY-STAKE_PERCENT));

TOTAL_STAKE_AMOUNT=$((STAKE_MONEY_PER_DAY*TOTAL_DAYS_PLAYED));
moneyEarns=$((STAKE_MONEY_PER_DAY));
exactMoneyEarn=0;

# Gambler plays for 20 Days. 
for (( daysCount=1;daysCount<=$TOTAL_DAYS_PLAYED;daysCount++ ))
do
	while [[ $moneyEarns -le $MAX_MONEY_WIN_PER_DAY && $moneyEarns -ge $MIN_MONEY_LOST_PER_DAY ]]
	do
		gameResult=$(($RANDOM%2));

		if [[ $gameResult -eq 1 ]]
		then
			((moneyEarns++));
		else
			((moneyEarns--));
		fi
	done
	gamblerPaidPerDay[daysCount]=$((moneyEarns));
	exactMoneyEarn=$(($exactMoneyEarn+$moneyEarns));
	moneyEarns=$((STAKE_MONEY_PER_DAY));
done

echo "After 20 days, Total Amount Gambler Earns: $exactMoneyEarn"

if [[ $exactMoneyEarn -gt $TOTAL_STAKE_AMOUNT ]]
then
	moneyWins=`expr $exactMoneyEarn - $TOTAL_STAKE_AMOUNT`
	echo "Gambler wins: $moneyWins"
elif [[ $exactMoneyEarn -lt $TOTAL_STAKE_AMOUNT ]]
then
	moneyLost=`expr $TOTAL_STAKE_AMOUNT - $exactMoneyEarn`
	echo "Gambler lost: $moneyLost"
else
	echo "Gambler has Neither Won Nor Lost."
fi

#End of UseCase 04
