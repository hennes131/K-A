#!/bin/bash
read -p "Ihre Eingabe: " eingabe
wc=`echo $eingabe | wc -c`
echo $wc 

if [[ $eingabe -gt 0 ]]
then 
	echo "Zahl"
elif [[ $eingabe -lt 0 ]]
then 
	echo "Minuszahl"
fi

if [[ $wc -eq 2 ]] || [[ $wc -lt 2 ]]
then 
	echo "Buchstabe"
else
	echo "Wort"
fi
