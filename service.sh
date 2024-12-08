KERNELVERSION="6.6.63-1-lts"
cd /opt/turbo-fan

rm /dev/acer-gkbbl-0 /dev/acer-gkbbl-static-0 -f

if [ "$(uname -r)" != "$KERNELVERSION" ]; then
	make clean
    source install.sh
	sed -i "s/^KERNELVERSION.*/KERNELVERSION=\"$(uname -r)\"/" service.sh
else
	rmmod acer_wmi
	rmmod facer
	modprobe wmi
	modprobe sparse-keymap
	modprobe video
	insmod src/facer.ko
fi
