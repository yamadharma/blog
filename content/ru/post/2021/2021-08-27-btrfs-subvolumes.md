---
title: "Подтома btrfs"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-27T11:41:00+03:00
lastmod: 2021-08-27T12:10:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "btrfs-subvolumes"
---

Подтома (subvolumes) btrfs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Именование подтомов {#именование-подтомов}

-   Для определённости я называю подтома по шаблону `@имя_подтома`.
-   При установки системы я создаю подтома следующим образом:
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


## <span class="section-num">2</span> Монтирование подтомов в fstab {#монтирование-подтомов-в-fstab}

-   При монтировании я указываю универсальный идентификатор (UUID) файловой системы:

    ```conf-unix
    # /etc/fstab
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /               btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@    0 0
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /var            btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@var 0 0
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /var/tmp        btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@var_tmp     0 0
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /var/vm         btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@vm          0 0
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /home           btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@home        0 0
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /usr/portage    btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@portage     0 0
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /usr/local/share/portage        btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@portage_local       0 0
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"     /com/lib/portage        btrfs   relatime,discard,autodefrag,compress=zstd:9,subvol=@portage_com 0 0
    ```
-   Идентификатор файловой системы можно узнать следующим образом:

    ```shell
    blkid /dev/sda4
    ```


## <span class="section-num">3</span> Создание нового подтома {#создание-нового-подтома}

-   После установки системы может возникнуть необходимость создания дополнительных подтомов на существующем томе.

    ```shell
    mkdir /mnt/btrfs
    mount UUID=f8963df3-1320-4bc0-a125-62be185b029e /mnt/btrfs
    btrfs subvolume create /mnt/btrfs/@data
    ```
-   Подключим в `/etc/fstab`:

    ```shell
    UUID="f8963df3-1320-4bc0-a125-62be185b029e"	/data		btrfs	relatime,discard,autodefrag,compress=zstd:9,subvol=@data        0 0
    ```
