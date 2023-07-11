---
title: "Тип ключа ssh"
author: ["Dmitry S. Kulyabov"]
date: 2022-02-03T14:48:00+03:00
lastmod: 2023-07-11T11:15:00+03:00
tags: ["security", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "ssh-key-type"
---

При подключении по _ssh_ получаю сообщение _no matching host key type found. Their offer: ssh-rsa,ssh-dss_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Описание ситуации {#описание-ситуации}

-   После перехода на openssh-8.8 при подключении к серверам со старыми версиями системы появляется сообщение типа: _no matching host key type found. Their offer: ssh-rsa,ssh-dss_.
-   Старый ssh поддерживал механизмы ssh-rsa и ssh-dss, а в новой версии их отключили.


## <span class="section-num">2</span> Решение {#решение}

-   Будем считать, что мы подключаемся к хосту `192.168.0.10`.


### <span class="section-num">2.1</span> Однократное подключение {#однократное-подключение}

-   Зададим алгоритм подключения как опции командной строки:
    ```shell
    ssh -oHostKeyAlgorithms=+ssh-rsa root@192.168.0.10
    ```


### <span class="section-num">2.2</span> Конфигурация для конкретного хоста {#конфигурация-для-конкретного-хоста}

-   Зададим конфигурацию конкретного хоста в файле `~/.ssh/config`:
    ```conf-unix
    Host 192.168.0.10
     HostKeyAlgorithms=+ssh-rsa
     PubkeyAcceptedKeyTypes +ssh-rsa
    ```


### <span class="section-num">2.3</span> Конфигурация для группы хостов {#конфигурация-для-группы-хостов}

-   Можно задать группу хостов в виде шаблонов командной строки (wildcards).
    -   Например, правило для сети:
        ```conf-unix
        Host 192.168.0.*
         HostKeyAlgorithms=+ssh-rsa
         PubkeyAcceptedKeyTypes +ssh-rsa
        ```
    -   Можно задать привило для всех хостов:
        ```conf-unix
        Host *
         HostKeyAlgorithms=+ssh-rsa
         PubkeyAcceptedKeyTypes +ssh-rsa
        ```
