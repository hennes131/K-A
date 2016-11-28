#!/bin/bash
if [[ $1 ]]
then
	eingabe=$1
else
	read -p "Mach Eingabe du:" eingabe
	while [[ $eingabe != "q" ]] && [[ ! -e $eingabe ]] 
	do
	        read -p "Mach Eingabe du:" eingabe
	        echo $eingabe
	done	
fi
if [[ -e $eingabe ]]
then
	echo "Der Eintrag ist vorhanden: $eingabe"	
else
	echo "Die Datei ist nicht vorhanden!"
	echo $eingabe
fi

#Erstellen Sie ein Skript, das einen Parameter entgegennimmt und checkt ob es eine Datei gibt, die so heißt wie der übergebene Parameter.
#Aufruf: ./test.sh test.txt
#Erweiterung: Die Eingabeaufforderung soll solange gezeigt werden, bis der Benutzer ein q eingibt, oder einen vorhandenen Dateinamen.