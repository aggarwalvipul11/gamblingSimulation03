#!/bin/bash

# Welcome Message
echo "Welcome to the world of Gambling."

declare -a luckiestDay
declare -a unluckiestDay

# CONSTANTS 
STAKE_MONEY_PER_DAY=100;
TOTAL_DAYS_IN_MONTH=10;

# Declare variables and assign values.
tranferStakeMoneyPerDay=0;
newStakeMoneyPerDay=0;
collectWinTempRecords=0;
collectLostTempRecords=0;
winPerDay=0;
lostPerDay=0;

moneyEarns=$((STAKE_MONEY_PER_DAY));

# Gambler plays for a Month and Finds Gambler Luckiest Day and Unluckiest Day.
function gambleGamePlay() { 
	for (( daysCount=1;daysCount<=$TOTAL_DAYS_IN_MONTH;daysCount++ ))
	do
    		intializationNConversionGameProcess
    		checksGamblerConditionsWinOrLost
    		checkGamblerDaysNMoneyWinsOrLostMax
    
    	echo "As the day $daysCount, Gambler starts with cash $tranferStakeMoneyPerDay and at the end he earns $newStakeMoneyPerDay dollars."
	done

echo "Gambler luckiest day was day $winPerDay and the money that win maximum was $collectWinTempRecords"
echo "Gambler Unluckiest day was day $lostPerDay and the money that lost maximum was $collectLostTempRecords"

}

function intializationNConversionGameProcess() {
    tranferStakeMoneyPerDay=$(($newStakeMoneyPerDay+$STAKE_MONEY_PER_DAY));
    stakeGamePercent=$(($((tranferStakeMoneyPerDay))*50/100));
    maxMoneyWinPerDay=$((tranferStakeMoneyPerDay+stakeGamePercent));
    minMoneyLostPerDay=$((tranferStakeMoneyPerDay-stakeGamePercent));
    moneyEarns=$((tranferStakeMoneyPerDay));
}

function checksGamblerConditionsWinOrLost() {
    while [[ $moneyEarns -lt $maxMoneyWinPerDay && $moneyEarns -gt $minMoneyLostPerDay ]]
    do
	gamblerWinsOrLooseGamePerDay
    done
    newStakeMoneyPerDay=$((moneyEarns));
}

function checkGamblerDaysNMoneyWinsOrLostMax() {
    if [[ $tranferStakeMoneyPerDay -lt $moneyEarns ]]
    then
        winsMoney=$(($moneyEarns-$tranferStakeMoneyPerDay))
        maxWinMoneyAndDays
    else
        lostMoney=$(($tranferStakeMoneyPerDay-$moneyEarns));
        maxLostMoneyAndDays
    fi
}

function gamblerWinsOrLooseGamePerDay() {
	gameResult=$(($RANDOM%2));
	if [[ $gameResult -eq 1 ]]
	then
		((moneyEarns++));        
	else
		((moneyEarns--));
    	fi
}

function maxLostMoneyAndDays() {
    if [[ $lostMoney -gt $collectLostTempRecords ]]
    then
        collectLostTempRecords=$(($lostMoney));
        lostPerDay=$((daysCount));
    fi
}

function maxWinMoneyAndDays() {
    if [[ $winsMoney -gt $collectWinTempRecords ]]
    then
        collectWinTempRecords=$((winsMoney))
        winPerDay=$((daysCount)); 
    fi
}

gambleGamePlay
#End with UC6
