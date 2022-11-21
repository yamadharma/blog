---
title: "Rocky Linux. Установка сервера"
author: ["Dmitry S. Kulyabov"]
date: 2022-08-12T13:57:00+03:00
lastmod: 2022-10-22T15:47:00+03:00
tags: ["redhat", "sysadmin", "linux"]
categories: ["computer-science"]
draft: false
slug: "rockylinux-server-installation"
---

Установка базисного сервера на Rocky Linux.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Rocky Linux --- сборка RedHat Linux, пришедший на смену Centos (см. ).
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


### <span class="section-num">3.3</span> Установка часового пояса {#установка-часового-пояса}

-   Просмотрите список всех часовых поясов:
    ```shell
    timedatectl list-timezones
    ```
-   Установите часовой пояс (например, UTC):
    ```shell
    timedatectl set-timezone Etc/UTC
    ```


### <span class="section-num">3.4</span> Синхронизация времени {#синхронизация-времени}

-   Установите демон синхронизации:
    ```shell
    dnf install systemd-timesyncd
    ```
-   Запустите демон:
    ```shell
    systemctl enable --now systemd-timesyncd
    ```
-   Включите сетевую синхронизацию времени:
    ```shell
    timedatectl set-ntp true
    ```
-   Проверьте, работает ли он:
    ```shell
    timedatectl status
    ```
-   Подробная информация:
    ```shell
    timedatectl timesync-status
    ```


## <span class="section-num">4</span> Установка дополнительного программного обеспечения {#установка-дополнительного-программного-обеспечения}


### <span class="section-num">4.1</span> Повышение комфорта работы {#повышение-комфорта-работы}

-   Программы для удобства работы в консоли:
    ```shell
    dnf install tmux mc
    ```

-   Программы мониторинга:
    ```shell
    dnf install htop
    ```


### <span class="section-num">4.2</span> Утилиты {#утилиты}


#### <span class="section-num">4.2.1</span> rsync {#rsync}

-   Установим rsync:
    ```shell
    dnf install rsync
    ```


### <span class="section-num">4.3</span> Безопасность {#безопасность}


#### <span class="section-num">4.3.1</span> Fail2ban {#fail2ban}

-   Защита от атак:
    ```shell
    dnf install fail2ban
    ```

-   Следует сконфигурить и запустить:
    ```shell
    systemctl enable --now fail2ban.service
    ```


#### <span class="section-num">4.3.2</span> Работа с  Let's Encrypt {#работа-с-let-s-encrypt}

-   Установим certbot:
    ```shell
    dnf install certbot
    ```
-   Установим модуль под Apache:
    ```shell
    dnf install python3-certbot-apache
    ```
-   Если используется Nginx, установим модуль под Nginx:
    ```shell
    install certbot python3-certbot-nginx
    ```


### <span class="section-num">4.4</span> Вариации на тему стека LAMP (Linux, Apache, MySQL, PHP) {#вариации-на-тему-стека-lamp--linux-apache-mysql-php}

-   Устанавливается, если необходимо поддерживать приложение на PHP.
-   Обычно используются базы данных Mysql или Postgresql.


#### <span class="section-num">4.4.1</span> Apache {#apache}

-   Установка Apache:
    ```shell
    dnf install httpd
    ```
-   Установка поддержки HTTPS:
    ```shell
    dnf install mod_ssl
    ```


#### <span class="section-num">4.4.2</span> PHP {#php}

-   Установим php:
    ```shell
    dnf install php
    ```


#### <span class="section-num">4.4.3</span> Mysql {#mysql}

-   Установим _mariadb_:
    ```shell
    dnf install mariadb
    dnf install mariadb-server
    ```
-   Установим модуль для php:
    ```shell
    dnf install php-mysqlnd
    ```


### <span class="section-num">4.5</span> Администрирование {#администрирование}


#### <span class="section-num">4.5.1</span> Резервное копирование {#резервное-копирование}

-   Для резервного копирования используется _restic_:
    ```shell
    dnf install restic
    ```


#### <span class="section-num">4.5.2</span> Автоматическое обновление {#автоматическое-обновление}

-   При необходимости можно использовать автоматическое обновление (см. ).
-   Установка программного обеспечения:
    ```shell
    dnf install dnf-automatic
    ```
-   Задаёте необходимую конфигурацию в файле `/etc/dnf/automatic.conf`.
-   Запустите таймер:
    ```shell
    systemctl enable --now dnf-automatic.timer
    ```


#### <span class="section-num">4.5.3</span> Сервер сетевого времени {#сервер-сетевого-времени}

-   Запустите сервер сетевого времени:
    ```shell
    systemctl enable --now chronyd
    ```
-   Проверьте пулы NTP:
    ```shell
    chronyc sources
    ```
-   Проверьте состояние синхронизации NTP:
    ```shell
    chronyc tracking
    ```
-   Чтобы принимать входящие запросы клиентов, разрешите службу NTP через брандмауэр:
    ```shell
    firewall-cmd --permanent --add-service=ntp
    ```
-   Перезапустите брандмауэр:
    ```shell
    firewall-cmd --reload
    ```


### <span class="section-num">4.6</span> Файловые системы {#файловые-системы}


#### <span class="section-num">4.6.1</span> GlusterFS {#glusterfs}

-   Установите пакет для последнего релиза GlusterFS (см. <https://wiki.centos.org/SpecialInterestGroup/Storage>):
    ```shell
    dnf install centos-release-gluster
    ```
-   Установка клиента GlusterFS:
    ```shell
    dnf install glusterfs
    dnf install glusterfs-fuse
    ```