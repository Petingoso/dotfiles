#!/bin/sh
GTO=/mnt/

doas mount /dev/nvme0n1p3 /mnt
doas mount --types proc /proc /mnt/proc
doas mount --rbind /sys /mnt/sys
doas mount --make-rslave /mnt/sys
doas mount --rbind /dev /mnt/dev
doas mount --make-rslave /mnt/dev
doas mount --bind /run /mnt/run
doas mount --make-slave /mnt/run 
doas test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
doas mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
doas mount /dev/nvme0n1p4  /mnt/home
echo "everything is mounted, chrooting...\n"

doas chroot "$GTO"	/bin/zsh	
