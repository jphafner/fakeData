#!/usr/bin/bash

if ! [[ ${1} ]] || [[ $# -gt 1 ]]; then
    echo "  Bad argument ORDER"
    echo "  Syntax: $(basename $0) [number fake data]"
    exit 1
fi

# Script to generate and print n bingo cards
n=${1}

for ((i=1;i<=n;i++))
do
    latexmk -lualatex fakeData.tex
    mv fakeData.pdf ${i}.pdf
    file+="${i}.pdf "
done
latexmk -c

pdfjoin $file
rm $file

echo "pdfnup --nup 2x2 --papersize '{11in,8.5in}' --frame true ${n}-joined.pdf"
      pdfnup --nup 2x2 --papersize '{11in,8.5in}' --frame true ${n}-joined.pdf

#echo "rm ${n}-joined.pdf"
#      rm ${n}-joined.pdf

#echo "rm temp.pdf"
#      rm temp.pdf

#echo "mv temp-nup.pdf printData.pdf"
#      mv temp-nup.pdf printData.pdf


#echo $file
#pdfjoin $file

#for ((i=1; i<=n; i++))
#do
#    rm ${i}.pdf
#done

