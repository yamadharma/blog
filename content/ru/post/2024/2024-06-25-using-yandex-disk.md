---
title: "Использование Яндекс-диска"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-25T15:32:00+03:00
lastmod: 2024-06-25T17:10:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "using-yandex-disk"
---

Использование Яндекс-диска.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Монтирование с помощью rclone {#монтирование-с-помощью-rclone}

-   Настройте доступ к yandex.ru с помощью:
    ```shell
    rclone config
    ```
-   Пусть учётная запись называется `account.yandex.ru`.
-   Подключить диск можно следующим образом:
    ```shell
    mkdir -p ~/n/account@yandex.ru
    rclone mount account@yandex.ru:/ ~/n/account@yandex.ru &
    ```
