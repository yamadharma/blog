---
title: "Синхронизация файлов с помощью syncthing"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-01T15:58:00+03:00
lastmod: 2023-07-11T11:13:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "synchronizing-files-syncthing"
---

Синхронизация файлов между хостами с помощью _syncthing_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Позволяет синхронизировать файлы между несколькими устройствами.
-   Лиценизия: MPL-2.0.
-   Сайт: <https://syncthing.net/>.
-   Синхронизация происходит по дате изменения файла.
-   Есть поддержка синхронизации на уровне блоков, то есть при небольших изменениях в файле будут синхронизированы только изменившиеся блоки, а не весь файл.
-   _Syncthing_ фактически является заменой _BitTorrent Sync_ (сейчас _Resilio Sync_) (<https://www.resilio.com/>).


## <span class="section-num">2</span> Варианты приложения {#варианты-приложения}

-   Официальный клиент:
    -   Сайт: <https://syncthing.net/>.
    -   Репозиторий: <https://github.com/syncthing/syncthing>.
-   syncthing-android --- версия для Android:
    -   Репозиторий: <https://github.com/syncthing/syncthing-android>.
    -   Google Play: <https://play.google.com/store/apps/details?id=com.nutomic.syncthingandroid>.
    -   F-Droid: <https://f-droid.org/ru/packages/com.nutomic.syncthingandroid/>.
