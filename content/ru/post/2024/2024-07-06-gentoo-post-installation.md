---
title: "Gentoo. Постустановка"
author: ["Dmitry S. Kulyabov"]
date: 2024-07-06T16:06:00+03:00
lastmod: 2024-08-14T12:02:00+03:00
tags: ["sysadmin", "gentoo", "linux"]
categories: ["computer-science"]
draft: false
slug: "gentoo-post-installation"
---

Постустановка Gentoo.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Описание моей настройки Gentoo.


## <span class="section-num">2</span> Настройка репозиториев {#настройка-репозиториев}

-   Настройка репозиториев исходит из того, что я использую свой репозиторий с конфигурациями (см. [Gentoo. Репозиторий karma]({{< relref "2024-05-25-gentoo-karma-repository" >}})).


### <span class="section-num">2.1</span> Репозиторий gentoo {#репозиторий-gentoo}

-   Установите основной репозиторий (если это ещё не сделано):
    ```shell
    emaint sync -r gentoo
    chown -R portage:portage /var/db/repos/gentoo
    ```


### <span class="section-num">2.2</span> Репозитории karma {#репозитории-karma}

-   Установите репозитории с настройками (см. [Gentoo. Репозиторий karma]({{< relref "2024-05-25-gentoo-karma-repository" >}}))
-   Добавьте репозиторий `karma`:
    ```shell
    eselect repository add karma git https://github.com/yamadharma/karma.git
    emaint sync -r karma
    chown -R portage:portage /var/db/repos/karma
    ```

-   Добавьте репозиторий `karma-profiles`:
    ```shell
    eselect repository add karma-profiles git https://github.com/yamadharma/karma-profiles.git
    emaint sync -r karma-profiles
    chown -R portage:portage /var/db/repos/karma-profiles
    ```

-   Сделайте ссылки на файлы конфигурации:
    ```shell
    . /var/db/repos/karma-profiles/scripts/portage
    ```


### <span class="section-num">2.3</span> Синхронизация репозиториев {#синхронизация-репозиториев}

-   Синхронизуйте репозитории:
    ```shell
    emaint sync
    ```


### <span class="section-num">2.4</span> Дополнительные оверлеи {#дополнительные-оверлеи}

-   [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})


#### <span class="section-num">2.4.1</span> guru {#guru}

-   Добавление репозитория guru:
    ```shell
    eselect repository enable guru
    ```


#### <span class="section-num">2.4.2</span> gentoo-zh {#gentoo-zh}

-   Добавление репозитория gentoo-zh:
    ```shell
    eselect repository enable gentoo-zh
    ```


#### <span class="section-num">2.4.3</span> science {#science}

-   Добавление репозитория science:
    ```shell
    eselect repository enable science
    ```


## <span class="section-num">3</span> Установка программного обеспечения {#установка-программного-обеспечения}


### <span class="section-num">3.1</span> Работа в консоли {#работа-в-консоли}

-   Для установки всего необходимого для работы в консоли необходимо использовать файл `term.sh`:
    ```shell
    ### Terminal
    ```


#### <span class="section-num">3.1.1</span> Файловый менеджер mc {#файловый-менеджер-mc}

-   [Файловый менеджер Midnight Commander]({{< relref "2023-08-26-midnight-commander-file-manager" >}})
-   Установка файлового менеджера mc:
    ```shell
    ## Установка файлового менеджера mc
    emerge app-misc/mc
    ```


### <span class="section-num">3.2</span> Графическое окружение {#графическое-окружение}


#### <span class="section-num">3.2.1</span> KDE {#kde}

-   Для установки KDE необходимо использовать файл `kde.sh`:
    ```shell
    ### KDE
    ```

-   Установим все программы KDE:
    ```shell
    ## Install all KDE programs
    emerge kde-apps/kde-apps-meta
    ```


#### <span class="section-num">3.2.2</span> Gnome {#gnome}

-   Для установки Gnome необходимо использовать файл `gnome.sh`:
    ```shell
    ### Gnome
    ```


#### <span class="section-num">3.2.3</span> Sway {#sway}

-   [Переход на Sway]({{< relref "2020-09-10-migration-sway" >}})
-   Для установки Gnome необходимо использовать файл `sway.sh`:
    ```shell
    ### Sway
    ```

<!--list-separator-->

1.  Sway

    -   Установим собственно Sway:
        ```shell
        emerge gui-wm/sway
        ```

<!--list-separator-->

2.  Работа с буфером обмена

    -   Общие программы для работы с буфером обмена:
        ```shell
        ## Wayland clipboard
        emerge gui-apps/wl-clipboard
        ```

    -   Установим `cliphist` (репозиторий `guru`):
        ```shell
        emerge app-misc/cliphist
        ```


### <span class="section-num">3.3</span> Средства разработки {#средства-разработки}

-   Для установки всего необходимого для работы в консоли необходимо использовать файл `dev.sh`:
    ```shell
    ### Dev tools
    ```


#### <span class="section-num">3.3.1</span> git {#git}

<!--list-separator-->

1.  github

<!--list-separator-->

2.  gitea

    -   Утилиты для работы с Gitea.
        ```shell
        ## Gitea
        ```
    -   Утилита командной строки для работы с сервером Gitea (см. [Взаимодействие с gitea из командной строки]({{< relref "2023-11-11-interacting-gitea-command-line" >}})):
        ```shell
        emerge dev-util/tea
        ```


#### <span class="section-num">3.3.2</span> python {#python}

-   Утилиты для работы с python.
    ```shell
    ## Python
    ```

<!--list-separator-->

1.  pipx

    -   Установка пакетов python:
        ```shell
        emerge dev-python/pipx
        ```


#### <span class="section-num">3.3.3</span> Node.js {#node-dot-js}

-   Утилиты для работы с Node.js.
    ```shell
    ## Node.js
    ```

<!--list-separator-->

1.  pnpm

    -   Управление пакетами Node.js (оверлей `karma`, см. [Gentoo. Репозиторий karma]({{< relref "2024-05-25-gentoo-karma-repository" >}})):
        ```shell
        emerge sys-apps/pnpm-bin
        ```

<!--list-separator-->

2.  yarn

    -   Управление пакетами Node.js:
        ```shell
        emerge sys-apps/yarn
        ```


### <span class="section-num">3.4</span> Редакторы {#редакторы}

-   Для установки редакторов необходимо использовать файл `edit.sh`:
    ```shell
    ### Edit
    ```


#### <span class="section-num">3.4.1</span> Zed {#zed}

-   Установка редактора _Zed_ (оверлей `gentoo-zh`):
    ```shell
    ## Установка редактора Zed
    # emerge app-editors/zed
    ```


#### <span class="section-num">3.4.2</span> VScode {#vscode}

-   Установка редактора _VSCode_:
    ```shell
    ## Установка редактора VSCode
    emerge app-editors/vscode
    ```

-   Установка редактора набора LSP-серверов для _VSCode_ (оверлей `guru`):
    ```shell
    emerge dev-util/vscode-langservers-extracted
    ```


#### <span class="section-num">3.4.3</span> Emacs {#emacs}


#### <span class="section-num">3.4.4</span> Vim {#vim}


### <span class="section-num">3.5</span> Обслуживание системы {#обслуживание-системы}

-   Для установки системных утилит необходимо использовать файл `sys.sh`:
    ```shell
    ### System tools
    ```


#### <span class="section-num">3.5.1</span> Дедупликация файлов {#дедупликация-файлов}

-   Установим _jdupes_ (см. [Дедупликация файлов. jdupes]({{< relref "2024-02-23-file-deduplication-jdupes" >}})):
    ```shell
    emerge jdupes
    ```


### <span class="section-num">3.6</span> Утилиты пользователя {#утилиты-пользователя}

-   Для установки пользовательских утилит необходимо использовать файл `user.sh`:
    ```shell
    ### User utils
    ```


#### <span class="section-num">3.6.1</span> Менеджер закладок buku {#менеджер-закладок-buku}

-   [Менеджер закладок buku]({{< relref "2024-06-22-buku-bookmark-manager" >}})
-   Установим менеджер закладок:
    ```shell
    ## Buku
    emerge www-misc/buku
    ```
-   Установим интерфейс к броузеру:
    ```shell
    emerge www-misc/bukubrow-bin
    ```
