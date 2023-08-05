---
title: "Восстановление btrfs"
author: ["Dmitry S. Kulyabov"]
date: 2023-07-21T16:56:00+03:00
lastmod: 2023-07-21T16:58:00+03:00
tags: ["sysadmin", "btrfs"]
categories: ["computer-science"]
draft: false
slug: "btrfs-recovery"
---

Восстановление btrfs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Предварительная подготовка {#предварительная-подготовка}

-   Подготовьте флеш-диск (см. [Загрузочная флешка]({{< relref "2021-04-10-bootable-usb-stick" >}}))
-   Поместите на него образ SystemRescueCD.


## <span class="section-num">2</span> Восстановление {#восстановление}

-   Загружаемся с внешнего устройства.
    -   При загрузке с SystemRescueCD лучше выбрать пункт `copy system to RAM`.
-   Запускаем восстановление файловой системы на партиции:
    ```shell
    btrfs check --repair /dev/nvme0n1p4
    ```
-   Запускаем проверку блоков:
    ```shell
    mount /dev/nvme0n1p4 /mnt
    btrfs scrub start -Bd /mnt
    ```
