---
title: "Обслуживание btrfs"
author: ["Dmitry S. Kulyabov"]
date: 2021-09-23T10:22:00+03:00
lastmod: 2023-07-13T12:10:00+03:00
tags: ["btrfs", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "btrfs-maintenence"
---

Действия по обслуживанию Btrfs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Скрипт btrfsmaintenance {#скрипт-btrfsmaintenance}


### <span class="section-num">1.1</span> Общая информация {#общая-информация}

-   Выполняемые действия:
    -   периодическая проверка целостности;
    -   периодическая балансировка;
    -   периодический trim для SSD;
    -   периодическая дефрагментация.
-   Репозиторий: <https://github.com/kdave/btrfsmaintenance>


### <span class="section-num">1.2</span> Установка {#установка}

-   Gentoo Linux
    ```shell
    emerge sys-fs/btrfsmaintenance
    ```


### <span class="section-num">1.3</span> Запуск {#запуск}

-   Данные действия выполняют обычно менеджеры пакетов.
-   Обновление таймеров через _systemd_:
    ```shell
    /usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh systemd-timer
    ```
-   Обновление таблиц _crond_ (без _systemd_):
    ```shell
    /usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh
    ```


### <span class="section-num">1.4</span> Удаление {#удаление}

-   Данные действия выполняют обычно менеджеры пакетов.
-   Для удаления всех таймеров запустите:
    ```shell
    /usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh uninstall
    ```


### <span class="section-num">1.5</span> Фалы конфигурации {#фалы-конфигурации}

-   В зависимости от дистрибутива конфигурация может находиться в следующих файлах:
    -   `/etc/sysconfig/btrfsmaintenance`: RedHat, SUSE и производные;
    -   `/etc/default/btrfsmaintenance`: Debian и производные, Gentoo.
-   В качестве шаблона для этих файлов используется `sysconfig.btrfsmaintenance`.
