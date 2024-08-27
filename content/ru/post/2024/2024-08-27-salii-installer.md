---
title: "Система установки SALII"
author: ["Dmitry S. Kulyabov"]
date: 2024-08-27T19:25:00+03:00
lastmod: 2024-08-27T20:33:00+03:00
draft: false
slug: "salii-installer"
---

Система установки SALII.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/yamadharma/salii>
-   Форк проекта SALI (см. [Система установки SALI]({{< relref "2024-08-27-sali-automatic-linux-installer" >}}))
-   Вызвано необходимостью настройки и установки не только Linux, но и Windows.
-   Название:

    > Салии (лат. Salii ← salio «прыгаю, пляшу») — в Древнем Риме жреческая коллегия, состоявшая из 12 жрецов бога Марса и 12 жрецов бога Квирина.
    >
    > Своё название салии получили от военной пляски, совершавшейся ими во время ежегодных празднеств в честь Марса. Также существовала версия о происхождении названия от имени Салия, который якобы научил этой пляске. Салии охраняли двенадцать щитов --- анкилов, среди которых один, по легенде, упал с неба, а остальные одиннадцать были точными его копиями. Были также палатинские салии.


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Дополнительное программное обеспечение {#дополнительное-программное-обеспечение}

-   Установите opentracker.
-   [bittorrent. Трекер opentracker]({{< relref "2024-01-31-bittorrent-opentracker" >}})


### <span class="section-num">2.2</span> Предварительное программное обеспечение {#предварительное-программное-обеспечение}

-   Необходимо
    -   netifaces
    -   paramiko
    -   transmission_rpc
-   Установка:
    ```shell
    dnf install python3-netifaces python3-paramiko python3-pip
    pip install "transmission-rpc<4.0.0"
    dnf install transmission-daemon transmission-cli rsync rsync-daemon
    ```


### <span class="section-num">2.3</span> SELinux {#selinux}

-   Настроим SELinux:
    ```shell
    setsebool rsync_export_all_ro 1
    setsebool rsync_export_all_ro 1 -P
    ```
