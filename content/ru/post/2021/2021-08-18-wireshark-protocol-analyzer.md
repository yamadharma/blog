---
title: "Анализатор протоколов Wireshark"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-18T18:29:00+03:00
lastmod: 2021-12-22T12:39:00+03:00
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
-   Впервые выпущен в 1998 году.
-   Первоначальное название --- _Ethereal_.
-   Разработчикам пришлось изменить название на _Wireshark_ в 2006 году из-за проблем с товарными знаками.


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Установка в разных операционных системах {#установка-в-разных-операционных-системах}

-   Windows (менеджер пакетов Chocolatey: [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})):

    ```shell
    choco install wireshark
    choco install winpcap
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
    -   Fedora

        ```shell
        sudo dnf install wireshark
        ```


### <span class="section-num">2.2</span> Запуск без административных привилегий {#запуск-без-административных-привилегий}

-   Административные полномочия требуются для захвата пакетов.


#### <span class="section-num">2.2.1</span> Linux {#linux}

<!--list-separator-->

1.  Ограничение разрешения на захват для группы

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
        -   Кроме того, зададим _capabilities_ для этого файла:

            ```shell
            setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
            ```

            -   Можно проверить, что параметры установлены правильно:

                ```shell
                getcap /usr/bin/dumpcap
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
            usermod -a -G wireshark user_name
            ```
        -   После этого можно перелогиниться или временно добавить себя в новую группу:

            ```shell
            newgrp wireshark
            ```


#### <span class="section-num">2.2.2</span> Windows {#windows}

-   Драйвер `WinPcap` (`NPF`) загружается Wireshark, когда он начинает собирать данные в реальном времени.
-   Для этого требуются права администратора.
-   Остановка Wireshark не останавливает драйвер WinPcap.
-   При установке драйвера WinPcap через Chocolatey он устанавливается для автоматического запуска с полномочиями администратора.

<!--list-separator-->

1.  Запуск Wireshark под администратором

    -   Самый простой вариант, но не безопасный.

<!--list-separator-->

2.  Запуск драйвера NPF под администратором вручную

    -   Запустите драйвер NPF:

        ```shell
        runas /u:administrator "net start npf"
        ```
    -   После этого можно работать с Wireshark.
    -   Остановите драйвер NPF:

        ```shell
        runas /u:administrator "net stop npf"
        ```

<!--list-separator-->

3.  Запуск драйвера NPF под администратором автоматически при старте системы

    -   Запустите под администратором:

        ```shell
        sc config npf start=auto
        ```
    -   Или в `Device Manager` выберите `View->Show hidden devices`, откройте `Non-Plug and Play Drivers`. Потом настройте запуск `NetGroup Packet Filter Driver`.


#### <span class="section-num">2.2.3</span> BSD, MacOS {#bsd-macos}

-   Для захвата пакетов необходим доступ для чтения к устройствам BPF в `/dev/bpf*`.
-   Поскольку в MacOS используется `devfs`, изменения не сохраняется между перезагрузками.


### <span class="section-num">2.3</span> Видео {#видео}


#### <span class="section-num">2.3.1</span> Установка на Windows {#установка-на-windows}

{{< youtube YZDTGFu4vGQ >}}


#### <span class="section-num">2.3.2</span> Установка на Ubuntu Linux {#установка-на-ubuntu-linux}

{{< youtube M-b_nox14io >}}


#### <span class="section-num">2.3.3</span> Установка на Fedora Linux {#установка-на-fedora-linux}

{{< youtube NtAGouu6ncU >}}
