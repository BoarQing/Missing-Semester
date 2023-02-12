journalctl --list-boots |\
tail -n3 |\
sed -e "s/^.* \(.*\) ... .*$/\1/g" |\
{ head -n1 | xargs journalctl -b --boot | sed -e "s/^.* .* [0-9][0-9]:[[0-9][0-9]:[0-9][0-9] .*: \(.*\)/\1/g" | sort | uniq ; \
  head -n2 | tail -n1 | xargs journalctl -b --boot | sed -e "s/^.* .* [0-9][0-9]:[[0-9][0-9]:[0-9][0-9] .*: \(.*\)/\1/g" | sort | uniq; \
  head -n3 | tail -n1 | xargs journalctl -b --boot | sed -e "s/^.* .* [0-9][0-9]:[[0-9][0-9]:[0-9][0-9] .*: \(.*\)/\1/g" | sort | uniq; } |\
sort |\
uniq -c |\
awk '{if ($1 == 3) print $0}' |\
awk '{$1 = ""; print $0}'