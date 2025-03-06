---
title: "Windows. Установка в kvm"
author: ["Dmitry S. Kulyabov"]
date: 2024-05-29T19:46:00+03:00
lastmod: 2025-03-06T17:08:00+03:00
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
-   Скачаем драйвера для qemu:
    ```shell
    wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso
    ```
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


## <span class="section-num">4</span> Общая папка {#общая-папка}

-   Будем использовать встроенный метод создания общей папки с помощью _virt-manager_.
-   Нажмите на значок с надписью _Показать виртуальное оборудование_ (_Show virtual hardware details_) на панели инструментов.
-   Нажмите _Память_ (_Memory_) на левой панели.
    -   Проверьте, что выбрана опция _Включить общую память_ (_Enable shared memory_).
    -   Нажмите _Применить_.
-   Внизу нажмите _Добавить оборудование_ (_Add hardware_).
    -   Выберите _Файловая система_ (_File system_) на левой панели в окне добавления нового оборудования.
    -   Затем выберите _Driver=virtiofs_ на вкладке Подробности.
    -   Нажмите на _browse &gt; browse local_ и выберите путь к хосту из вашей системы Linux.
    -   В целевом пути укажите любое имя.
-   Установите в системе Windows WinFSP (FUSE для Windows).
    -   Можно скачать с сайта <https://github.com/winfsp/winfsp/releases/>.
    -   Можно установить с Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})):
        ```shell
        choco install winsfp
        ```
-   Установите `virtio-win-guest-tools.exe`.
    -   Возьмите из комплекта `virtio-win.iso` или скачайте напрямую из <https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/>.
    -   После завершения установки перезагрузите виртуальную машину Windows.
-   Откройте меню "Пуск" и найдите "Службы".
    -   Найдите службу _Служба VirtIO-FS_ (_VirtIO-Sevice-FS_).
    -   Щелкните правой кнопкой мыши и нажмите "Запустить", чтобы запустить службу.
    -   Можно запустить из командной строки:
        ```shell
        sc start VirtioFsSvc
        ```
    -   Установите её на автозапуск (VirtIO-Sevice-FS &gt; Properties &gt; Startup type &gt; Manual to Automatic).
-   После запуска службы откройте Проводник, и вы должны увидеть метку монтирования, которую вы создали в первом шаге выше, и которая должна быть отображена как диск `Z:`.


## <span class="section-num">5</span> Буфер обмена {#буфер-обмена}

-   Проверьте, что есть Канал (spice) типа `spicevmc`.
-   Установите в Windows _SPICE Guest Tools_ : <https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-latest.exe>.
