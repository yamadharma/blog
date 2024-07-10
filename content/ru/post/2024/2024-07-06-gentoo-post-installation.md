---
title: "Gentoo. Постустановка"
author: ["Dmitry S. Kulyabov"]
date: 2024-07-06T16:06:00+03:00
lastmod: 2024-07-09T17:27:00+03:00
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
