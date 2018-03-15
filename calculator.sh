clear
echo ............simple calulator...........
i='y'
while [ $i ='y']
do
echo "enter the first number:"
read n1
echo "enter the second number:"
read n2
echo 
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplicaion"
echo "4. Division"
echo "choice?"

case $choice in 
1) ans= 'expr $n1+$n2
2) ans= 'expr $
