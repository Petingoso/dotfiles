#!/bin/sh
GTO=/mnt 
PART=nvme0n1p4

doas mount /dev/$PART /$GTO
doas mount --types proc /proc /$GTO/proc
doas mount --rbind /sys /$GTO/sys
doas mount --make-rslave /$GTO/sys
doas mount --rbind /dev /$GTO/dev
doas mount --make-rslave /$GTO/dev
doas mount --bind /run /$GTO/run
doas mount --make-slave /$GTO/run 
doas test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
doas mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
doas mount /dev/$PART  /$GTO/home
echo "everything is mounted, chrooting...\n"

doas chroot "$GTO"	/bin/bash	
