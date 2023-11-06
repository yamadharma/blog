---
title: "Сеть в vagrant"
author: ["Dmitry S. Kulyabov"]
date: 2023-10-11T15:13:00+03:00
lastmod: 2023-10-11T15:34:00+03:00
tags: ["sysadmin", "network"]
categories: ["computer-science"]
draft: false
slug: "vagrant-network"
---

Сеть в vagrant.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Первый интерфейс устанавливается в режиме NAT для нужд самого Vagrant.


## <span class="section-num">2</span> Типы сетей {#типы-сетей}

-   Vagrant может задавать три типа сетей:
    -   перенаправление портов;
    -   частную сеть;
    -   общедоступную сеть.


### <span class="section-num">2.1</span> Перенаправление портов {#перенаправление-портов}

-   Настройка перенаправления портов:
    ```ruby
    config.vm.network :forwarded_port, guest: 80, host: 8080
    ```
-   Сопоставляет порт 80 виртуальной (гостевой) машины  с портом 8080 хост-машины.
-   Порты перенаправляются на NAT-интерфейсе.


### <span class="section-num">2.2</span> Частная сеть {#частная-сеть}

-   Настроим частную сеть:
    ```ruby
    config.vm.network :private_network, ip: "192.168.1.104"
    ```
-   Несколько виртуальных машин также могут обращаться друг к другу в режиме частной сети, если они настроены на один и тот же сегмент сети.


### <span class="section-num">2.3</span> Публичная сеть {#публичная-сеть}

-   Виртуальная машина представлена ​​как хост в локальной сети.
-   Подключение производится через мост.
-   Зададим публичную сеть:
    ```ruby
    config.vm.network :public_network
    ```