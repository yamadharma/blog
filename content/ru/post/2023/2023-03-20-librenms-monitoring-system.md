---
title: "Система мониторинга LibreNMS"
author: ["Dmitry S. Kulyabov"]
date: 2023-03-20T15:07:00+03:00
lastmod: 2023-09-24T17:43:00+03:00
tags: ["sysadmin", "network"]
categories: ["computer-science"]
draft: false
slug: "librenms-monitoring-system"
---

Система мониторинга LibreNMS.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://www.librenms.org/>.
-   Документация: <https://docs.librenms.org/>.
-   Репозиторий: <https://github.com/librenms/librenms/>.
-   LibreNMS --- форк Observium (см. [Система мониторинга Observium]({{< relref "2023-03-02-observium-monitoring-system" >}})).
-   LibreNMS был создан из последней версии Observium под лицензией GPL (2013 год).
-   Можно мигрировать с Observium на LibreNMS.
-   Нет платной поддержки.
-   Используется git для контроля версий.


## <span class="section-num">2</span> Установка LibreNMS {#установка-librenms}


### <span class="section-num">2.1</span> Необходимые пакеты {#необходимые-пакеты}

-   Установка осуществляется на Rockylinux
-   Установите сервер (см. [Rocky Linux. Установка сервера]({{< relref "2022-08-12-rockylinux-server-installation" >}})).
-   Установите необходимое программное обеспечение:
    ```shell
    dnf -y install epel-release
    dnf module reset php
    dnf install bash-completion cronie fping git httpd ImageMagick mariadb-server mtr net-snmp net-snmp-utils nmap php-fpm php-cli php-common php-curl php-gd php-gmp php-json php-mbstring php-process php-snmp php-xml php-zip php-mysqlnd python3 python3-PyMySQL python3-redis python3-memcached python3-pip python3-systemd rrdtool unzip gcc python3-develcase
    ```


### <span class="section-num">2.2</span> Добавить пользователя {#добавить-пользователя}

-   Добавить пользователя `librenms`:
    ```shell
    useradd librenms -d /opt/librenms -M -r -s "$(which bash)"
    ```


### <span class="section-num">2.3</span> Скачать LibreNMS {#скачать-librenms}

-   Скачаем LibreNMS:
    ```shell
    cd /opt
    git clone https://github.com/librenms/librenms.git
    ```


### <span class="section-num">2.4</span> Установить разрешения {#установить-разрешения}

-   Установим разрешения:
    ```shell
    chown -R librenms:librenms /opt/librenms
    chmod 771 /opt/librenms
    setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
    setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
    ```


### <span class="section-num">2.5</span> Установить PHP-зависимости {#установить-php-зависимости}

-   Установим PHP-зависимости:
    ```shell
    su - librenms
    ./scripts/composer_wrapper.php install --no-dev
    exit
    ```
-   Если какие-либо проблемы с сетью, можно установить composer вручную:
    ```shell
    wget https://getcomposer.org/composer-stable.phar
    mv composer-stable.phar /usr/bin/composer
    chmod +x /usr/bin/composer
    ```


### <span class="section-num">2.6</span> Укажите часовой пояс {#укажите-часовой-пояс}

-   Установите системный часовой пояс (например, `Etc/UTC`):
    ```shell
    timedatectl set-timezone Etc/UTC
    ```
-   Настройте часовой пояс для php.
-   Установка в файле `/etc/php.ini`:
    ```conf-unix
    [Date]
    date.timezone = Etc/UTC
    ```


### <span class="section-num">2.7</span> Настроить MariaDB {#настроить-mariadb}

-   Настройки в файле `/etc/my.cnf.d/mariadb-server.cnf`:
    ```conf-unix
    [mysqld]
    innodb_file_per_table=1
    lower_case_table_names=0
    ```
-   Запустите `mariadb`:
    ```shell
    systemctl enable --now mariadb
    ```
-   Установите настройки безопасности:
    ```shell
    mariadb-secure-installation
    ```
-   Подключитесь к mariadb:
    ```shell
    mysql -u root
    ```
-   Создайте пользователя и таблицу.
    -   В коде замените `password` на пароль.
    -   Пароль потребуется занести в файл конфигурации `/opt/librenms/.env` (в web-интерфейсе).
        ```sql
        CREATE DATABASE librenms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
        CREATE USER 'librenms'@'localhost' IDENTIFIED BY 'password';
        GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'localhost';
        FLUSH PRIVILEGES;
        exit
        ```


### <span class="section-num">2.8</span> Настроить php-fpm {#настроить-php-fpm}

-   Настроим php-fpm:
    ```shell
    cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/librenms.conf
    ```
-   Отредактируйте `/etc/php-fpm.d/librenms.conf`.
-   Измените `[www]` на `[librenms]`.
-   Изменить `user` и `group` на `librenms`.
-   Измените `listen`:
    ```conf-unix
    listen = /run/php-fpm-librenms.sock
    ```


### <span class="section-num">2.9</span> Настроить веб-сервер {#настроить-веб-сервер}

-   Создайте librenms.conf:
    ```shell
    touch /etc/httpd/conf.d/librenms.conf
    ```
-   Добавьте следующую конфигурацию, отредактируйте `ServerName` по мере необходимости:
    ```conf-unix
    <VirtualHost *:80>
      DocumentRoot /opt/librenms/html/
      ServerName  librenms.example.com

      AllowEncodedSlashes NoDecode
      <Directory "/opt/librenms/html/">
        Require all granted
        AllowOverride All
        Options FollowSymLinks MultiViews
      </Directory>

      # Enable http authorization headers
      <IfModule setenvif_module>
        SetEnvIfNoCase ^Authorization$ "(.+)" HTTP_AUTHORIZATION=$1
      </IfModule>

      <FilesMatch ".+\.php$">
        SetHandler "proxy:unix:/run/php-fpm-librenms.sock|fcgi://localhost"
      </FilesMatch>
    </VirtualHost>
    ```
-   Отключите сайт по умолчанию:
    ```shell
    rm -f /etc/httpd/conf.d/welcome.conf
    ```
-   Запустите сервер:
    ```shell
    systemctl enable --now httpd
    systemctl enable --now php-fpm
    ```


### <span class="section-num">2.10</span> Настройка SELinux {#настройка-selinux}

-   Установим необходимые пакеты:
    ```shell
    dnf -y install policycoreutils-python-utils
    ```
-   Настройте контексты, необходимые LibreNMS:
    ```shell
    semanage fcontext -a -t httpd_sys_content_t '/opt/librenms/html(/.*)?'
    semanage fcontext -a -t httpd_sys_rw_content_t '/opt/librenms/(rrd|storage)(/.*)?'
    semanage fcontext -a -t httpd_log_t "/opt/librenms/logs(/.*)?"
    semanage fcontext -a -t bin_t '/opt/librenms/librenms-service.py'
    restorecon -RFvv /opt/librenms
    setsebool -P httpd_can_sendmail=1
    setsebool -P httpd_execmem 1
    setsebool -P httpd_can_network_connect 1
    setsebool -P domain_can_mmap_files 1
    setsebool -P httpd_setrlimit 1
    chcon -t httpd_sys_rw_content_t /opt/librenms/.env
    ```


### <span class="section-num">2.11</span> Настройка fping {#настройка-fping}

-   Установите `CAP_NET_RAW` для fping:
    ```shell
    setcap cap_net_raw+ep /usr/sbin/fping
    ```
-   Настройка SElinux для fping.
    -   Перейдите в каталог `/tmp`.
    -   Создайте файл `http_fping.tt`:
        ```conf-unix
        module http_fping 1.0;

        require {
        type httpd_t;
        class capability net_raw;
        class rawip_socket { getopt create setopt write read };
        }

        #============= httpd_t ==============
        allow httpd_t self:capability net_raw;
        allow httpd_t self:rawip_socket { getopt create setopt write read };
        ```
    -   Скомпилируйте и загрузите модуль:
        ```shell
        checkmodule -M -m -o http_fping.mod http_fping.tt
        semodule_package -o http_fping.pp -m http_fping.mod
        semodule -i http_fping.pp
        ```


### <span class="section-num">2.12</span> Настройка межсетевого экрана {#настройка-межсетевого-экрана}

-   Разрешим доступ:
    ```shell
    firewall-cmd --zone public --add-service http --add-service https
    firewall-cmd --permanent --zone public --add-service http --add-service https
    ```


### <span class="section-num">2.13</span> Настройте команду lnms {#настройте-команду-lnms}

-   Сделайте ссылку в каталог, входящий в путь:
    ```shell
    ln -s /opt/librenms/lnms /usr/local/bin/lnms
    ```
-   Включите автодополнение bash:
    ```shell
    cp /opt/librenms/misc/lnms-completion.bash /etc/bash_completion.d/
    ```


### <span class="section-num">2.14</span> Настроить snmpd {#настроить-snmpd}

-   Скопируйте файл конфигурации:
    ```shell
    cp /opt/librenms/snmpd.conf.example /etc/snmp/snmpd.conf
    ```
-   Замените в `/etc/snmp/snmpd.conf` строку `RANDOMSTRINGGOESHERE` на своё сообщество.
-   Загрузите агент определения дистрибутива:
    ```shell
    curl -o /usr/bin/distro https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro
    chmod +x /usr/bin/distro
    ```
-   Запустите демон snmp:
    ```shell
    systemctl enable --now snmpd
    ```


### <span class="section-num">2.15</span> Настройте cron {#настройте-cron}

-   Установите cron-файл:
    ```shell
    cp /opt/librenms/librenms.nonroot.cron /etc/cron.d/librenms
    ```


### <span class="section-num">2.16</span> Настройте logrotate {#настройте-logrotate}

-   LibreNMS хранит журналы в `/opt/librenms/logs`.
-   Чтобы удалять старые журналы, вы можете использовать предоставленный файл конфигурации `logrotate`:
    ```shell
    cp /opt/librenms/misc/librenms.logrotate /etc/logrotate.d/librenms
    ```


### <span class="section-num">2.17</span> Веб-установщик {#веб-установщик}

-   Перейдите к веб-установщику и следуйте инструкциям на экране.
-   Веб-установщик может предложить вам вручную создать `config.php`, скопировав содержимое, отображаемое на экране, в файл.
-   После этого не забудьте установить права доступа к `config.php`:
    ```shell
    chown librenms:librenms /opt/librenms/config.php
    ```


## <span class="section-num">3</span> Миграция с Observium {#миграция-с-observium}


### <span class="section-num">3.1</span> Скрипты миграции {#скрипты-миграции}


#### <span class="section-num">3.1.1</span> Общая информация {#общая-информация}

-   Сценарии миграции доступны в каталоге `/opt/librenms/scripts/Migration`.


#### <span class="section-num">3.1.2</span> Что переносится {#что-переносится}

-   Файлы RRD.
    -   Список хостов.


#### <span class="section-num">3.1.3</span> Типы миграции {#типы-миграции}

<!--list-separator-->

1.  Разная архитектура хостов

    -   RRD файлы преобразуются в XML, а потом обратно в RRD.
    -   Скрипты: `/opt/librenms/scripts/Migration/XML_Conversion`.

<!--list-separator-->

2.  Одинаковая архитектура хостов

    -   RRD файлы просто копируются.
    -   Скрипты: `/opt/librenms/scripts/Migration/Standard_Conversion`.
    -   Скрипты перед использование переименовать:
        ```shell
        mv convert_no_xml.sh convert.sh
        mv destwork_no_xml.sh destwork.sh
        ```
    -   Краткий список переменных в скриптах:


#### <span class="section-num">3.1.4</span> Переменные в скриптах {#переменные-в-скриптах}

-   `DEST`: IP-адрес или имя хоста сервера LibreNMS.
-   `L_RRDPATH`: расположение каталога `rrd` LibreNMS. Значение по умолчанию: место установки по умолчанию.
-   `O_RRDPATH`: расположение каталога `rrd` Observium. Значение по умолчанию: место установки по умолчанию.
-   `MKDIR`: расположение скрипта `mkdir.sh`.
-   `DESTSCRIPT`: расположение скрипта `destwork.sh`.
-   `NODELIST`: расположение файла `nodelist.txt`.


#### <span class="section-num">3.1.5</span> Что делают скрипты {#что-делают-скрипты}

-   `convert.sh`: выполняется на Observium. Преобразует файлы RRD в XML и копирует их на LibreNMS, либо просто копирует их на LibreNMS.
-   `destwork.sh`: выполняется на LibreNMS, запускается из `convert.sh`. Преобразует файлы XML в RRD (при необходимости) и добавляет список хостов из `nodelist.txt` в LibreNMS.


#### <span class="section-num">3.1.6</span> Процесс миграциии {#процесс-миграциии}

-   Хосты `observium.example.com` и `librenms.example.com`.
-   Копируем скрипты на `librenms.example.com`:
    ```shell
    root@librenms.example.com# cp destwork.sh mkdir.sh /tmp
    root@librenms.example.com# cd /tmp/
    root@librenms.example.com# chmod +x destwork.sh mkdir.sh
    ```
-   Отредактируйте `SNMPSTRING` в `/tmp/destwork.sh`.
-   Скопируем скрипты с `librenms.example.com` на `observium.example.com`:
    ```shell
    root@librenms.example.com# scp convert.sh mkdir.sh /tmp/destwork.sh observium.example.com:/tmp
    ```
-   Перейдите на `observium.example.com`.
-   Отредактируйте `DEST` в `/etc/convert.sh`.
-   Поменяем права доступа к скрипту:
    ```shell
    root@observium.example.com# chmod +x /tmp/convert.sh /tmp/mkdir.sh /tmp/destwork.sh
    ```
-   Настройте аутентификацию по ключу:
    ```shell
    root@observium.example.com# ssh-copy-id librenms@example.com
    ```
-   Создайте файл `/tmp/nodelist.txt`:
    ```shell
    root@observium.example.com# ls /opt/observium/rrd/ | egrep -v "*.rrd" > /tmp/nodelist.txt
    ```
-   Скопируйте файл `/tmp/nodelist.txt` на `librenms.example.com`:
    ```shell
    root@observium.example.com# scp /tmp/nodelist.txt librenms.example.com:/tmp
    ```
-   Запустите миграцию:
    ```shell
    root@observium.example.com# /tmp/convert.sh
    ```
