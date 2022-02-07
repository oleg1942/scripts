echo "update disk info"
echo 1 > /sys/class/scsi_device/0\:0\:0\:0/device/rescan >dev/null
echo "EXTENDED partition resize"
parted /dev/sda resizepart 2 100% >/dev/null
sleep 5
echo "LVM partition resize"
parted /dev/sda resizepart 5 100% >/dev/null
sleep 5
echo "PV partition resize"
pvresize /dev/sda5 >/dev/null
sleep 4
echo "LVM partition resize"
lvextend -l +100%FREE /dev/mapper/debian--vg-root >/dev/null
sleep 2
echo "Debian-ROOT partition resize"
resize2fs /dev/mapper/debian--vg-root >/dev/null
df -h
echo "DONE!!! by Oleg1942"
