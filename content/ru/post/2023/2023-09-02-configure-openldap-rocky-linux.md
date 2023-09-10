---
title: "Настройка Openldap"
author: ["Dmitry S. Kulyabov"]
date: 2023-09-02T19:53:00+03:00
lastmod: 2023-09-02T20:14:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "configure-openldap-rocky-linux"
---

Настройка Openldap.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Установка Openldap {#установка-openldap}

-   Установка сервера openldap:
    ```shell
    dnf -y install openldap-servers openldap-clients
    ```
-   Запуск сервера openldap:
    ```shell
    systemctl enable --now slapd
    ```


## <span class="section-num">2</span> Пароль администратора {#пароль-администратора}

-   Для генерации значения пароля пользователя, подходящего для использования с `ldapadd` или `ldapmodify` используется утилита `slappasswd`.
-   Вначале хэша пароля начинающийся алгоритм хэша (например `{SSHA}`).
-   Создайте хеш пароля:
    ```shell
    slappasswd > /etc/openldap/certs/password
    ```
