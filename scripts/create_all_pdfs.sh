#/bin/bash

DIR="$( dirname "$0" )"

/usr/bin/find . -name '*.sla' -exec "$DIR/pdf.sh" "{}" \;
