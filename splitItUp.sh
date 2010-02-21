#!/bin/bash

# This is a simple script to slice Images from the Ricoh Caplio G4.
# This camera can do some Images with several images in one.
# So i wrote a little script to slice them.
# This script relies on ImageMagick.
# 
# With another sript createVideo.sh you can make an animation from this slices.
# 
# Image file format is 2048x1536 pixel.
# Consist of 4x4 Images

# left side Border is 12 pixel
# top border is 7 pixel
# right border is 12 pixel 
# bottom border is 7 pixel

# middle vertical borders are 8 pixel
# middle horizontal borders are 6 pixel

# so its like this: 500x376 for every subimage
# | Image | Image | Image | Image |
# 12 500 8 500 8 500 8 500 12 = 2048
#
# _______ 7
# Image   376
# ------- 6
# Image   376
# ------- 6
# Image   376
# ------- 6
# Image   376
# ------- 7
# = 1536

imageHeight=376
imageWidth=500
rowCount=4
columnCount=4

xOffsetInitial=12
yOffsetInitial=7
xOffset=8
yOffset=6

xOff=$xOffsetInitial
yOff=$yOffsetInitial
count=1

echo "Bash version is ${BASH_VERSION}..."
for ((row=1;row<=$rowCount;row++))
do


	for ((column=1;column<=$columnCount;column++))
	do
		convert $1 -crop 500x376+$xOff+$yOff +repage images/schnitzel`printf "%02d" $count`.jpg
		xOff=$[$xOffset+$xOff+$imageWidth]
		count=$[$count+1]
	done
	xOff=$xOffsetInitial
	yOff=$[$yOff+$yOffset+$imageHeight]
done 




