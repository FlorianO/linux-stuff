#!/bin/bash

mencoder mf://images/schnitzel*.jpg -mf w=500:h=376:fps=10:type=jpg -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o mpeg4.avi

