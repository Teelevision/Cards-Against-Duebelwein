#!/bin/sh
#
# This script uses ImageMagick to render a black card PDF to PNG at 1644x2244 px.
#

FILE="$1"

convert -density 1200 -resize 50% -colorspace RGB -background black -gravity center -extent 1644x2244 -quality 100% "$FILE" "${FILE%.*}.png"
