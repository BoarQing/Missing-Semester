journalctl -U "1 days ago" -S "2 day ago" |\
grep COMMAND |\
grep USER=root