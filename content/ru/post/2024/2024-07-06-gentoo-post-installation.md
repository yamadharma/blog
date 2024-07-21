---
title: "Gentoo. Постустановка"
author: ["Dmitry S. Kulyabov"]
date: 2024-07-06T16:06:00+03:00
lastmod: 2024-07-21T17:03:00+03:00
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
    #!/bin/sh
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

-   Установим все программы KDE:
    ```shell
    emerge kde-apps/kde-apps-meta
    ```


#### <span class="section-num">3.2.2</span> Gnome {#gnome}


### <span class="section-num">3.3</span> Редакторы {#редакторы}

-   Для установки всего необходимого для работы в консоли необходимо использовать файл `edit.sh`:
    ```shell
    #!/bin/sh
    ```


#### <span class="section-num">3.3.1</span> Zed {#zed}

-   Установка редактора _Zed_ (оверлей `gentoo-zh`):
    ```shell
    ## Установка редактора Zed
    # emerge app-editors/zed
    ```


#### <span class="section-num">3.3.2</span> VScode {#vscode}

-   Установка редактора _VSCode_:
    ```shell
    ## Установка редактора VSCode
    emerge app-editors/vscode
    ```

-   Установка редактора набора LSP-серверов для _VSCode_ (оверлей `guru`):
    ```shell
    emerge dev-util/vscode-langservers-extracted
    ```


#### <span class="section-num">3.3.3</span> Emacs {#emacs}


#### <span class="section-num">3.3.4</span> Vim {#vim}
