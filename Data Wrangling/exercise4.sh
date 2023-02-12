journalctl |\
grep "systemd.*: Startup" |\
sed -e "s/^.* = \(.*\).$/\1/g" |\
sed -e "s/^.*in \(.*\).$/\1/g" |\
sed -e "s/^\(.*\)ms$/\1/g" |\
sed -e "s/^\(.*\)s$/\1*1000/g" |\
bc |\
R --salve -e 'x <- scan(file="stdin", quiet=TRUE); summary(x)'
