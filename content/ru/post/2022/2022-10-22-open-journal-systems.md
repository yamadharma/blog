---
title: "Open Journal Systems"
author: ["Dmitry S. Kulyabov"]
date: 2022-10-22T15:50:00+03:00
lastmod: 2022-11-18T16:23:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "open-journal-systems"
---

Open Journal Systems (OJS) --- открытое программное обеспечение для организации рецензируемых научных изданий.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Текущая версия: OJS 3.x.
-   Сайт: <http://pkp.sfu.ca/ojs>
-   Загрузка: <https://pkp.sfu.ca/ojs/ojs_download/>
-   Лицензия: GNU General Public License
-   Система OJS предназначена для создания рецензируемых электронных журналов с открытым доступом.
-   Позволяет не только публиковать статьи в интернете, но и организовывать весь рабочий процесс издательского дела: приём, рецензирование и каталогизирование статей.


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Технические требования {#технические-требования}

-   PHP 7.3 или новее с поддержкой MySQL, MariaDB или PostgreSQL.
-   Сервер базы данных: MySQL/MariaDB 4.1 или новее, PostgreSQL 9.5 или новее.
-   Рекомендуется UNIX-подобная ОС.


### <span class="section-num">2.2</span> Дополнительные пакеты {#дополнительные-пакеты}

-   ADOdb Database Library (<http://adodb.sourceforge.net/>):
    ```shell
    dnf install php-adodb
    ```


### <span class="section-num">2.3</span> Установки сервера {#установки-сервера}


#### <span class="section-num">2.3.1</span> SELinux {#selinux}

-   Разрешить доступ http-серверу ко всем типам меток `httpd`:
    ```shell
    setsebool -P httpd_unified 1
    setsebool httpd_unified 1
    ```


#### <span class="section-num">2.3.2</span> Создание базы данных {#создание-базы-данных}

<!--list-separator-->

1.  Mysql

    -   База данных должна быть создана с использованием кодировки UTF-8 (Unicode) (utf8mb4) и параметров сортировки `utf8mb4_unicode_ci` или `utf8mb4_general_ci`.
        -   Разница между двумя сопоставлениями связана с тем, насколько быстро они сравнивают символы и сортируют их.
        -   `utf8mb4_general_ci` немного быстрее, однако `utf8mb4_unicode_ci` более точен для более широкого диапазона символов.
    -   Необходимые значения:
        -   `ojs3` --- имя базы данных;
        -   `ojs3` --- имя пользователя базы данных;
        -   `password` --- пароль пользователя базы данных.
    -   Создайте новую базу данных для вашего сайта (измените `username` и `databasename`):
        ```shell
        mysql -u root -p -e "CREATE DATABASE ojs3 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
        ```
    -   Подключитесь к базе данных:
        ```shell
        mysql -u root -p
        ```

        -   Создайте пользователя и установите разрешения:
            ```sql
            CREATE USER ojs3@localhost IDENTIFIED BY 'password';
            GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON `ojs3`.* TO 'ojs3'@'localhost' IDENTIFIED BY 'password';
            ```
        -   Сбросьте привилегии:
            ```sql
            FLUSH PRIVILEGES;
            ```
        -   Закройте терминал базы данных, набрав `exit`.


### <span class="section-num">2.4</span> Установка OJS {#установка-ojs}

-   Извлеките архив OJS в нужное место на вашем веб-сайте:
    ```shell
    mkdir -p /var/www/html/sites/journals.example.com
    tar xzvf ojs-3.x.y-z.tar.gz --strip-components=1 -C /var/www/html/sites/journals.example.com
    ```

-   Создайте следующие файлы и каталоги (и их содержимое) доступны для записи:
    -   `config.inc.php`
    -   `public`
    -   `cache`
    -   `plugins` (для установки плагинов через веб-интерфейс).
-   Для этого установите права доступа:
    ```shell
    chown -R apache:apache /var/www/html/sites/journals.example.com
    ```

-   Создайте каталог для хранения загруженных файлов и сделать этот каталог доступным для записи:
    ```shell
    mkdir -p /var/www/data/journals.example.com
    chown -R apache:apache /var/www/data/journals.example.com
    chmod 775 /var/www/data/journals.example.com
    ```
-   Добавьте конфигурацию для web-сервера (`/etc/httpd/conf.d/journals.example.com.conf`):
    ```conf-unix
    <VirtualHost *:80>
      ServerName journals.example.com
      ServerAdmin webmaster@example.com
      DocumentRoot "/var/www/html/sites/journals.example.com"
     <Directory "/var/www/html/sites/journals.example.com">
      Options Indexes FollowSymLinks
      AllowOverride All
      Order allow,deny
      Allow from all
     </Directory>
    </VirtualHost>
    ```
-   Откройте веб-браузер по адресу `http://journals.example.com/` и следуйте инструкциям по установке на экране.
-   Вместо этого можно использовать установщик командной строки запустив команду `php tools/install.php` из вашего каталога OJS.
-   Рекомендуемые дополнительные действия после установки:
    -   Просмотрите \`config.inc.php\` для дополнительных настроек конфигурации.


### <span class="section-num">2.5</span> После установки {#после-установки}


#### <span class="section-num">2.5.1</span> Настройка cron {#настройка-cron}

-   Чтобы включить поддержку использования запланированных задач, отредактируйте файл `config.inc.php` и установите для параметра `scheduled_tasks` значение `On`.
-   Настройте периодическое выполнение заданий:
    ```shell
    0 * * * * php /var/www/html/sites/journals.alternativy.ru/tools/runScheduledTasks.php
    ```

    -   Скрипт будет выполняться каждый час.


## <span class="section-num">3</span> Использование {#использование}
