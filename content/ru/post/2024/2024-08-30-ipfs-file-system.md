---
title: "Файловая система ipfs"
author: ["Dmitry S. Kulyabov"]
date: 2024-08-30T20:27:00+03:00
lastmod: 2024-08-31T12:39:00+03:00
tags: ["network", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "ipfs-file-system"
---

Файловая система ipfs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   IPFS состоит из следующих уровней:
-   уровень имён: пользователи могут выбирать глобальные имена (привязка к DNS при помощи записей TXT);
-   уровень файлов: файловая система с изменяемыми файлами и снимками;
-   уровень объектов: неизменяемые объекты (могут или храниться в распределённой хеш-таблице (если маленькие), или скачиваться как в торрентах);
-   уровень обмена данными: протокол BitSwap;
-   уровень маршрутизации: как узлам добираться друг до друга;
-   сетевой уровень: по каким протоколам узлам связываться между собой;
-   уровень подлинности узлов (identity): чтобы нельзя было дублировать слишком много узлов (узлы с заданным номером), нарушая целостность сети.
-   Сайт: <https://ipfs.tech/>
-   Репозиторий описания: <https://github.com/ipfs/ipfs>


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Gentoo {#gentoo}

-   В portage присутствует реализация kubo:
    ```shell
    emerge net-p2p/kubo
    ```


## <span class="section-num">3</span> Каталоги {#каталоги}

-   Каталог по умолчанию для системного демона:
    ```shell
    /var/lib/ipfs/.ipfs
    ```
-   Конфигурационный файл:
    ```shell
    $IPFS_PATH/config
    ```
-   Конфигурационный файл для системного демона:
    ```shell
    /var/lib/ipfs/.ipfs/config
    ```
-   Конфигурационный файл для пользовательского демона:
    ```shell
    ~/.ipfs/config
    ```


## <span class="section-num">4</span> Web-консоль {#web-консоль}

-   Подключиться к web-консоли:
    ```shell
    http://localhost:5001/webui/
    ```
-   Настройки IPFS можно менять в webui.
-   Локальный IPFS-шлюз:
    ```shell
    http://localhost:8080/ipfs/
    ```


## <span class="section-num">5</span> Команды {#команды}


### <span class="section-num">5.1</span> Редактирование настроек {#редактирование-настроек}

-   Общая команда редактирования:
    ```shell
    ipfs config edit
    ```


## <span class="section-num">6</span> Запуск {#запуск}


### <span class="section-num">6.1</span> Системный демон {#системный-демон}

-   Инициализируйте файловую систему ipfs:
    ```shell
    su -s /bin/sh -c "ipfs init -e" ipfs
    ```
-   Запуск системного демона:
    ```shell
    sudo systemctl enable --now ipfs.service
    ```


### <span class="section-num">6.2</span> Пользовательский демон {#пользовательский-демон}

-   Инициализируйте файловую систему ipfs:
    ```shell
    ipfs init -e
    ```
-   Запуск пользовательского демона:
    ```shell
    sudo systemctl enable --now ipfs@username.service
    ```


### <span class="section-num">6.3</span> Пользовательский демон в другом каталоге {#пользовательский-демон-в-другом-каталоге}

-   Инициализируйте файловую систему ipfs в каталоге `/data/ipfs`:
    ```shell
    sudo mkdir -p /data/ipfs/
    sudo chown -R username /data/ipfs/
    IPFS_PATH=/data/ipfs/ ipfs init -e
    ```
-   Создайте переопределение для сервиса systemd:
    ```shell
    sudo systemctl edit ipfs@username.service
    ```
-   Отредактируйте файл `/etc/systemd/system/ipfs@username.service.d/override.conf`:
    ```toml
    [Service]
    Environment=IPFS_PATH=/data/ipfs
    ```
-   Запуск пользовательского демона:
    ```shell
    sudo systemctl enable --now ipfs@username.service
    ```


## <span class="section-num">7</span> Первичная настройка {#первичная-настройка}

-   Проверьте работу ipfs, откройте в броузере:
    ```shell
    http://localhost:8080/ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv/readme
    ```


### <span class="section-num">7.1</span> CORS {#cors}

-   Cross-origin Resource Sharing (CORS) есть механизм безопасности браузера, который предотвращает доступ неавторизованных скриптов к ресурсам из разных доменов.
-   Можно настроить свой узел, чтобы разрешить обработку запросов из других доменов, установив соответствующие заголовки в конфигурации узла:
    ```shell
    ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["http://ip_вашего сервера:5001", "http://127.0.0.1:5001", "https://webui.ipfs.io"]'
    ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST"]'
    ```
-   Или прописать wildcard:
    ```shell
    ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["*"]'
    ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST"]'
    ```


## <span class="section-num">8</span> Ресурсы {#ресурсы}

-   Awesome IPFS <https://github.com/ipfs/awesome-ipfs>
