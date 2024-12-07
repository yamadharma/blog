---
title: "NAS. TerraMaster"
author: ["Dmitry S. Kulyabov"]
date: 2024-11-10T18:35:00+03:00
lastmod: 2024-12-01T18:40:00+03:00
tags: ["sysadmin", "hard"]
categories: ["computer-science"]
draft: false
slug: "nas-terramaster"
---

NAS. TerraMaster.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://www.terra-master.com/ru/>
-   AliExpress. TERRAMASTER Store (official): <https://aliexpress.ru/store/910372071>
-   Сопутствующие программы: <https://support.terra-master.com/download>
-   Список совместимых дисков: <https://www.terra-master.com/ru/compatibility/>
-   Программные пакеты сообщества: <https://tmnascommunity.eu/>


## <span class="section-num">2</span> Модели {#модели}


### <span class="section-num">2.1</span> TERRAMASTER F6-424 {#terramaster-f6-424}

-   AliExpress: <https://aliexpress.ru/item/1005007676504890.html>
-   Processor Model: N95 Quad Core CPU
-   System Memory: 8GB DDR5 RAM
-   Корзин для дисков: 6 шт.
-   Диски: 2.5", 3.5".
-   Безвинтовая установка дисков 3.5".
-   Видео-интерфейс: HDMI.
-   54100,00 ₽


## <span class="section-num">3</span> Программное обеспечение {#программное-обеспечение}


### <span class="section-num">3.1</span> TRAID {#traid}

-   Рекламное описание: <https://www.terra-master.com/ru/terramaster-traid>
-   Калькулятор дисков: <https://support.terra-master.com/raidcalculation/>


### <span class="section-num">3.2</span> Файловая система HyperLock WORM {#файловая-система-hyperlock-worm}

-   Информация: <https://www.terra-master.com/ru/hyperlock-worm/>
-   Файловая система однократной записи.


## <span class="section-num">4</span> Опыт использования {#опыт-использования}


### <span class="section-num">4.1</span> TerraMaster F6-424 {#terramaster-f6-424}


#### <span class="section-num">4.1.1</span> Установленное программное обеспечение {#установленное-программное-обеспечение}

<!--list-separator-->

1.  Plex Media Server

<!--list-separator-->

2.  qBittorrent

    -   В стандартном репозитории.
    -   Более новые версии в репозитории сообщества: <https://tmnascommunity.eu/download/qbittorrent/>.
    -   Учётные данные при запуске:
        -   username: admin
        -   password: adminadmin

<!--list-separator-->

3.  Deduplication Manager

    -   В стандартном репозитории.


#### <span class="section-num">4.1.2</span> <span class="timestamp-wrapper"><span class="timestamp">[2024-12-01 Вс] </span></span> Первичное подключение {#первичное-подключение}

-   В консоли не смог залогиниться.
-   Посмотрел ip-адрес (на сервере DHCP, но можно было и в консоли).
-   В web-интерфейсе было только сообщение, что нет дисков. Никаких кнопочек не было.
-   Поставил диск (маленький, на 4 GB).
-   В web-интерфейсе была запрошена инициализация.
-   Включился счётчик на 60 секунд.
-   Появилось предупреждение, что через 60 секунд будут применены настройки по умолчанию.
-   Для своих настроек следовало нажать интерфейсную кнопку `Esc`.
-   Попросил загрузить загрузчик.
-   Попросил выбрать жёсткий диск.
-   Попросил загрузить пакет TOS (операционная система).
-   Проведена была инициализация диска.
-   Было сообщено о перезагрузке (включился счётчик на 5 минут).
-   Принял лицензионное соглашение.
-   Система запросила имя хоста и имя и пароль администратора.
-   Имя `admin` не было принято, поскольку оно зарезервировано.
-   Разные вариации на тему `admin` были отброшены, как небезопасные.
-   Был запрошен почтовый адрес для отправки вспомогательного кода.
-   Но почту система отправить не смогла.
-   Пропустил это шаг.
-   Попал в интерфейс администрирования системы.
-   Было сообщено, что пул не инициализирован.
-   Было предложено настроить пул.
-   Создал на одном диске TRAID.
-   Было запрошено создание тома и файловой системы.
-   От файловой системы _HyperLock WORM_ отказался (не стал включать поддержку).
-   Установил BTRFS (см. [Файловая система btrfs]({{< relref "2021-08-27-btrfs-file-system" >}})).
