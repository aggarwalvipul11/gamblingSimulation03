#!/bin/bash

# Welcome Message
echo "Welcome to the world of Gambling."
 
# Assign variables and add values(Money).
STAKE_MONEY_PER_DAY=100;
BET_MONEY_PER_GAME=1;

# Added variables for adding a limit for minimum money lost and maximum money wins.
STAKE_PERCENT=$(($((STAKE_MONEY_PER_DAY))*50/100));
MAX_MONEY_WIN_PER_DAY=$((STAKE_MONEY_PER_DAY+STAKE_PERCENT));
MIN_MONEY_LOST_PER_DAY=$((STAKE_MONEY_PER_DAY-STAKE_PERCENT));
moneyEarns=$((STAKE_MONEY_PER_DAY));

# Apply while condition and checks the condition mets or not
while [[ $moneyEarns -le $MAX_MONEY_WIN_PER_DAY && $moneyEarns -ge $MIN_MONEY_LOST_PER_DAY ]]
do
	gameResult=$(($RANDOM%2));

	# Apply if condition and if Gamble wins or lost.
	if [[ $gameResult -eq 1 ]]
	then
		echo "Gambler Win"
		moneyEarns=$((moneyEarns+BET_MONEY_PER_GAME));
	else
		echo "Gambler lost"
		moneyEarns=$((moneyEarns-BET_MONEY_PER_GAME));
	fi
done

#End of Use Case 03
