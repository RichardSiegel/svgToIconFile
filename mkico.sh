#!/bin/bash

# Enter SVG-Filename and autorun-icon-set is created as autorun.inf and .data
# Enter ISO-Filename and autorun-icon-set is moved into ISO
# Enter Keyword ico last to create ICO-File in current dir

echo "About to create: .ico, .inf and .png (w: 1024)"
echo "Enter disk NAME for files and autorun.inf file:"
read discName
mkdir .data
mkdir .tmp.mkico
largeSize=256;
baseFile=".tmp.mkico/"$largeSize".ico"
inkscape -z -w $largeSize -h $largeSize $1 -e $baseFile
sleep 1;
initsize=$((largeSize/2));
size=$initsize;
while [ $size != 8 ]
do
	if [ $size == 64 ]; then nextSize=48; else nextSize=$size; fi
	convert $baseFile -compress None -scale $nextSize ".tmp.mkico/"$nextSize".ico"
	size=$((size/2))
done

convert .tmp.mkico/* -compress None .data/$discName.ico
rm ".tmp.mkico/"$largeSize".ico"
#rm ".tmp.mkico/"$initsize".ico"
convert .tmp.mkico/* -compress None .data/$discName-web.ico
if [ $2 == "ico" ];
then
     mv .data/$discName.ico .
     rm -r .data .tmp.mkico
else
     echo "[autorun]" > autorun.inf
     echo icon=.data/$discName.ico >> autorun.inf
     echo label=$discName >> autorun.inf

     #sleep 1
     rm -r .tmp.mkico

     inkscape -z -w 1024 $1 -e .data/$discName.png
     cp $1 .data/$discName.svg

     if [ $2 != "" ];
     then file-roller .data autorun.inf -add $2
          if [ $3 == "ico" ]; then mv .data/$discName.ico .; fi
          rm -r .data autorun.inf
     else echo
          echo no ISO to insert autorun.inf and .data folder !!!
     fi
echo
echo .svg or .png files for the label are not included in .data
fi
