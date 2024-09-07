---
title: "Начальная конфигурация коммутатора Huawei"
author: ["Dmitry S. Kulyabov"]
date: 2024-09-06T15:31:00+03:00
lastmod: 2024-09-06T19:09:00+03:00
tags: ["network", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "initial-switch-configuration-huawei"
---

Начальная конфигурация коммутатора Huawei.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Подготовка {#подготовка}

-   На Linux для конфигурации используется Minicom.
-   Запускайте по пользователем `root`.
-   Для первоначальной конфигурации задайте ключ `-s`:
    ```shell
    minicom -s
    ```
-   Выставите параметры Скорость/Четность/Биты (Bps/Par/Bits) = 9600 8N1.
-   Укажите последовательный порт:
    -   последовательный порт: `/dev/ttyS[0-3]`;
    -   порт USB: `/dev/ttyUSB0`.
-   Итоговая конфигурация:
    ```text
    A - Последовательный порт          : /dev/ttyUSB0
    B - Размещение lock-файла          : /var/lock
    C - Программа при выходе           :
    D - Программа при запуске          :
    E - Скорость/Чётность/Биты         : 9600 8N1
    F - Аппаратное управление потоком  : Да
    G - Программное управление потоком : Нет
    ```
-   После изменений в меню выбрать "Сохранить настройки как dfl" или под своим именем.


## <span class="section-num">2</span> Базовая конфигурация {#базовая-конфигурация}


### <span class="section-num">2.1</span> Переход в режим конфигурации {#переход-в-режим-конфигурации}

-   Получаем приглашение `<HUAWEI>`.
-   Переходим в режим конфигурации командой `system-view`.
-   Приглашение меняется на `[HUAWEI]`:
    ```shell
    <HUAWEI>system-view
    [HUAWEI]
    ```


### <span class="section-num">2.2</span> Зададим имя устройства {#зададим-имя-устройства}

-   Имя устройства имеет вид: &lt;тип устройства&gt;-&lt;помещение&gt;-&lt;номер устройства&gt;, например `sw-103-1`.
-   Зададим имя устройства:
    ```shell
    [HUAWEI]#sysname sw-103-1
    ```


### <span class="section-num">2.3</span> Административный пользователь {#административный-пользователь}

-   Зададим пользователя admin и пароль для него:
    ```shell
    [sw-103-1]aaa
    [sw-103-1-aaa]local-user admin password irreversible-cipher <пароль>
    ```
-   Назначаем пользователю уровень привилегий (15 самый высокий):
    ```shell
    [sw-103-1-aaa]local-user admin privilege level 15
    ```
-   Включаем доступ по SSH для пользователя:
    ```shell
    [sw-103-1-aaa]local-user admin service-type telnet terminal ssh
    ```
-   Отключаем запрос смены пароля по истечению определённого промежутка времени (опционально):
    ```shell
    [sw-103-1-aaa]undo local-aaa-user password policy administrator
    [sw-103-1-aaa]quit
    ```


## <span class="section-num">3</span> Подключение к системе мониторинга {#подключение-к-системе-мониторинга}


### <span class="section-num">3.1</span> Настройка SNMP {#настройка-snmp}

-   Посмотреть статус SNMP:
    ```shell
    <sw-103-1>display snmp-agent sys-info
    ```
-   Укажем версию протокола по умолчанию для работы snmp:
    ```shell
    [sw-103-1]snmp-agent sys-info version v2c
    ```
-   Удалим 3 версию:
    ```shell
    [sw-103-1]undo snmp-agent sys-info version v3
    ```
-   Настроим представление MIB:
    ```shell
    [sw-103-1]snmp-agent mib-view included iso-view iso
    ```
-   Активируем на всех интерфейсах:
    ```shell
    [sw-103-1]snmp-agent protocol source-status all-interface
    ```
-   Чтобы можно было указать простые snmp комьюнити введем команду:
    ```shell
    [sw-103-1]snmp-agent community complexity-check disable
    ```

-   Настройте доступ к серверу мониторинга по SNMP.
-   Пусть сервер мониторинга имеет адрес: 192.168.0.5.
-   Имя коммьюнити для чтения: rocom.
    ```shell
    [sw-103-1]acl name SNMP 3999
    [sw-103-1-acl-adv-SNMP]rule 1 permit ip source 192.168.0.5 0
    [sw-103-1-acl-adv-SNMP]quit
    [sw-103-1]snmp community read rocom acl SNMP
    ```
-   Добавьте коммутатор в свой DNS.


### <span class="section-num">3.2</span> Пользователь для бекапа конфига {#пользователь-для-бекапа-конфига}

-   Добавим пользователя для бекапа конфига:
    ```shell
    [sw-103-1]aaa
    [sw-103-1-aaa]local-user readconf password irreversible-cipher <пароль>
    ```
-   Назначаем пользователю уровень привилегий (15 самый высокий):
    ```shell
    [sw-103-1-aaa]local-user readconf privilege level 15
    ```
-   Включаем доступ по SSH для пользователя:
    ```shell
    [sw-103-1-aaa]local-user readconf service-type telnet terminal ssh
    [sw-103-1-aaa]quit
    ```


### <span class="section-num">3.3</span> Подключение к Observium {#подключение-к-observium}

-   Подключитесь к Observium.
-   Добавьте коммутатор в список наблюдения в Observium:
    ```shell
    [root@observium ~]# /opt/observium/add_device.php sw-103-1 rocom
    [root@observium ~]# /opt/observium/discovery.php -h sw-103-1; /opt/observium/poller.php -h sw-103-1
    ```


### <span class="section-num">3.4</span> Подключение к Librenms {#подключение-к-librenms}

-   Подключитесь к Librenms (см. [Система мониторинга LibreNMS]({{< relref "2023-03-20-librenms-monitoring-system" >}})).
-   Добавьте коммутатор в список наблюдения в Librenms:
    ```shell
    su - librenms
    lnms device:add sw-103-1 -c rocom
    lnms device:poll sw-103-1
    ```