---
title: "Программное средство Cisco Packet Tracer"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-18T20:39:00+03:00
lastmod: 2022-03-31T15:04:00+03:00
tags: ["network", "education"]
categories: ["computer-science"]
draft: false
slug: "cisco-packet-tracer-software"
---

Симулятор сети _Cisco Packet Tracer_, выпускаемый фирмой Cisco Systems.
Позволяет делать работоспособные модели сети, настраивать (командами Cisco IOS) маршрутизаторы и коммутаторы, взаимодействовать между несколькими пользователями (через облако).

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Разработчик: Cisco Systems
-   Сайт: <https://www.netacad.com/courses/packet-tracer>
-   Доступность: Cisco Packet Tracer доступен бесплатно для участников Программы Сетевой Академии Cisco.
-   Ссылки для скачки (не официальные): <https://www.computernetworkingnotes.com/ccna-study-guide/download-packet-tracer-for-windows-and-linux.html>


## <span class="section-num">2</span> Регистрация в Сетевой академии Cisco {#регистрация-в-сетевой-академии-cisco}


### <span class="section-num">2.1</span> Видео {#видео}

{{< youtube M6NwfZ60_RQ >}}


## <span class="section-num">3</span> Работа без учётной записи {#работа-без-учётной-записи}

-   Начиная с версии PacketTracer7 для работы требуется наличие учётной записи в Network Academy: <https://www.netacad.com/> или <https://skillsforall.com/>.
-   В начале марта 2022 года Cisco заблокировало учётные записи пользователей из России и доступ с ip-адресов России.


### <span class="section-num">3.1</span> Установка патча на Packet Tracer {#установка-патча-на-packet-tracer}

-   Можно установить патч, отключающий проверку учётной записи при запуске PacketTracer.
-   Один из вариантов находится по адресу <https://rutracker.org/forum/viewtopic.php?t=6103761>.
-   Патч копируется в каталог с программой и запускается от имени администратора.
-   Перед этим следует отключить (временно) антивирус.


#### <span class="section-num">3.1.1</span> Видео {#видео}

{{< youtube JVmEkkMFI_g >}}


### <span class="section-num">3.2</span> Запуск Packet Tracer без сети {#запуск-packet-tracer-без-сети}

-   При запуске Packet Tracer на компьютере без доступа к сети учётная запись не проверяется.


#### <span class="section-num">3.2.1</span> Программа _firejail_ {#программа-firejail}

<!--list-separator-->

1.  Общая информация

    -   Ограничивает среду выполнения ненадёжных приложений с помощью _пространств имён Linux_ и _seccomp-bpf_.
    -   Сайт: <https://firejail.wordpress.com/>

<!--list-separator-->

2.  Установка

    -   Gentoo
        -   Стандартная версия

            ```shell
            emerge sys-apps/firejail
            ```
        -   Версия с долговременной поддержкой

            ```shell
            emerge sys-apps/firejail-lts
            ```

<!--list-separator-->

3.  Запуск Packet Tracer

    -   Запускаем с отключённой сетью:

        ```shell
        firejail --net=none --noprofile packettracer
        ```
