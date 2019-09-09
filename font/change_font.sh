FILE=$1
FONT=$2
#PATH="~/bck/"
CURRENT_FONT=\"$(cat ~/.Xresources | grep URxvt.font)\"
echo "Current font: "
echo $CURRENT_FONT
input="font_list"
echo "Input file: "
echo $input
echo "File to be changed: "
echo $1
echo "Font to be changed: "
echo $2

echo "All fonts in the input file: "
while IFS= read -r line 
do
  echo "$line"
  font_array+=($line)
done < "$input"


echo "Contents of fonts array: "
echo ${font_array[@]}
echo ${font_array[0]}

for i in ${font_array[@]}
do
  echo "$i"
  if [ "$CURRENT_FONT" != "$i"  ]; then
    sed -i "/URxvt.font/c$i" $1
    break
  else
    echo "Try again."
  fi
done
echo "Contents of the original file: "
cat $1
