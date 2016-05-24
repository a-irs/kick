
# Kick.sh

These are bash scripts to get a freshly installed Arch Linux up and running.

# Prerequisites

Install a new Arch Linux system the following way:

```bash
$ timedatectl set-ntp true
$ cfdisk /dev/sda  # e.g. simple partition layout with one big extended partition, containing 3 partitions for root, home and swap
$ mkfs.btrfs -L root /dev/sda5
$ mkfs.btrfs -L home /dev/sda6
$ mkswap /dev/sda7
$ swapon /dev/sda7
$ mount -o compress=lzo /dev/sda5 /mnt
$ mkdir /mnt/home
$ mount -o compress=lzo /dev/sda6 /mnt/home
$ pacstrap /mnt base
HERE------
$ genstab -L /mnt >> /mnt/etc/fstab
$ arch-chroot /mnt /bin/bash
    ## locale, time
    # pacman -S grub intel-ucode
    # grub-install --target=i386-pc /dev/sda
    # grub-mkconfig -o /boot/grub/grub.cfg
    ## network
    ## hostname
    # passwd
$ unmount -R /mnt
```

# TODO

- <https://github.com/justin8/fabulous/blob/master/fabfile/arch.py>
- laptop: resume.service
- mkinitcpio
- fstab?
- grub? (+ intel-ucode)
- auto setup ssh keys (authorized_keys)
- replace crudini.py
