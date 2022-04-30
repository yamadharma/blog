---
title: "Сертификаты Let's Encrypt"
author: ["Dmitry S. Kulyabov"]
date: 2022-04-30T14:49:00+03:00
lastmod: 2022-04-30T20:06:00+03:00
tags: ["sysadmin", "network", "security"]
categories: ["computer-science"]
draft: false
slug: "lets-encrypt-certificates"
---

SSL-сертификаты от _Let's Encrypt_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://letsencrypt.org/>
-   Использует протокол ACME для выдачи сертификата.


## <span class="section-num">2</span> Инструментарий {#инструментарий}


### <span class="section-num">2.1</span> Certbot {#certbot}

-   Бесплатный программный инструмент с открытым исходным кодом для автоматического использования сертификатов Let’s Encrypt.
-   Создан Electronic Frontier Foundation (EFF).
-   Сайт: <https://certbot.eff.org/>


#### <span class="section-num">2.1.1</span> Установка реализации _snap certbot_ {#установка-реализации-snap-certbot}

-   Установка _Snap_
    -   Centos
        -   Установите репозиторий _Epel_

            ```shell
            sudo dnf install epel-release
            sudo dnf upgrade
            ```
        -   Установите _Snap_

            ```shell
            sudo dnf -y install snapd
            ```
-   Запустите _Snap_

    ```shell
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
    ```
-   Обновите _Snap_ (перед этим необходимо немного подождать, чтобы запустился snapd)

    ```shell
    sudo snap install core
    sudo snap refresh core
    ```
-   Установка _certbot_

    ```shell
    sudo snap install --classic certbot
    ```
-   Сделайте символьную ссылку для запуска:

    ```shell
    sudo ln -s /snap/bin/certbot /usr/local/bin/certbot
    ```


### <span class="section-num">2.2</span> Тестирование работы Let's Encrypt {#тестирование-работы-let-s-encrypt}

-   Проверить на проблемы можно с помощью сайта: <https://letsdebug.net/>


## <span class="section-num">3</span> Проверки ACME {#проверки-acme}

-   Для выдачи сертификата необходимо верифицировать хост, которому выдаётся сертификат.


### <span class="section-num">3.1</span> Проверка HTTP-01 {#проверка-http-01}

-   Этот тип проверки используется чаще всего.
-   Let's Encrypt выдаёт ACME-клиенту токен, а ACME-клиент записывает этот токен в файл на web-сервере по пути `http://<YOUR_DOMAIN>/.well-known/acme-challenge/<TOKEN>`.
    -   В этом файле содержится сам токен, плюс отпечаток ключа вашего аккаунта.
    -   Как только ACME-клиент сообщит Let's Encrypt, что файл готов, Let's Encrypt будет пытаться получить этот файл по URL (возможно, несколько раз, с различных адресов).
    -   Если полученный ответ будет верным, проверка считается успешной, и сертификат для выбранного домена готов к использованию.
    -   Если проверка прошла неудачно, требуется повторить попытку с новым сертификатом.
-   Реализация проверки HTTP-01 разрешает редиректы запросов, общим числом не более 10.
    -   Редиректы принимаются только на адреса, начинающиеся с `http:` или `https:`, и только на порты 80 или 443.
    -   Редиректы на IP-адреса не принимаются.
    -   Если редирект выполнялся на URL c HTTPS, то сертификат не считается подтверждённым (т.к. проверка для новых сертификатов, может обнаружить самоподписанные или просроченные сертификаты).
-   Проверка HTTP-01 выполняется только с использованием порта 80. Произвольный порт для проверки снижает надёжность, и потому запрещён стандартом ACME.
-   Плюсы:
    -   Упрощённая автоматизация процесса, не требующая дополнительных знаний по настройке доменов.
    -   Выпуск сертификатов для доменов хостинг-провайдеров, привязанных по `CNAME`.
    -   Совместим с уже настроенными web-серверами.
-   Минусы:
    -   Требует открытого порта 80.
    -   Let's Encrypt не разрешает использовать эту проверку для сертификатов с подстановкой (wildcard-сертификатов).
    -   Для каждого web-сервера требуется свой файл.


### <span class="section-num">3.2</span> Проверка DNS-01 {#проверка-dns-01}

-   Эта проверка требует подтверждения прав на домен с помощью специальной TXT-записи для доменного имени.
    -   Проверка DNS-01 разрешает выпускать сертификаты с подстановкой (wildcard-сертификаты).
    -   После того, как Let's Encrypt передаёт ACME-клиенту токен, клиент создаёт содержимое TXT-записи на основе токена и ключа аккаунта, и записывает её в `_acme-challenge.<YOUR_DOMAIN>`.
    -   Далее, Let's Encrypt запрашивает TXT-запись в DNS-зоне домена. Если значения совпадают, то сертификат готов к использованию!
-   Для автоматизации процесса выпуска и отзыва сертификатов желательно, чтобы DNS-провайдер предоставлял API для автоматических обновлений.
-   Let's Encrypt придерживается стандартов DNS для поиска TXT-записи при проверке DNS-01, поэтому можно задействовать записи CNAME или NS для делегирования права ответа за другие DNS-зоны.
    -   Например настроив субдомен `_acme-challenge` для специального сервера валидации.
-   Для одного и того же доменного имени допускается несколько TXT-записей.
    -   Например, когда требуется одновременно выполнить проверку и для обычного сертификата, и для wildcard-сертификата.
-   Рекомендуется удалять неактуальные TXT-записи, т.к. из-за большого размера ответа сервера при проверке Let's Encrypt признает проверку неудачной.
-   Плюсы:
    -   Подходит для сертификатов с подстановкой (wildcard-сертификатов).
    -   Одна запись для нескольких web-серверов.
-   Минусы:
    -   У DNS-провайдера может не быть своего API.
    -   Хранение учётной записи для DNS API небезопасно.
    -   DNS API может не быть методов оценки период обновления записей.


## <span class="section-num">4</span> Получение сертификатов {#получение-сертификатов}


### <span class="section-num">4.1</span> Сертификаты DNS {#сертификаты-dns}


#### <span class="section-num">4.1.1</span> Общая информация {#общая-информация}

-   Для выпуска wildcard-сертификата необходимо выполнить _DNS challenge request_, используя протокол ACMEv2.
-   _DNS challenge_ представляет собой запись TXT, предоставленную клиентом _certbot_, которую необходимо установить вручную в DNS.
-   Нужно будет обновлять DNS при каждом обновлении сертификатов.
    -   Чтобы не делать это вручную, воспользуйтесь _rfc2136_, для которого в Certbot есть плагин `certbot-dns-rfc2136`.
    -   Также необходимо настроить DNS-сервер, чтобы разрешить динамическое обновление TXT-записей.
-   Документация: <https://certbot-dns-rfc2136.readthedocs.io/>


#### <span class="section-num">4.1.2</span> Установка программного обеспечения {#установка-программного-обеспечения}

-   Установка плагина `certbot-dns-rfc2136` для _Snap_:

    ```shell
    snap set certbot trust-plugin-with-root=ok
    sudo snap install certbot-dns-rfc2136
    ```
-   Сам _Certbot_ может находиться на произвольном сервере.


#### <span class="section-num">4.1.3</span> Настройка BIND {#настройка-bind}

-   Сгенерируйте секретный TSIG-ключ:

    ```shell
    tsig-keygen -a HMAC-SHA512 example-key
    ```

    -   Здесь `example-key` --- имя вашего ключа. Выбирается произвольно. Можно назвать по имени домена.
-   Добавьте ключ в файл конфигурации _Bind_ `/etc/named.conf`:

    ```conf-unix
    // /etc/named.conf

    zone "domain.ltd" IN {
    	// this is for certbot
    	update-policy {
    		grant example-key name _acme-challenge.domain.ltd. txt;
    	};
    };

    key "example-key" {
    	algorithm hmac-sha512;
    	secret "секретный_ключ";
    };
    ```
-   Перезапустите _named_:

    ```shell
    systemctl restart named.service
    ```


#### <span class="section-num">4.1.4</span> Настройка certbot {#настройка-certbot}

-   Сгенерируйте файл конфигурации для плагина _rfc2136_ `/etc/letsencrypt/rfc2136_domain.ltd.ini`:

    ```ini
    # Target DNS server
    dns_rfc2136_server = IP-адрес
    # Target DNS port
    dns_rfc2136_port=53
    # TSIG key name
    dns_rfc2136_name = example-key
    # TSIG key secret
    dns_rfc2136_secret = ключ_без_кавычек
    # TSIG key algorithm
    dns_rfc2136_algorithm = HMAC-SHA512
    ```
-   Поправьте права доступа:

    ```shell
    chmod 600 /etc/letsencrypt/rfc2136_domain.ltd.ini
    ```


#### <span class="section-num">4.1.5</span> Получение сертификата {#получение-сертификата}

-   Выполните команду

    ```shell
    certbot certonly \
    	--dns-rfc2136 --force-renewal \
    	--dns-rfc2136-credentials /etc/letsencrypt/rfc2136_domain.ltd.ini \
    	--server https://acme-v02.api.letsencrypt.org/directory \
    	--email example@domain.ltd \
    	--agree-tos --no-eff-email \
    	--dns-rfc2136-propagation-seconds 60 \
    	-d 'domain.ltd' -d '*.domain.ltd'
    ```
-   Сертификаты помещаются в каталог `/etc/letsencrypt/live/domain.ltd`.


### <span class="section-num">4.2</span> Сертификаты HTTP {#сертификаты-http}


#### <span class="section-num">4.2.1</span> Сервер _Apache_ {#сервер-apache}

-   Плагин `certbot-apache` предоставляет автоматическую настройку _Apache HTTP Server_.
-   Он пытается найти конфигурацию каждого домена, а также добавляет рекомендованные для безопасности параметры, настройки использования сертификатов и пути к сертификатам Let's Encrypt.
-   Первоначальная настройка виртуальных хостов:

    ```shell
    certbot --apache
    ```
-   Обновление сертификатов:

    ```shell
    certbot renew
    ```
-   Изменение сертификатов без изменения файлов конфигурации _apache_:

    ```shell
    certbot --apache certonly
    ```


#### <span class="section-num">4.2.2</span> Сервер _Nginx_ {#сервер-nginx}

-   Плагин `certbot-nginx` предоставляет автоматическую настройку _Nginx HTTP Server_.
-   Он пытается найти конфигурацию каждого домена, а также добавляет рекомендованные для безопасности параметры, настройки использования сертификатов и пути к сертификатам Let's Encrypt.
-   Первоначальная настройка виртуальных хостов:

    ```shell
    certbot --nginx
    ```
-   Обновление сертификатов:

    ```shell
    certbot renew
    ```
-   Изменение сертификатов без изменения файлов конфигурации _nginx_:

    ```shell
    certbot --nginx certonly
    ```
