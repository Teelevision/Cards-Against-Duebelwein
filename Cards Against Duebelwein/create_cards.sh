#!/bin/bash

# run this script in the directory where you have your "white.txt", "black.txt" and the "templates" directory containing the "white.sla" and "black.sla"
#############


#############
### WHITE ###
#############

# create dir for the white cards
mkdir white

# this is the line we replace in the template
TPL_LINE='<ITEXT FONT="Roboto Bold" FONTSIZE="12" FCOLOR="Black RGB" KERN="-1.5" wordTrack="1" CH="Cards Against Dübelwein"/>'

# loop through lines in the white.txt
while read -u 10 LINE; do

	# remove those chars from the string: /\*"|<>:?
	TEXT="${LINE//[\/\\\*\"\|<>:\?]/_}"
	# remove "."s at the end
	TEXT="$( echo "$TEXT" | sed 's/\.*$//' )"
	
	mkdir "./white/$TEXT"
	
	# number at the beginning
	NUMBER="$( echo "$LINE" | sed -r 's/^([0-9][0-9][0-9]) .+$/\1/' )"
	LINE="$( echo "$LINE" | sed 's/^[0-9][0-9][0-9] //' )"
	
	# escape chars that don't work with .sla files
	LINE="${LINE//&/\&amp;}"
	LINE="${LINE//\"/\&quot;}"
	LINE="${LINE//</\&lt;}"
	
	# escape "|" for sed
	LINE="${LINE//[\|]/\|}"
	
	# this is the line we replace the other line in the template with
	TPL_NEW_LINE="<ITEXT FONT=\"Roboto Bold\" FONTSIZE=\"18\" FCOLOR=\"Black RGB\" KERN=\"-1.5\" wordTrack=\"1\" CH=\"$LINE\"/>"
	
	# write the .sla file
	cat ./templates/white.sla | sed "s|$TPL_LINE|$TPL_NEW_LINE|" | sed "s/(000)/($NUMBER)/" > "./white/$TEXT/card.sla"
	
done 10<white.txt

#############
### BLACK ###
#############

# create dir for the black cards
mkdir black

# this is the line we replace in the template
TPL_LINE='<ITEXT FONT="Roboto Bold" FONTSIZE="18" FCOLOR="White RGB" KERN="-1.5" wordTrack="1" CH="Dübelwein is a great place for ______________."/>'

# loop through lines in the black.txt
while read -u 10 LINE; do

	# remove those chars from the string: /\*"|<>:?
	TEXT="${LINE//[\/\\\*\"\|<>:\?]/_}"
	# remove "."s at the end
	TEXT="$( echo "$TEXT" | sed 's/\.*$//' )"
	
	mkdir "./black/$TEXT"
	
	# number at the beginning
	NUMBER="$( echo "$LINE" | sed -r 's/^([0-9][0-9][0-9]) .+$/\1/' )"
	LINE="$( echo "$LINE" | sed 's/^[0-9][0-9][0-9] //' )"
	
	# escape chars that don't work with .sla files
	LINE="${LINE//&/\&amp;}"
	LINE="${LINE//\"/\&quot;}"
	LINE="${LINE//</\&lt;}"
	
	# escape "|" for sed
	LINE="${LINE//[\|]/\|}"
	
	# this is the line we replace the other line in the template with
	TPL_NEW_LINE="<ITEXT FONT=\"Roboto Bold\" FONTSIZE=\"18\" FCOLOR=\"White RGB\" KERN=\"-1.5\" wordTrack=\"1\" CH=\"$LINE\"/>"
	
	# write the .sla file
	cat ./templates/black.sla | sed "s|$TPL_LINE|$TPL_NEW_LINE|" | sed "s/(000)/($NUMBER)/" > "./black/$TEXT/card.sla"
	
done 10<black.txt

