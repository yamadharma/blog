---
title: "Программное обеспечение, устанавливаемое на Windows"
date: 2021-05-01T16:38:00+03:00
lastmod: 2021-05-02T20:39:00+03:00
tags: ["windows", "education"]
categories: ["computer-science"]
draft: false
slug: "software-installed-windows"
---

Обычно при проведении занятий используется Linux. Но часть программного обеспечения можно установить и на Windows.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Базовое программное обеспечение {#базовое-программное-обеспечение}

-   Вначале устанавливается пакетный менеджер Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})).
    -   Установка проводится в PowerShell.
        -   PowerShell должен быть запущен с правами администратора.
        -   Проще всего запустить его комбинаций клавиш `Win+X`.
    -   Команда установки находится на странице <https://chocolatey.org/install>.
    -   Настройка автоматического обновления программного обеспечения:

        ```shell
        choco install choco-upgrade-all-at --params "'/DAILY:yes /TIME:10:00 /ABORTTIME:18:00'"
        ```
-   Файловый менеджер Far:

    ```shell
    choco install far -y
    ```


## <span class="section-num">2</span> Средства разработки {#средства-разработки}

-   Редактор Visual Studio Code:

    ```shell
    choco install vscode
    ```


## <span class="section-num">3</span> Общие средства для отчётов по лабораторным работам {#общие-средства-для-отчётов-по-лабораторным-работам}

-   Средство управления версиями git (см. [Система контроля версий git]({{< relref "2020-12-07-git-cvs" >}})):

    ```shell
    choco install git -y
    ```
-   Средство `pandoc` для работы с языком разметки Markdown:

    ```shell
    choco install pandoc -y
    ```

    -   Пакет `pandoc-crossref` заброшен, пользоваться им нельзя. Придётся ставить вручную.
-   Для генерации формата `pdf` необходимо установить TeX. Будем устанавливать TeX Live:

    ```shell
    choco install texlive -y
    ```


## <span class="section-num">4</span> Backlinks {#backlinks}

-   [Администрирование Windows]({{< relref "2021-05-01-windows-administration" >}})
