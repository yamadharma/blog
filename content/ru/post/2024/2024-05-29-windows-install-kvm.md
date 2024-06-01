---
title: "Windows. Установка в kvm"
author: ["Dmitry S. Kulyabov"]
date: 2024-05-29T19:46:00+03:00
lastmod: 2024-05-30T16:10:00+03:00
tags: ["windows", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "windows-install-kvm"
---

Установка Windows на KVM.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Пререквизиты {#пререквизиты}

-   Рекомендуется использовать драйвера Virtio для Windows.
-   Работа через устройства Virtio осуществляется быстрее, чем через эмуляцию SCSI и т.д.
-   Gentoo:
    ```shell
    emerge app-emulation/virtio-win
    ```
-   Можно просто скачать с репозитория:
    -   <https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md>
-   Проще всего использовать образ iso-диска и подмонтировать его как второй cdrom.


## <span class="section-num">2</span> Установка Windows {#установка-windows}

-   Можно устанавливать с помощью какого-либо графического интерфейса управления qemu, например с помощью virt-manager:
-   Gentoo:
    ```shell
    emerge app-emulation/virt-manager
    ```
-   При установке следует выбрать пункт о дополнительной конфигурации перед установкой.
-   На этом этапе следует добавить второй виртуальный cdrom с драйверами virtio-win.
-   У жёсткого диска установите шину VirtIO.


## <span class="section-num">3</span> После установки {#после-установки}

-   Поменяйте в настройках типы устройств:
    -   сетевую карту на Virtio;
    -   видео: QXL.
-   Установите сертификат RedHat с CD-диска.
-   Установите драйвера Virtio.
