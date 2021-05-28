---
title: "Установка Linux на btrfs"
date: 2021-05-21T20:38:00+03:00
lastmod: 2021-05-22T14:20:00+03:00
tags: ["sysadmin", "gentoo"]
categories: ["computer-science"]
draft: false
slug: "installing-linux-btrfs"
---

Перенос Gentoo Linux с одного диска на другой. На новом диске делается система btrfs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Исходное состояние системы {#исходное-состояние-системы}

-   Исходно система установлена на LVM:
    -   `/dev/sdb1`: `/boot/EFI`;
    -   `/dev/sdb2`: `/boot`;
    -   `/dev/vgs/root`: `/`;
    -   `/dev/vgs/var`: `/var`;
    -   `/dev/vgs/var_tmp`: `/var/tmp`;
    -   `/dev/vgs/vm`: `/var/vm`;
    -   `/dev/vgs/portage`: `/usr/portage`;
    -   `/dev/vgs/portage_local`: `/usr/local/share/portage`;
    -   `/dev/vgs/portage_com`: `/com/lib/portage`;
    -   `/dev/vgs/home`: `/home`.


## <span class="section-num">2</span> Разбиение диска {#разбиение-диска}

-   Установим тип разбиения в GPT.
-   Разобьём на партиции:
    -   p1 --- 500M, для `EFI`.
    -   p2 --- 500--1024M, для `/boot`.
    -   p3 --- двойная оперативная память, для `swap`.
    -   p4 --- всё остальное для `btrfs`.
-   Создадим файловые системы:
    -   p1 (`EFI`):

        ```shell
        mkfs.vfat -F32 -n EFI /dev/sda1
        ```
    -   p2 (`/boot`):

        ```shell
        mkfs.ext4 -L boot /dev/sda2
        ```
    -   p3 (`swap`):

        ```shell
        mkswap -L swap /dev/sda3
        ```
    -   p4 (`btrfs`)

        ```shell
        mkfs.btrfs /dev/sda4
        ```


## <span class="section-num">3</span> Подготовка раздела с btrfs {#подготовка-раздела-с-btrfs}

-   Подмонтируем раздел с btrfs:

    ```shell
    mkdir /mnt/gentoo
    mount -tbtrfs -orelatime,space_cache,discard,autodefrag,compress=zstd:9 /dev/sda4 /mnt/gentoo/
    ```
-   Создадим подтома на btrfs:

    ```shell
    cd /mnt/gentoo/
    btrfs subvol create @
    btrfs subvol create @var
    btrfs subvol create @var_tmp
    btrfs subvol create @vm
    btrfs subvol create @portage
    btrfs subvol create @portage_local
    btrfs subvol create @portage_com
    ```


## <span class="section-num">4</span> Копирование существующих файловых систем {#копирование-существующих-файловых-систем}

-   Создадим точку монтирования:

    ```shell
    mkdir /mnt/from
    ```
-   Подмонтируем и скопируем root-партицию:

    ```shell
    mount /dev/vgs/root /mnt/from/
    rsync -av -HS --delete /mnt/from/ /mnt/gentoo/@
    umount /mnt/from/
    ```
-   Подмонтируем и скопируем `/var`:

    ```shell
    mount /dev/vgs/var /mnt/from/
    rsync -av -HS --delete /mnt/from/ /mnt/gentoo/@var
    umount /mnt/from/
    ```
-   Подмонтируем и скопируем `portage`:

    ```shell
    mount /dev/vgs/portage /mnt/from/
    rsync -av -HS --delete /mnt/from/ /mnt/gentoo/@portage
    umount /mnt/from/
    ```
-   Подмонтируем и скопируем `portage_local`:

    ```shell
    mount /dev/vgs/portage_local /mnt/from/
    rsync -av -HS --delete /mnt/from/ /mnt/gentoo/@portage_local
    umount /mnt/from/
    ```
-   Подмонтируем и скопируем `/boot`:

    ```shell
    mkdir /mnt/to/
    mount /dev/sda2 /mnt/to
    mount /dev/sdb2 /mnt/from/
    rsync -av -HS --delete /mnt/from/ /mnt/to/
    umount /mnt/to
    umount /mnt/from
    ```


## <span class="section-num">5</span> Установка загрузчика {#установка-загрузчика}

-   Перемонтируем файловую систему `btrfs`:

    ```shell
    umount /mnt/gentoo
    mount -tbtrfs -orelatime,space_cache,discard,autodefrag,compress=zstd:9,subvol=@ /dev/sda4 /mnt/gentoo/
    mount -tbtrfs -orelatime,space_cache,discard,autodefrag,compress=zstd:9,subvol=@var /dev/sda4 /mnt/gentoo/var
    mount -tbtrfs -orelatime,space_cache,discard,autodefrag,compress=zstd:9,subvol=@var_tmp /dev/sda4 /mnt/gentoo/var/tmp
    mount /dev/sda2 /mnt/gentoo/boot/
    mount /dev/sda1 /mnt/gentoo/boot/efi
    ```
-   Подмонтируем псевдо-файловые системы:

    ```shell
    mount -o bind /dev /mnt/gentoo/dev/
    mount -o bind /proc /mnt/gentoo/proc/
    mount -o bind /sys /mnt/gentoo/sys/
    mount -o bind /run /mnt/gentoo/run/
    ```
-   Установим загрузчик:

    ```shell
    cd /mnt/gentoo/
    chroot /mnt/gentoo/ /bin/bash
    grub-install /boot/
    grub-mkconfig -o /boot/grub/grub.cfg
    ```


## <span class="section-num">6</span> Создадим файл монтирования fstab {#создадим-файл-монтирования-fstab}

-   Узнаем идентификатор партиции с файловой системой btrfs:

    ```shell
    blkid /dev/sda4
    ```
-   Получим строчку:

    ```shell
    UUID="<uuid_number>"
    ```
-   Создадим файл `/mnt/gentoo/etc/fstab`

    ```conf-unix
    LABEL="boot-m2"					/boot		ext4	relatime,discard					1 1
    LABEL="EFI-M2"					/boot/efi	vfat	defaults,discard					0 0
    LABEL="swap-m2"					none		swap	sw							0 0
    UUID="<uuid_number>"	/		btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@	0 0
    UUID="<uuid_number>"	/var		btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@var	0 0
    UUID="<uuid_number>"	/var/tmp	btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@var_tmp	0 0
    UUID="<uuid_number>"	/var/vm		btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@vm		0 0
    UUID="<uuid_number>"	/home		btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@home	0 0
    UUID="<uuid_number>"	/usr/portage	btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@portage	0 0
    UUID="<uuid_number>"	/usr/local/share/portage	btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@portage_local	0 0
    UUID="<uuid_number>"	/com/lib/portage	btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@portage_com	0 0
    ```


## <span class="section-num">7</span> Копирование специальных файловых систем {#копирование-специальных-файловых-систем}

-   Для образов виртуальных машин следует отключить CoW (copy-on-write).
-   Подмонтируем файловую систему `btrfs`:

    ```shell
    mount -tbtrfs -orelatime,space_cache,discard,autodefrag,compress=zstd:9,subvol=@vm /dev/sda4 /mnt/gentoo/var/vm
    ```
-   Отключим для этого подтома CoW:

    ```shell
    cd /mnt/gentoo/var/
    chattr +C vm
    ```
-   Скопируем файлы:

    ```shell
    mount /dev/vgs/vm /mnt/from/
    rsync -av -HS --delete /mnt/from/ /mnt/gentoo/var/vm
    umount /mnt/from/
    ```


## <span class="section-num">8</span> Backlinks {#backlinks}

-   [Системное администрирование]({{< relref "2021-04-10-system-administration" >}})
