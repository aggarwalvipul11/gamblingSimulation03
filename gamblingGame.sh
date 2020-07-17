#!/bin/bash

# Welcome Message
echo "Welcome to the world of Gambling."

declare -A gamblerPaidPerDay

#CONSTANTS
STAKE_MONEY_PER_DAY=100;
STAKE_PERCENT=$(($((STAKE_MONEY_PER_DAY))*50/100));
MAX_MONEY_WIN_PER_DAY=$((STAKE_MONEY_PER_DAY+STAKE_PERCENT));
MIN_MONEY_LOST_PER_DAY=$((STAKE_MONEY_PER_DAY-STAKE_PERCENT));
TOTAL_DAYS_IN_MONTH=30;
TOTAL_STAKE_AMOUNT=$((STAKE_MONEY_PER_DAY*TOTAL_DAYS_IN_MONTH));

# Declare variables and assign values.
moneyEarns=$((STAKE_MONEY_PER_DAY));
exactMoneyEarn=0;
countProfitDays=0;
countLossDays=0;
totalMoneyWinsInMonth=0;
totalMoneyLostInMonth=0;

# Gambler plays for 1 Month. 
function checkMoneyFlowPerMonth() {
	for (( daysCount=1;daysCount<=$TOTAL_DAYS_IN_MONTH;daysCount++ ))
	do
		checksGamblerWinsBetPerDay
		checkMoneyEarnsEqual                            
		valueAssignMoney
	done
}

function checksGamblerWinsBetPerDay() {
	while [[ $moneyEarns -lt $MAX_MONEY_WIN_PER_DAY && $moneyEarns -gt $MIN_MONEY_LOST_PER_DAY ]]
	do
		findWinOrLoss
	done
}

function findWinOrLoss() {
		gameResult=$(($RANDOM%2));
		if [[ $gameResult -eq 1 ]]
		then
			((moneyEarns++));
		else
			((moneyEarns--));
		fi
}

function checkMoneyEarnsEqual() {
	if [[ $moneyEarns -eq $MAX_MONEY_WIN_PER_DAY ]]
        then    
            ((countProfitDays++));
            totalMoneyWinsInMonth=$(($totalMoneyWinsInMonth+$moneyEarns));
        elif [[ $moneyEarns -eq $MIN_MONEY_LOST_PER_DAY ]]
        then
            ((countLossDays++));
            totalMoneyLostInMonth=$(($totalMoneyLostInMonth+$moneyEarns));
        else
            echo "No Loss No Profit!"
        fi
}

function valueAssignMoney() {
	gamblerPaidPerDay[daysCount]=$((moneyEarns));
	exactMoneyEarn=$(($exactMoneyEarn+$moneyEarns));    
	moneyEarns=$((STAKE_MONEY_PER_DAY));
}

function checksIfGamberWInsOrLost() {
	if [[ $exactMoneyEarn -gt $TOTAL_STAKE_AMOUNT ]]
	then
    	echo "At End of Month, Gambler Wins $countProfitDays Days and $totalMoneyWinsInMonth Dollar."
	elif [[ $exactMoneyEarn -lt $TOTAL_STAKE_AMOUNT ]]
	then
    	echo "At End of Month, Gambler Lost $countLossDays Days and $totalMoneyLostInMonth Dollar."
	else
    	echo "Gambler has Neither Won Nor Lost."
	fi
}

checkMoneyFlowPerMonth
checksIfGamberWInsOrLost
#End of UseCase 05
