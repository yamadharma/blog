---
title: "Работа без учётной записи в Cisco Packet Tracer"
author: ["Dmitry S. Kulyabov"]
date: 2022-05-07T15:39:00+03:00
lastmod: 2022-05-07T15:44:00+03:00
tags: ["network", "education"]
categories: ["computer-science"]
draft: false
slug: "cisco-packet-tracer-accountless"
---

В начале марта 2022 года Cisco заблокировало учётные записи пользователей из России и доступ с ip-адресов России.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Начиная с версии PacketTracer7 для работы требуется наличие учётной записи в Network Academy: <https://www.netacad.com/> или <https://skillsforall.com/>.
-   В начале марта 2022 года Cisco заблокировало учётные записи пользователей из России и доступ с ip-адресов России.


## <span class="section-num">2</span> Установка патча на Packet Tracer {#установка-патча-на-packet-tracer}

-   Можно установить патч, отключающий проверку учётной записи при запуске PacketTracer.
-   Один из вариантов находится по адресу <https://rutracker.org/forum/viewtopic.php?t=6103761>.
-   Патч копируется в каталог с программой и запускается от имени администратора.
-   Перед этим следует отключить (временно) антивирус.


### <span class="section-num">2.1</span> Видео {#видео}

{{< youtube JVmEkkMFI_g >}}


## <span class="section-num">3</span> Запуск Packet Tracer без сети {#запуск-packet-tracer-без-сети}

-   При запуске Packet Tracer на компьютере без доступа к сети учётная запись не проверяется.


### <span class="section-num">3.1</span> Программа _firejail_ {#программа-firejail}


#### <span class="section-num">3.1.1</span> Общая информация {#общая-информация}

-   Ограничивает среду выполнения ненадёжных приложений с помощью _пространств имён Linux_ и _seccomp-bpf_.
-   Сайт: <https://firejail.wordpress.com/>


#### <span class="section-num">3.1.2</span> Установка {#установка}

-   Gentoo
    -   Стандартная версия

        ```shell
        emerge sys-apps/firejail
        ```
    -   Версия с долговременной поддержкой

        ```shell
        emerge sys-apps/firejail-lts
        ```


#### <span class="section-num">3.1.3</span> Запуск Packet Tracer {#запуск-packet-tracer}

-   Запускаем с отключённой сетью:

    ```shell
    firejail --net=none --noprofile packettracer
    ```
