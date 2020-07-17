#!/bin/bash

echo "Welcome to the world of Gambling."

# Assign variables and add values(Money).
stakeMoneyPerDay=100;

# Assign another variable and inside use RANDOM to generate numbers between 0 and 1.
gameResult=$(($RANDOM%2))

# Apply if condition and find if Gamble wins or lost.
function findWinOrLoss() {
	if [[ $gameResult -eq 1 ]]
	then
		echo "Gambler Win"
		moneyEarns=$(($stakeMoneyPerDay+1))
	else
		echo "Gambler lost"
		moneyEarns=$(($stakeMoneyPerDay-1))
	fi
}

findWinOrLoss
#End of Use Case 02
