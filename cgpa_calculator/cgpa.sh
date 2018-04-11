sg=./sgpa.sh
$sg $1 1 > tmp1
$sg $2 2 > tmp2
join tmp1 tmp2 > tmp3
while read -r line
do
 for word in $line;do
   if [[ $word == MDL16CS* ]];then count=0
   else
     if [[ count -eq 0 ]];then s1=$(bc -l <<< $word);count=1;continue;fi
     s2=$(bc -l <<< $word)
     cgp=$(bc <<< 'scale=2;'$s2*24+$s1*23)
     cgp=$(bc <<< 'scale=2;'$cgp/47)
     echo $line $(bc <<< 'scale=2;'$cgp) >> tmp4	
   fi
 done
done < tmp3
echo "SNO REGNO CGPA NAME" | awk '{printf"%-3s %-10s %-4s %s\n",$1,$2,$3,$4}'
join -1 1 -2 6 tmp4 c4b.txt | awk '{printf "%-3s %s %s %s %s %s %s\n",$5,$1,$4,$10,$11,$12,$13}'
rm tmp*
