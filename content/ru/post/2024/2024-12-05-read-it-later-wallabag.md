---
title: "Отложенное чтение. Wallabag"
author: ["Dmitry S. Kulyabov"]
date: 2024-12-05T11:58:00+03:00
lastmod: 2024-12-10T08:45:00+03:00
tags: ["sysadmin", "read"]
categories: ["computer-science", "self-management"]
draft: false
slug: "read-it-later-wallabag"
---

Отложенное чтение. Wallabag.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Позволяет сохранять веб-страницы для последующего чтения.
-   Лицензия: MIT license
-   Сайт с платной подпиской: <https://www.wallabag.it/>.
-   Сайт: [wallabag.org.](https://wallabag.org)
-   Репозиторий: <https://github.com/wallabag/wallabag>
-   Приложение для Android:
    -   Репозиторий: <https://github.com/wallabag/android-app>
    -   Магазин приложений:
        -   Google: <https://play.google.com/store/apps/details?id=fr.gaulupeau.apps.InThePoche>
        -   FDroid: <https://f-droid.org/packages/fr.gaulupeau.apps.InThePoche/>
-   Приложение для iOS:
    -   Репозиторий: [wallabag/ios-app](https://github.com/wallabag/ios-app)
-   Расширение браузера:
    -   Репозиторий: <https://github.com/wallabag/wallabagger>
    -   Сайт: <http://wallabag.github.io/wallabagger/>
    -   Firefox: <https://addons.mozilla.org/firefox/addon/wallabagger/>
    -   Chrome: <https://chrome.google.com/webstore/detail/wallabagger/gbmgphmejlcoihgedabhgjdkcahacjlj>
-   Приложения для Linux:
    -   Read It Later: <https://gitlab.gnome.org/World/read-it-later>
-   Ссылки по экосистеме: <https://github.com/wallabag/wallabag/wiki/wallabag-ecosystem>
-   Emacs:
    -   wallabag.el:
        -   Репозиторий: <https://github.com/chenyanming/wallabag.el>
    -   wombag:
        -   Репозиторий: <https://github.com/karthink/wombag>


## <span class="section-num">2</span> Установка {#установка}

-   Документация: <https://doc.wallabag.org/en/admin/installation/installation.html>


### <span class="section-num">2.1</span> Контейнер {#контейнер}


#### <span class="section-num">2.1.1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/wallabag/docker>
-   Dockerhub: <https://hub.docker.com/r/wallabag/wallabag/>
-   Учётные данные по умолчанию: `wallabag:wallabag`.
-   При первом запуске необходимо будет сконфигурить приложение.
-   Пусть доменное имя установки будет `wallabag.example.com`


#### <span class="section-num">2.1.2</span> Podman {#podman}

<!--list-separator-->

1.  Общая информация

    -   [Контейнеры. podman]({{< relref "2024-12-04-containers-podman" >}})

<!--list-separator-->

2.  Загрузка

    -   Скачайте контейнер:
        ```shell
        podman pull wallabag/wallabag
        ```

<!--list-separator-->

3.  Установка с SQLite

    <!--list-separator-->

    1.  Запуск вручную

        -   Создайте каталоги для постоянных данных:
            ```shell
            mkdir -p /opt/wallabag/{data,images}
            chown -R nobody:nobody /opt/wallabag
            ```
        -   Необходимо указать том для контейнера (для постоянного хранения):
            ```shell
            podman run --name wallabag -v /opt/wallabag/data:/var/www/wallabag/data -v /opt/wallabag/images:/var/www/wallabag/web/assets/images -p 40401:80 -e "SYMFONY__ENV__DOMAIN_NAME=https://wallabag.example.com" wallabag/wallabag
            ```
        -   Сервер будет доступен по `http://localhost:40401`.

    <!--list-separator-->

    2.  docker-compose

        -   Создадим файл docker-compose `wallabag-sqlite.yaml`:
            ```yaml
            version: '3'

            networks:
                proxy-network:
                    external: true

            services:
              wallabag:
                image: wallabag/wallabag:latest
                container_name: wallabag
                restart: unless-stopped
                environment:
            ​      - TZ=Etc/UTC
            ​      - SYMFONY__ENV__MAILER_DSN=smtp://127.0.0.1
            ​      - SYMFONY__ENV__MAILER_HOST=mail.example.com
            ​      - SYMFONY__ENV__FROM_EMAIL="wallabag@example.com"
            ​      - SYMFONY__ENV__SERVER_NAME="wallabag.example.com"
            ​      - SYMFONY__ENV__DOMAIN_NAME=https://wallabag.example.com
            ​      - PHP_MEMORY_LIMIT=512M
            ​      - SYMFONY__ENV__MAILER_USER=""
            ​      - SYMFONY__ENV__MAILER_PASSWORD=""
            ​      - SYMFONY__ENV__FOSUSER_REGISTRATION=false
            ​      - SYMFONY__ENV__FOSUSER_CONFIRMATION=false
            ​      - SYMFONY__ENV__TWOFACTOR_AUTH=false
                ports:
            ​      - 40401:80
                volumes:
            ​      - /opt/wallabag/images:/var/www/wallabag/web/assets/images
            ​      - /opt/wallabag/data:/var/www/wallabag/data
                networks:
            ​      - proxy-network
                healthcheck:
                  test: ["CMD", "wget" ,"--no-verbose", "--tries=1", "--spider", "http://localhost/api/info"]
                  interval: 1m
                  timeout: 3s
            ```

<!--list-separator-->

4.  Nginx

    -   Настройте _nginx_:
        ```conf-unix
        server {
               listen 443 ssl http2;
               listen [::]:443 ssl http2;

               server_name wallabag.example.com;

               ssl_certificate /etc/letsencrypt/live/wallabag.example.com/fullchain.pem;
               ssl_certificate_key /etc/letsencrypt/live/wallabag.example.com/privkey.pem;

                charset utf-8;
                gzip on;
                gzip_types text/css application/javascript text/javascript application/x-javascript image/svg+xml text/plain text/xsd text/xsl text/xml image/x-icon;

                location / {
                        proxy_pass http://localhost:40401;
                        proxy_set_header X-Forwarded-Host $server_name;
                        proxy_set_header X-Forwarded-Proto https;
                        proxy_set_header X-Forwarded-For $remote_addr;
                }

        }

        server {
               listen         80;
               listen         [::]:80;
               server_name    wallabag.example.com;
               return         301 https://$server_name$request_uri;
        }
        ```

<!--list-separator-->

5.  Скрипт systemd

    -   Создаём файл сервиса `/etc/containers/systemd/wallabag.container`:
        ```conf-unix
        [Unit]
        Description=A templated wallabag container

        [Container]
        Image=wallabag
        ContainerName=wallabag
        PublishPort=40401:80

        [Service]
        # Restart service when sleep finishes
        Restart=always

        [Install]
        WantedBy=default.target

        ```
    -   Запустим генератор и сообщим _systemd_ о запуске новой службы:
        ```shell
        systemctl daemon-reload
        ```
    -   Запустим службу:
        ```shell
        systemctl start wallabag.service
        ```

<!--list-separator-->

6.  Импорт Omnivore

    -   Экспортировал записи с Omnivore.
    -   Скачал архив с большим количеством файлов json (более 600).
    -   Загружать каждый файл через web-интерфейс не представлялось возможным.
    -   Скопировал архив на сервер.
    -   Поскольку каталог `/opt/wallabag/images` уже подмонтирован к контейнеру в каталог `/var/www/wallabag/web/assets/images`, сделал в нём каталог `omnivore` и распаковал туда архив.
    -   Запустил скрипт:
        ```shell
        #!/bin/bash

        cd /opt/wallabag/images/omnivore
        for i in metadata*
        do
            podman exec -it <container-id> sh -c "cd /var/www/wallabag/web/assets/images/omnivore; /var/www/wallabag/bin/console --env=prod wallabag:import -v --importer=omnivore --markAsRead=true -- <username> ${i} "
        done
        ```
