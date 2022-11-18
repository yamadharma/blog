---
title: "Управление файлами конфигурации. Chezmoi"
author: ["Dmitry S. Kulyabov"]
date: 2022-10-28T19:49:00+03:00
lastmod: 2022-10-28T20:26:00+03:00
draft: false
slug: "configuration-file-management-chezmoi"
---

Использование chezmoi для управления файлами конфигурации домашнего каталога пользователя.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://www.chezmoi.io/>
-   Репозиторий: <https://github.com/twpayne/chezmoi>


## <span class="section-num">2</span> Установка {#установка}

-   Установка бинарного файла:
    -   с помощью `curl`:
        ```shell
        sh -c "$(curl -fsLS chezmoi.io/get)"
        ```

    -   с помощью `wget`:
        ```shell
        sh -c "$(wget -qO- chezmoi.io/get)"
        ```

    -   с помощью PowerShell:
        ```shell
        (iwr -UseBasicParsing https://chezmoi.io/get.ps1).Content | powershell -c -
        ```
-   Linux
    -   Gentoo
        -   overlay _ace_ (<https://github.com/ananace/overlay>):
            ```shell
            emerge chezmoi-bin
            ```
    -   Fedora
        -   установка через Snap:
            ```shell
            snap install chezmoi --classic
            ```
-   Windows
    -   установка посредством Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})):
        ```shell
        choco install chezmoi
        ```


## <span class="section-num">3</span> Первоначальная настройка {#первоначальная-настройка}
