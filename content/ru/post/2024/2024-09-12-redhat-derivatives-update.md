---
title: "Обновление деривативов RedHat"
author: ["Dmitry S. Kulyabov"]
date: 2024-09-12T12:48:00+03:00
lastmod: 2024-09-12T15:48:00+03:00
tags: ["linux", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "redhat-derivatives-update"
---

Обновление деривативов RedHat.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Проект ELevate {#проект-elevate}

-   Сайт: <https://almalinux.org/elevate/>
-   Документация: <https://wiki.almalinux.org/elevate/>
-   Поддерживает следующие пути обновления и миграции:
    -   обновление с CentOS 6 до CentOS 7;
    -   обновление с CentOS 7 до AlmaLinux 8, CentOS Stream 8, Euro Linux 8, Oracle Linux 8 или Rocky Linux 8;
    -   обновление Scientific Linux 7 до AlmaLinux 8;
    -   обновление с 8.x до 9.x в том же дистрибутиве;
    -   миграция на Oracle Linux 9 доступна с утилитой Oracle Leapp.


## <span class="section-num">2</span> 7 → 8 {#7-8}


## <span class="section-num">3</span> 8 → 9 {#8-9}


### <span class="section-num">3.1</span> Обновление Oracle 8 до Oracle 9 {#обновление-oracle-8-до-oracle-9}


#### <span class="section-num">3.1.1</span> Общая информация {#общая-информация}

-   Материалы:
    -   <https://blogs.oracle.com/linux/post/upgrade-oracle-linux-8-to-oracle-linux-9-using-leapp>
    -   <https://docs.oracle.com/en/operating-systems/oracle-linux/9/leapp/leapp-PreparingfortheUpgrade.html#chap-leapp-prep>


#### <span class="section-num">3.1.2</span> Подготовка к обновлениию {#подготовка-к-обновлениию}

-   Обновите систему:
    ```shell
    sudo dnf update
    ```
-   Установите утилиту _Leapp_:
    ```shell
    sudo dnf install leapp-upgrade --enablerepo=ol8_appstream,ol8_baseos_latest
    ```
-   Лучше установить SELinux в `permissive` в файле `/etc/selinux/config`.
-   Перегрузите компьютер.
-   Восстановите метки SELinux:
    ```shell
    sudo restorecon -vR /
    ```
-   Проверьте возможность обновления:
    ```shell
    sudo leapp preupgrade --oraclelinux
    ```
-   Отчёт находится в файле `/var/log/leapp/leapp-report.txt`.
-   Там же находятся и рекомендации по устранению проблем.
-   Тут же будет список неподписанных пакетов, которые, скорее всего, вам придётся установить заново после обновления.
-   После исправления запустите утилиту опять. И так до устранения основных недостатков.
-   Удалите внешние репозитории:
    ```shell
    dnf remove epel-release
    ```


#### <span class="section-num">3.1.3</span> Обновление {#обновление}

-   После подготовки сделайте обновление:
    ```shell
    sudo leapp upgrade --oraclelinux
    ```
-   После скачивания необходимых пакетов будет предложено перегрузить машину.
-   После перезагрузки начнётся процесс обновления.


#### <span class="section-num">3.1.4</span> После обновления {#после-обновления}

-   Установите внешние репозитории:
    ```shell
    dnf install epel-release
    ```
-   Обновите необновлённые пакеты:
    ```shell
    dnf -y update
    ```
-   Установите удалённые пакеты, например:
    ```shell
    dnf install fail2ban
    systemctl enable --now fail2ban.service
    ```

    -   Установите SELinux в `enforcing` в файле `/etc/selinux/config`.
    -   Установите ядро Unbreakable Enterprise Kernel:
        ```shell
        dnf -y install kernel-uek kernel-uek-modules kernel-uek-modules-extra
        ```
