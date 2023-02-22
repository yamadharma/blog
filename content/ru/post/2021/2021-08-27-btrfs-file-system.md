---
title: "Файловая система btrfs"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-27T11:33:00+03:00
lastmod: 2023-02-20T13:35:00+03:00
tags: ["btrfs", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "btrfs-file-system"
---

Файловая система _Btrfs_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}


### <span class="section-num">1.1</span> Свойства {#свойства}

-   Копирование при записи (copy on write --- CoW).
    -   Все копии файла суммарно занимают на диске столько же места сколько оригинал, а при изменениях файлов данные всегда пишутся в новые страницы.
-   Снапшоты.
    -   Можно делать снимки состояния подтома на лету, а потом вернуть это состояние, например, после неудачного обновления или удаления чего-то нужного, просто отредактировав `/etc/fstab` и выполнив `mount -o remount mountpoint`.
    -   Для автоматического создания снапшотов можно использовать утилиту `snapper`.
-   Поддержка сжатия.
-   Поддержка подтомов.
    -   Вместо разделов предпочтительно использовать подтома.
    -   Подтома имеют динамический размер.
    -   Снапшоты являются по сути подтомами.
-   Поддержка дисков SSD.


## <span class="section-num">2</span> Разное {#разное}

-   [Перенос Linux на btrfs]({{< relref "2021-05-21-installing-linux-btrfs" >}})
-   [Подтома btrfs]({{< relref "2021-08-27-btrfs-subvolumes" >}})
-   [Обслуживание btrfs]({{< relref "2021-09-23-btrfs-maintenence" >}})
-   [Дедупликация файловой системы btrfs]({{< relref "2022-05-26-deduplication-btrfs-filesystem" >}})


## <span class="section-num">3</span> Необходимое программное обеспечение {#необходимое-программное-обеспечение}


### <span class="section-num">3.1</span> btrfs-progs {#btrfs-progs}

-   Утилиты для работы с _btrfs_.
-   Установка
    -   Gentoo
        ```shell
        emerge sys-fs/btrfs-progs
        ```


### <span class="section-num">3.2</span> btrfsmaintenance {#btrfsmaintenance}

-   Скрипт для регулярного обслуживания файловой системы _btrfs_
-   Установка
    -   Gentoo
        ```shell
        emerge sys-fs/btrfsmaintenance
        ```


### <span class="section-num">3.3</span> snapper {#snapper}

-   Управление снапшотами
-   Установка
    -   Gentoo
        ```shell
        emerge app-backup/snapper
        ```
