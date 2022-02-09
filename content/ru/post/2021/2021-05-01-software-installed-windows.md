---
title: "Программное обеспечение, устанавливаемое на Windows"
author: ["Dmitry S. Kulyabov"]
date: 2021-05-01T16:38:00+03:00
lastmod: 2022-02-09T17:12:00+03:00
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

-   Вначале устанавливается пакетный менеджер _Chocolatey_ (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})).
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


### <span class="section-num">4.1</span> Средство управления версиями git {#средство-управления-версиями-git}

-   Установим средство управления версиями git (см. [Система контроля версий git]({{< relref "2020-12-07-git-cvs" >}})) через пакетный менеджер:

    ```shell
    choco install git -y
    ```


### <span class="section-num">4.2</span> Работа с языком разметки Markdown {#работа-с-языком-разметки-markdown}

-   Средство `pandoc` для работы с языком разметки Markdown:
    -   Установка с помощью менеджера пакетов

        ```shell
        choco install pandoc --ia=ALLUSERS=1 -y
        ```

        -   Для работы с перекрёстными ссылками мы используем пакет `pandoc-crossref`.
            -   Пакет `pandoc-crossref` в _Chocolatey_ заброшен, пользоваться им нельзя. Придётся ставить вручную, скачав с сайта <https://github.com/lierdakil/pandoc-crossref>.
            -   При установке `pandoc-crossref` следует обращать внимание, для какой версии `pandoc` он скомпилён.
    -   Лучше установить `pandoc` и `pandoc-crossref` вручную.
        -   Скачайте необходимую версию `pandoc-crossref` (<https://github.com/lierdakil/pandoc-crossref/releases>).
        -   Посмотрите, для какой версии откомпилён `pandoc-crossref`.
        -   Скачайте соответствующую версию `pandoc` (<https://github.com/jgm/pandoc/releases>).
        -   Распакуйте архивы.
        -   Обе программы собраны в виде статически-линкованных бинарных файлов.
        -   Поместите их либо в каталог проекта, либо в каталог, который присутствует в переменной `%PATH%`.


### <span class="section-num">4.3</span> Работа с языком TeX {#работа-с-языком-tex}

-   Для генерации формата `pdf` необходимо установить TeX. Будем устанавливать TeX Live:

    ```shell
    choco install texlive -y
    ```


## <span class="section-num">5</span> Средства моделирования {#средства-моделирования}


### <span class="section-num">5.1</span> Scilab {#scilab}

-   Scilab --- открытая реализация языка MATLAB.
-   Сайт: <https://www.scilab.org/>
-   Отличительной особенностью является наличие реализации (Xcos) среды _Symulink_.
-   Установка:

    ```shell
    choco install scilab -y
    ```


### <span class="section-num">5.2</span> Octave {#octave}

-   Octave --- открытая реализация языка MATLAB.
-   Сайт: <https://www.gnu.org/software/octave/>
-   Достаточно строгая реализация языка Matlab.
-   Установка:

    ```shell
    choco install octave -y
    ```
-   Видео:

    {{< youtube LRjtS8cyrdM >}}


### <span class="section-num">5.3</span> OpenModelica {#openmodelica}

-   Открытая реализация языка _Modelica_.
-   <https://www.openmodelica.org/>
-   Установка:

    ```shell
    choco install openmodelica -y
    ```


### <span class="section-num">5.4</span> CPN Tools {#cpn-tools}

-   Работа с раскрашенными сетями Петри.
-   <https://cpntools.org/>
-   Установка:

    ```shell
    choco install cpntools -y
    ```
