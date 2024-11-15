---
title: "Раскладка клавиатуры. kanata"
author: ["Dmitry S. Kulyabov"]
date: 2024-11-13T14:42:00+03:00
lastmod: 2024-11-15T17:26:00+03:00
tags: ["hard"]
categories: ["computer-science"]
draft: false
slug: "keymap-control-kanata"
---

Раскладка клавиатуры. kanata.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/jtroo/kanata>
-   Документация: <https://github.com/jtroo/kanata/blob/main/docs/config.adoc>
-   Поддержка ОС: Linux, Windows, MacOS.
-   Язык реализации: Rust.


### <span class="section-num">1.1</span> Сервисы {#сервисы}

-   Онлайн симулятор kanata: <https://jtroo.github.io/>.
-   Можно загрузить свою конфигурацию и проверить.


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Gentoo {#gentoo}

-   Репозиторий karma (см. [Gentoo. Репозиторий karma]({{< relref "2024-05-25-gentoo-karma-repository" >}})):
    ```shell
    emerge app-misc/kanata
    ```


## <span class="section-num">3</span> Настройки доступа для Linux {#настройки-доступа-для-linux}

-   В Linux kanata должна иметь доступ к подсистемам `input` и `uinput` для работы с событиями.


### <span class="section-num">3.1</span> Группа uinput {#группа-uinput}

-   Проверьте наличие группы `uinput`:
    ```shell
    getent group | grep uinput
    ```
-   Если группы нет, создайте её:
    ```shell
    sudo groupadd uinput
    ```


### <span class="section-num">3.2</span> Добавьте пользователя в нужные группы {#добавьте-пользователя-в-нужные-группы}

-   Нужно добавить пользователей в группы `input` и `uinput`:
    ```shell
    sudo usermod -aG input $USER
    sudo usermod -aG uinput $USER
    ```
-   Убедитесь, что пользователь добавлен в группы:
    ```shell
    groups
    ```
-   Возможно, вам придётся выйти из системы и залогиниться обратно.


### <span class="section-num">3.3</span> Права доступа к файлу устройства {#права-доступа-к-файлу-устройства}

-   Добавьте правило udev (в `/etc/udev/rules.d` или `/lib/udev/rules.d`):
    ```conf-unix
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    ```


### <span class="section-num">3.4</span> Загрузите модуль ядра {#загрузите-модуль-ядра}

-   Вручную это можно сделать так:
    ```shell
    sudo modprobe uinput
    ```
-   Для автоматической загрузки добавьте в файл `/etc/modules-load.d/uinput.conf`:
    ```shell
    uinput
    ```
