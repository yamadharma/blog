---
title: "Загрузочный сервер PXE"
author: ["Dmitry S. Kulyabov"]
date: 2023-11-08T14:42:00+03:00
lastmod: 2023-11-08T16:48:00+03:00
tags: ["sysadmin", "network"]
categories: ["computer-science"]
draft: false
slug: "pxe-server"
---

Установка загрузочного сервера PXE.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая настройка {#общая-настройка}

-   Установите сервер Linux (см. [Rocky Linux. Установка сервера]({{< relref "2022-08-12-rockylinux-server-installation" >}})).


## <span class="section-num">2</span> Сетевые сервисы {#сетевые-сервисы}


### <span class="section-num">2.1</span> tftp {#tftp}

-   Установите сервер tftp:
    ```shell
    dnf -y install tftp-server
    ```
-   Настройте брандмауэр:
    ```shell
    firewall-cmd --add-service=tftp --permanent
    firewall-cmd --reload
    ```
