rm -f macro.sh
touch macro.sh
echo 'function macro() {' >> macro.sh
echo 'currentPos=$(pwd)' >> macro.sh
echo 'echo $currentPos > /tmp/tmp_pos' >> macro.sh
echo '}' >> macro.sh

rm -f polo.sh
touch polo.sh
echo 'function polo() {' >> polo.sh
echo 'tmp_pos="$(cat /tmp/tmp_pos)"' >> polo.sh
echo 'cd "$tmp_pos"' >> polo.sh
echo '}' >> polo.sh

source macro.sh
source polo.sh