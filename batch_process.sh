# provide a file path as parameter, provided file is lines of data, slice lines 
# by batch size, and concat each line via ',', then do the iteration

# slice
let size=200
lines=`sed -n '$=' $1`
echo "total $lines lines"
let batch=($lines-1)/$size+1
echo "$batch"

#iteration
for ((i=1; i<=$batch; i++))
do
    let start=($i-1)*$size+1
    let end=$i*$size
    echo "from $start to $end"
    # 
    ids=`sed -n "${start},${end}p" $1 | sed 's/$/,/' | tr -d '\n' | sed 's/.$//'`
    #echo $ids
    // some process
done
