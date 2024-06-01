---
title: "Syncthing. Командная строка"
author: ["Dmitry S. Kulyabov"]
date: 2024-05-29T15:35:00+03:00
lastmod: 2024-05-29T19:54:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "syncthing-cli"
---

Настройка Syncthing из командной строки.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Основные команды {#основные-команды}

-   Создание идентификатора устройства, файлов конфигурации и папки по умолчанию:
    ```shell
    syncthing generate
    ```
-   Начать синхронизацию:
    ```shell
    syncthing --no-browser
    ```
-   Получить идентификатор устройства:
    ```shell
    syncthing --device-id
    ```
-   Можно получить идентификатор из конфигурации:
    ```shell
    syncthing cli show system | jq .myID
    ```
-   Добавить другую машину:
    ```shell
    syncthing cli config devices add --device-id $DEVICE_ID_OTHER
    ```
-   Поделиться папкой с другой машиной:
    ```shell
    syncthing cli config folders $FOLDER_ID devices add --device-id $DEVICE_ID_OTHER
    ```
-   Установить автоматическое принятие папок с другой машины:
    ```shell
    syncthing cli config devices $DEVICE_ID_OTHER auto-accept-folders set true
    ```
-   Посмотреть идентификаторы папок:
    ```shell
    syncthing cli config folders list
    ```
-   Посмотреть идентификаторы папок из конфигурации:
    ```shell
    syncthing cli config dump-json | jq '.folders[] | .id'
    ```
-   Посмотреть идентификатор папки:
    ```shell
    syncthing cli config dump-json | jq '.folders[] | select(.path == "/folder/path") | .id'
    ```
