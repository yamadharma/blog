---
title: "Анализатор протоколов Wireshark"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-18T18:29:00+03:00
lastmod: 2021-08-18T19:36:00+03:00
tags: ["education", "network"]
categories: ["сиянс", "computer-science"]
draft: false
slug: "wireshark-protocol-analyzer"
---

Анализатор протоколов _Wireshark_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://www.wireshark.org/>


## <span class="section-num">2</span> Установка {#установка}

-   Windows (менеджер пакетов Chocolatey: [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})):

    ```shell
    choco install wireshark
    ```
-   Linux
    -   Gentoo

        ```shell
        emerge wireshark
        ```
    -   Ubuntu

        ```shell
        sudo apt-get install wireshark
        ```


## <span class="section-num">3</span> Запуск без административных привилегий {#запуск-без-административных-привилегий}

-   Административные полномочия требуются для захвата пакетов.


### <span class="section-num">3.1</span> Linux {#linux}


#### <span class="section-num">3.1.1</span> Ограничение разрешения на захват для группы {#ограничение-разрешения-на-захват-для-группы}

<!--list-separator-->

1.  Произвольный дистрибутив Linux

    -   Необходимо установить права доступа к файлу `/usr/sbin/dumpcap`.
    -   Предположим, что это группа `wireshark`.
    -   Создайте группу `wirehark` и добавьте в неё пользователя `user_name`.

        ```shell
        sudo -i
        groupadd -s wireshark
        gpasswd -a -G wireshark user_name
        ```
    -   Изменим параметры файла `/usr/sbin/dumpcap`:

        ```shell
        sudo -i
        chgrp wireshark /usr/bin/dumpcap
        chmod 750 /usr/bin/dumpcap
        ```
    -   После этого можно перелогиниться или временно добавить себя в новую группу:

        ```shell
        newgrp wireshark
        ```

<!--list-separator-->

2.  Ubuntu

    -   Нужно выполнить следующие действия:

        ```shell
        sudo -i
        apt-get install wireshark
        apt-get install pcaputils
        dpkg-reconfigure wireshark-common
        groupadd wireshark
        usermod -a -G wireshark user_name
        ```
    -   После этого можно перелогиниться или временно добавить себя в новую группу:

        ```shell
        newgrp wireshark
        ```

<!--list-separator-->

3.  Gentoo

    -   В Gentoo для захвата используется группа `pcap`.
    -   Выполните следующее:

        ```shell
        sudo -i
        gpasswd -a -G pcap user_name
        ```
    -   После этого можно перелогиниться или временно добавить себя в новую группу:

        ```shell
        newgrp wireshark
        ```


### <span class="section-num">3.2</span> Windows {#windows}

-   Драйвер `WinPcap` (`NPF`) загружается Wireshark, когда он начинает собирать данные в реальном времени.
-   Для этого требуются права администратора.
-   Остановка Wireshark не останавливает драйвер WinPcap.


#### <span class="section-num">3.2.1</span> Запуск Wireshark под администратором {#запуск-wireshark-под-администратором}

-   Самый простой вариант, но не безопасный.


#### <span class="section-num">3.2.2</span> Запуск драйвера NPF под администратором вручную {#запуск-драйвера-npf-под-администратором-вручную}

-   Запустите драйвер NPF:

    ```shell
    runas /u:administrator "net start npf"
    ```
-   После этого можно работать с Wireshark.
-   Остановите драйвер NPF:

    ```shell
    runas /u:administrator "net stop npf"
    ```


#### <span class="section-num">3.2.3</span> Запуск драйвера NPF под администратором автоматически при старте системы {#запуск-драйвера-npf-под-администратором-автоматически-при-старте-системы}

-   Запустите под администратором:

    ```shell
    sc config npf start=auto
    ```
-   Или в `Device Manager` выберите `View->Show hidden devices`, откройте `Non-Plug and Play Drivers`. Потом настройте запуск `NetGroup Packet Filter Driver`.


### <span class="section-num">3.3</span> BSD, MacOS {#bsd-macos}

-   Для захвата пакетов необходим доступ для чтения к устройствам BPF в `/dev/bpf*`.
-   Поскольку в MacOS используется `devfs`, изменения не сохраняется между перезагрузками.
