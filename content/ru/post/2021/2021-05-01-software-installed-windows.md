---
title: "Программное обеспечение, устанавливаемое на Windows"
date: 2021-05-01T16:38:00+03:00
lastmod: 2021-05-14T13:00:00+03:00
tags: ["windows", "education"]
categories: ["computer-science"]
draft: false
slug: "software-installed-windows"
---

Обычно при проведении занятий используется Linux. Но часть программного обеспечения можно установить и на Windows.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Предварительные сведения {#предварительные-сведения}

-   Из-за специфики кодировки символов в Windows следует избегать кириллических символов в пути запуска и исполнения программ.


## <span class="section-num">2</span> Базовое программное обеспечение {#базовое-программное-обеспечение}

-   Вначале устанавливается пакетный менеджер Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})).
    -   Установка проводится в PowerShell.
        -   PowerShell должен быть запущен с правами администратора.
        -   Проще всего запустить его комбинаций клавиш `Win+X`.
    -   Команда установки находится на странице <https://chocolatey.org/install>.

        {{< youtube _1O4vKHhm3I >}}
-   Настройка автоматического обновления программного обеспечения:

    ```shell
    choco install choco-upgrade-all-at --params "'/DAILY:yes /TIME:10:00 /ABORTTIME:18:00'"
    ```
-   Файловый менеджер Far:

    ```shell
    choco install far -y
    ```

    {{< youtube B3VhT_Ynt1Y >}}


## <span class="section-num">3</span> Средства разработки {#средства-разработки}

-   Редактор Visual Studio Code:

    ```shell
    choco install vscode
    ```


## <span class="section-num">4</span> Общие средства для отчётов по лабораторным работам {#общие-средства-для-отчётов-по-лабораторным-работам}

-   Средство управления версиями git (см. [Система контроля версий git]({{< relref "2020-12-07-git-cvs" >}})):

    ```shell
    choco install git -y
    ```
-   Средство `pandoc` для работы с языком разметки Markdown:

    ```shell
    choco install pandoc -y
    ```

    -   Пакет `pandoc-crossref` заброшен, пользоваться им нельзя. Придётся ставить вручную, скачав с сайта <https://github.com/lierdakil/pandoc-crossref>.
        -   При установке `pandoc-crossref` следует обращать внимание, для какой версии `pandoc` он скомпилён.
-   Для генерации формата `pdf` необходимо установить TeX. Будем устанавливать TeX Live:

    ```shell
    choco install texlive -y
    ```


## <span class="section-num">5</span> Средства моделирования {#средства-моделирования}


### <span class="section-num">5.1</span> Scilab {#scilab}

-   Scilab - открытая реализация языка MATLAB.
-   <https://www.scilab.org/>
-   Отличительной особенностью является наличие реализации (Xcos) среды _Symulink_.
-   Установка:

    ```shell
    choco install scilab -y
    ```


### <span class="section-num">5.2</span> OpenModelica {#openmodelica}

-   Открытая реализация языка _Modelica_.
-   <https://www.openmodelica.org/>
-   Установка:

    ```shell
    choco install openmodelica -y
    ```


### <span class="section-num">5.3</span> CPN Tools {#cpn-tools}

-   Работа с раскрашенными сетями Петри.
-   <https://cpntools.org/>
-   Установка:

    ```shell
    choco install cpntools -y
    ```


## <span class="section-num">6</span> Backlinks {#backlinks}

-   [Администрирование Windows]({{< relref "2021-05-01-windows-administration" >}})
