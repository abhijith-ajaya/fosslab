
c='y'
while [ $c != 'n' ]

do
clear

echo 				calculator
echo 			------------------------

echo 1.Addition
echo 2.subtraction
echo 3.multiplication
echo 4.diviion
echo enter the choice:
read choice
echo enter the two numbers:
read a
read b
case $choice in
1) ans=$(( a+b ));;
2) ans=$(( a-b ));;
3) ans=$(( a*b ));;
4) ans=$(( a/b ));;
*) echo enter the correct option;;
esac
echo answer $ans
echo "do you want to do another calculation (y/n)"
read c
done
