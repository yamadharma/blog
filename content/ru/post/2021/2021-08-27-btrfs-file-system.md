---
title: "Файловая система btrfs"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-27T11:33:00+03:00
lastmod: 2021-08-27T11:42:00+03:00
tags: ["sysadm"]
categories: ["computer-science"]
draft: false
slug: "btrfs-file-system"
---

Файловая система btrfs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}


### <span class="section-num">1.1</span> Свойства {#свойства}

-   Копирование при записи (copy on write --- CoW).
-   Поддержка сжатия.
-   Поддержка подтомов.
-   Поддержка дисков SSD.


## <span class="section-num">2</span> Разное {#разное}

-   [Установка Linux на btrfs]({{< relref "2021-05-21-installing-linux-btrfs" >}})
-   [Подтома btrfs]({{< relref "2021-08-27-btrfs-subvolumes" >}})
