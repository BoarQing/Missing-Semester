x=0
failOutputFileName="rare_fail.log"

while true
do
    bash rare_fail.sh >> $failOutputFileName 2>> $failOutputFileName
    if [[ $? -ne 0 ]]; then
        break
    fi
    x=$(( x + 1 ))
done
echo "$x iteration" >> $failOutputFileName 