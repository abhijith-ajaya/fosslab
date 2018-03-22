
pdftotext -layout $1 - | grep -A 1 MDL16CS | sed 's/--//;s/\o14//g' >cs
sed '/^\s*$/d' cs >temp  # to remove the space problem at page ending
mv temp cs
linecount=0
case $2 in
 1) credits=( 4 4 3 3 3 3 1 1 1 );totcredit=23;;
 2) credits=( 4 4 3 1 1 4 3 3 1 );totcredit=24;;
 *) credits=( 4 4 3 3 3 3 1 1 1 );totcredit=23;;
esac
while read -r line
do
   linecount=$(( $linecount+1 ))
   for word in $line; do
     if [[ $word == MDL16CS* ]];then reg=$word;subcount=0;scg=0;cgp=0
     else
          grade=$( echo $word | cut -d "(" -f2 | cut -d ")" -f1 )
          case $grade in
            O)  gp=10   ;;
            A+) gp=9    ;;
            A)  gp=$(bc -l <<< 8.5) ;;
            B+) gp=8    ;;
            B)  gp=7    ;;
            C)  gp=6    ;;
            P)  gp=5    ;;
            *)  gp=0    ;;
          esac
          cr=${credits[$(( subcount++ ))]}
          scg=$(bc -l <<< $scg+$gp*$cr )
          cgp=$(bc -l <<< $scg/$totcredit );
    fi

   done
  if [[ $(( $linecount%2 )) -eq 0 ]];then echo $reg $cgp;fi
done < cs
rm cs
