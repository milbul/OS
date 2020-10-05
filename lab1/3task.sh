#!/bin/bash

echo "Меню"
echo "1) открыть nano"
echo "2) открыть vi"
echo "3) открыть links"
echo "4) выйти"

read input

while true; do
case $input in
1) nano ;;
2) vim ;;
3) links ;;
4) exit 0 ;;
*) echo "такого варианта нет, попробуйте еще раз" ;;
esac
read input
done


