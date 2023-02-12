#most frequent ending
cat /usr/share/dict/words |\
grep ^.*a.*a.*a.*[^\'s]$ |\
# parenthesis need escape
sed -e 's/^\(.*\)\([a-z][a-z]\)$/\2/g' |\
sort |\
uniq -c |\
sort -nk1,1 |\
tail -n3 |\
tac |\
awk '{print $2}'

#how many combations
cat /usr/share/dict/words |\
grep ^.*a.*a.*a.*[^\'s]$ |\
sed -e 's/^\(.*\)\([a-z][a-z]\)$/\2/g' |\
sort |\
uniq -c |\
wc -l

cat /usr/share/dict/words |\
grep ^.*a.*a.*a.*[^\'s]$ |\
sed -e 's/^\(.*\)\([a-z][a-z]\)$/\2/g' |\
{ sort; echo {a..z}{a..z} | tr " " "\n"; } |\
sort |\
uniq -c |\
grep "^ *1 ..$" |\
awk '{print $2}'