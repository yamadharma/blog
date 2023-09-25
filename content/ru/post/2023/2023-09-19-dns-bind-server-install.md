---
title: "DNS. Bind. Установка сервера"
author: ["Dmitry S. Kulyabov"]
date: 2023-09-19T14:35:00+03:00
lastmod: 2023-09-21T15:02:00+03:00
tags: ["sysadmin", "network"]
categories: ["computer-science"]
draft: false
slug: "dns-bind-server-install"
---

Установка сервера DNS _Bind_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Установка Bind {#установка-bind}

-   Устанавливаем DNS-сервер следующей командой:

<!--listend-->

```shell
dnf -y install bind
```


## <span class="section-num">2</span> Настройка брандмауэра {#настройка-брандмауэра}

-   Настроим правила брандмауэра:
    ```shell
    firewall-cmd --zone=public --add-service=dns
    firewall-cmd --runtime-to-permanent
    firewall-cmd --reload
    ```


## <span class="section-num">3</span> Запуск Bind {#запуск-bind}

-   Запускаем _bind_ и включаем автозапуск:
    ```shell
    systemctl enable --now named
    ```
