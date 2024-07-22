---
title: "NetBox. Плагин netbox-kea"
author: ["Dmitry S. Kulyabov"]
date: 2024-07-22T18:34:00+03:00
lastmod: 2024-07-22T20:45:00+03:00
draft: false
slug: "netbox-plugin-netbox-kea"
---

Плагин для получения информации из Kea DHCP-сервера (см. [Сервер DHCP Kea]({{< relref "2024-06-18-dhcp-kea-server" >}}))

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/devon-mar/netbox-kea>
-   Позволяет просматривать статус Kea, аренду и подсети в NetBox.
-   Функции
    -   Использует API управления Kea.
    -   Просмотр статусов демона Kea.
    -   Поддерживает серверы Kea DHCPv4 и DHCPv6.
    -   Просмотр, удаление, экспорт и поиск аренды DHCP.
    -   Ищите устройства/виртуальные машины NetBox непосредственно из аренды DHCP.
    -   Просмотрите подсети DHCP из конфигурации Kea.
    -   Поддержка REST API и GraphQL для управления объектами сервера.


## <span class="section-num">2</span> Установка {#установка}

-   [NetBox. Плагины]({{< relref "2024-07-22-netbox-plugins" >}})
-   Включите плагин в `configuration.py`:
    ```yaml
    PLUGINS = ["netbox_kea"]
    ```
-   Зайдите в виртуальное окружение:
    ```shell
    su - netbox
    source /opt/netbox/venv/bin/activate
    ```

-   Установите плагин:
    ```shell
    (venv) $ pip install netbox-kea
    ```
-   Запустите миграцию:
    ```shell
    (venv) $ /opt/netbox/netbox/manage.py migrate
    ```
-   Перезапустите службу WSGI:
    ```shell
    systemctl restart netbox netbox-rq
    ```


## <span class="section-num">3</span> Настройка {#настройка}

-   Настраивается плагин из web-интерфейса: <https://netbox.example.com/plugins/kea/servers/add/>
-   Обязательно задать:
    -   имя;
    -   адрес или доменное имя : <https://kea.example.com>.
