echo "kernel name : $(uname -s) "
echo "kernel release: $(uname -r)"
echo "kernel version :$(uname -v)"
echo "operating systems :$(uname -o)"
echo "available shells: $(cat /etc/shells)"
echo "CPU information: $(lscpu)"
echo "memory usage  $(free -m)"
echo "partition table : $(lsblk)"
echo mount volume list loading
sleep 3
echo "mounted volume : $(cat /proc/mounts | less)"
