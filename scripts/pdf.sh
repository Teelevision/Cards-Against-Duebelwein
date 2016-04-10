#/bin/bash

DIR="$( dirname "$0" )"

SLA="$1"
PDF="${SLA%.sla}.pdf"

if [ "$SLA" -nt "$PDF" ]; then
	echo -n "Creating $PDF ... "
	"C:\Program Files\Scribus 1.5.2.svn\Scribus.exe" "$1" -g -py $DIR/lib/to-pdf.py
	echo "done."
else
	echo "Skip: $PDF does not neet to be created."
fi

