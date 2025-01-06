---
title: "Emacs. Отложенное чтение. wallabag.el"
author: ["Dmitry S. Kulyabov"]
date: 2025-01-03T14:36:00+03:00
lastmod: 2025-01-03T14:48:00+03:00
tags: ["emacs"]
categories: ["computer-science"]
draft: false
slug: "emacs-wallabagel"
---

Emacs. Отложенное чтение. wallabag.el.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/chenyanming/wallabag.el>
-   Интерфейс для использование приложения отложенного чтения Wallabag (см. [Отложенное чтение. Wallabag]({{< relref "2024-12-05-read-it-later-wallabag" >}}))


## <span class="section-num">2</span> Установка {#установка}

-   Необходимо задать параметры подключения к сервису:
    ```elisp
    (require 'wallabag)
    (setq wallabag-host "https://xx.xx.xx") ;; wallabag server host name
    (setq wallabag-username "xx") ;; username
    (setq wallabag-password "xx") ;; password
    (setq wallabag-clientid "xx") ;; created with API clients management
    (setq wallabag-secret "xx") ;; created with API clients management
    ```

    -   Запуск с помощью `M-x wallabag`.


### <span class="section-num">2.1</span> Использование `auth-sources` {#использование-auth-sources}

-   Создайте зашифрованный `~/.authinfo.gpg`  файл со строками:
    ```conf-unix
    machine <wallabag-host> login <username> password <password>
    machine <wallabag-client> login <client-id> password <client-secret>

    ```
-   Используйте при настройке пароля Wallabag и секретных переменных:
    ```elisp
    (setq wallabag-password (auth-source-pick-first-password :host "<wallabag-host>")
          wallabag-secret (auth-source-pick-first-password :host "<wallabag-client>"))
    ```
