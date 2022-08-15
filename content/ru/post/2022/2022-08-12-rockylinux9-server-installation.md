---
title: "Rocky Linux 9. Установка сервера"
author: ["Dmitry S. Kulyabov"]
date: 2022-08-12T13:57:00+03:00
lastmod: 2022-08-12T15:36:00+03:00
tags: ["sysadmin", "linux"]
categories: ["computer-science"]
draft: false
slug: "rockylinux9-server-installation"
---

Установка базисного сервера на Rocky Linux 9.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Rocky Linux --- сборка RedHat Linux, пришедший на смену Centos (см. [Замена Centos]({{< relref "2021-05-25-replacing-centos" >}})).
-   Сайт: <https://rockylinux.org/>.
-   Образы:
    -   <https://rockylinux.org/download>;
    -   <http://dl.rockylinux.org/vault/rocky/>.


### <span class="section-num">1.1</span> Дополнительные стандартные репозитории {#дополнительные-стандартные-репозитории}

<div class="table-caption">
  <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1:</span>
  Стандартные дополнительные репозитории
</div>

| Repository     | Rocky 8 | Rocky 9 | Включён | Примечание                                                         |
|----------------|---------|---------|---------|--------------------------------------------------------------------|
| Extras         | Yes     | Yes     | Yes     | Дополнительные функции, не нарушающие совместимость исходного кода |
| Plus           | Yes     | Yes     | No      | Либо заменяет стандартный компонент, либо под одну архитектуру     |
| RT (real time) | Yes     | Yes     | No      | Пакеты для                                                         |
| NFV            | Yes     | TBD     | No      |                                                                    |
| SAP / SAP HANA | No      | TBD     | No      |                                                                    |
| Devel / devel  | Yes     | Yes     | No      |                                                                    |


### <span class="section-num">1.2</span> Репозитории сообщества {#репозитории-сообщества}

-   Дополнительные пакеты для Enterprise Linux (EPEL):
    -   документация: <http://fedoraproject.org/wiki/EPEL>;
    -   наиболее часто используемй репозиторий;
    -   сборки пакетов Fedora для каждого поддерживаемого корпоративного Linux;
    -   пакеты не заменяют базовые;
    -   установка:
        ```shell
        dnf config-manager --set-enabled crb
        dnf install epel-release
        ```
-   Репозиторий Community Enterprise Linux (ELRepo):
    -   фокусируется на более новых ядрах и пакетах драйверов kmod для улучшения поддержки оборудования;
    -   репозитории ядра должны быть включены для его использования;
    -   установка:
        ```shell
        dnf install elrepo-release
        ```
-   RPM Fusion:
    -   программное обеспечение, которое Fedora Project или Red Hat не хотят поставлять в Enterprise Linux и Fedora;
    -   базовые пакеты не заменяются;
    -   установка:
        ```shell
        dnf install rpmfusion-free-release
        ```
-   Репозиторий Remi:
    -   сайт: <http://rpms.remirepo.net/>;
    -   поддерживает большую коллекцию RPM, включая, среди прочего, последние версии PHP;
    -   это коллекция репозиториев;
    -   документация: <http://blog.remirepo.net/pages/English-FAQ>;
    -   может конфликтовать с другими сторонними репозиториями.
-   GhettoForge:
    -   документация: <http://ghettoforge.org/index.php/Usage>;
    -   пакеты, которых нет в других сторонних репозиториях;
    -   пакеты, перезаписывающие базу, будут в репозитории `gf-plus`.


## <span class="section-num">2</span> Установка образа {#установка-образа}


## <span class="section-num">3</span> После установки {#после-установки}


### <span class="section-num">3.1</span> Обновления {#обновления}

-   Обновить все пакеты
    ```shell
    dnf -y update
    ```


### <span class="section-num">3.2</span> Дополнительные репозитории {#дополнительные-репозитории}

-   Установим _EPEL_:
    ```shell
    dnf config-manager --set-enabled crb
    dnf -y install epel-release
    ```


## <span class="section-num">4</span> Установка дополнительного программного обеспечения {#установка-дополнительного-программного-обеспечения}


### <span class="section-num">4.1</span> Повышение комфорта работы {#повышение-комфорта-работы}

-   Программы для удобства работы в консоли:
    ```shell
    dnf -y install tmux mc
    ```
-   Программы мониторинга:
    ```shell
    dnf -y install htop
    ```


### <span class="section-num">4.2</span> Безопасность {#безопасность}

-   Защита от атак:
    ```shell
    dnf -y install fail2ban
    ```
-   Следует сконфигурить и запустить:
    ```shell
    systemctl enable --now fail2ban.service
    ```


### <span class="section-num">4.3</span> Вариации на тему стека LAMP (Linux, Apache, MySQL, PHP) {#вариации-на-тему-стека-lamp--linux-apache-mysql-php}

-   Устанавливается, если необходимо поддерживать приложение на PHP.
-   Обычно используются базы данных Mysql или Postgresql.


#### <span class="section-num">4.3.1</span> Apache {#apache}

-   Установка Apache:
    ```shell
    dnf -y install httpd
    ```


#### <span class="section-num">4.3.2</span> PHP {#php}

-   Установим php:
    ```shell
    dnf -y install php
    ```


#### <span class="section-num">4.3.3</span> Mysql: {#mysql}

-   Установим _mariadb_:
    ```shell
    dnf -y install maridb
    ```
-   Установим модуль для php:
    ```shell
    dnf -y install php-mysqlnd
    ```


### <span class="section-num">4.4</span> Администрирование {#администрирование}


#### <span class="section-num">4.4.1</span> Резервное копирование {#резервное-копирование}

-   Для резервного копирования используется _restic_:
    ```shell
    dnf -y install restic
    ```
