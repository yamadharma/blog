---
title: "Pdf. Оглавление. pdf.tocgen"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-21T20:36:00+03:00
lastmod: 2024-06-22T16:37:00+03:00
tags: ["pdf"]
categories: ["computer-science"]
draft: false
slug: "pdf-toc-pdf-tocgen"
---

Pdf. Оглавление. pdf.tocgen.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/Krasjet/pdf.tocgen>
-   Сайт: <https://krasjet.com/voice/pdf.tocgen/>


## <span class="section-num">2</span> Установка {#установка}

-   Устанавливается как python-пакет:
    ```shell
    pipx install pdf.tocgen
    ```


## <span class="section-num">3</span> Рабочий процесс {#рабочий-процесс}

-   Пакет pdf.tocgen состоит из 3 отдельных программ:
    -   `pdfxmeta` : извлечь метаданные (атрибуты шрифта, позиции) заголовков в создать файл рецепта;
    -   `pdftocgen` : создать оглавление из рецепта;
    -   `pdftocio` : импортировать оглавление в документ PDF.
-   Используем `pdfxmeta` для поиска метаданных заголовков и генерации фильтры заголовков с использованием автоматической настройки:
    ```shell
    pdfxmeta -p <page> -a 1 in.pdf "Section" >> recipe.toml
    pdfxmeta -p <page> -a 2 in.pdf "Subsection" >> recipe.toml
    ```

    -   Здесь `<page>` есть номер страницы в файле.
-   Файл `recipe.toml` будет содержать несколько фильтров заголовков.
-   Пример файла рецепта будет выглядеть так:
    ```toml
    [[heading]]
    level = 1
    greedy = true
    font.name = "Times-Bold"
    font.size = 19.92530059814453

    [[heading]]
    level = 2
    greedy = true
    font.name = "Times-Bold"
    font.size = 11.9552001953125
    ```
-   Передадим рецепт программе `pdftocgen` для создания оглавления:
    ```shell
    pdftocgen in.pdf < recipe.toml
    ```
-   В результате получим текст оглавления следующего вида:
    ```conf-unix
    "Preface" 5
        "Bottom-up Design" 5
        "Plan of the Book" 7
        "Examples" 9
        "Acknowledgements" 9
    "Contents" 11
    "The Extensible Language" 14
        "1.1 Design by Evolution" 14
        "1.2 Programming Bottom-Up" 16
        "1.3 Extensible Software" 18
        "1.4 Extending Lisp" 19
        "1.5 Why Lisp (or When)" 21
    "Functions" 22
        "2.1 Functions as Data" 22
        "2.2 Defining Functions" 23
        "2.3 Functional Arguments" 26
        "2.4 Functions as Properties" 28
        "2.5 Scope" 29
        "2.6 Closures" 30
        "2.7 Local Functions" 34
        "2.8 Tail-Recursion" 35
        "2.9 Compilation" 37
        "2.10 Functions from Lists" 40
    "Functional Programming" 41
        "3.1 Functional Design" 41
        "3.2 Imperative Outside-In" 46
        "3.3 Functional Interfaces" 48
        "3.4 Interactive Programming" 50
    ```
-   Его можно сразу импортировать в файл PDF с помощью `pdftocio`:
    ```shell
    $ pdftocgen in.pdf < recipe.toml | pdftocio -o out.pdf in.pdf
    ```
-   Можно отредактировать оглавление перед его импортом:
    ```shell
    pdftocgen in.pdf < recipe.toml > toc
    pdftocio in.pdf < toc
    ```


## <span class="section-num">4</span> Примеры  использования {#примеры-использования}


### <span class="section-num">4.1</span> pdftocio {#pdftocio}

-   Отобразить существующее оглавление PDF-файла в stdout:
    ```shell
    pdftocio doc.pdf
    ```

-   Записать существующее оглавление PDF-файла в файл с именем toc:
    ```shell
    pdftocio doc.pdf > toc
    ```

-   Записать оглавление из toc-файла в doc.pdf:
    ```shell
    pdftocio doc.pdf < toc
    ```

-   Указать имя выходного PDF-файла:
    ```shell
    pdftocio -o out.pdf doc.pdf < toc
    ```

-   Скопировать оглавление из doc1.pdf в doc2.pdf:
    ```shell
    pdftocio -v doc1.pdf | pdftocio doc2.pdf
    ```

    -   Флаг `-v` помогает сохранить вертикальные позиции заголовков при копировании.
-   Вывести оглавление для чтения:
    ```shell
    pdftocio -H doc.pdf
    ```


### <span class="section-num">4.2</span> pdftocgen {#pdftocgen}

-   Применить существующий рецепт `rcp.toml` к файлу `doc.pdf` (результат дублируется в `stdout`):
    ```shell
    pdftocgen doc.pdf < rcp.toml
    ```

-   Вывести оглавление в файл с именем `toc`:
    ```shell
    pdftocgen doc.pdf < rcp.toml > toc
    ```

-   Импортировать созданное оглавление в файл PDF и вывести в doc_out.pdf:
    ```shell
    pdftocgen doc.pdf < rcp.toml | pdftocio -o doc_out.pdf doc.pdf
    ```

-   Вывести сгенерированное оглавление для чтения:
    ```shell
    pdftocgen -H doc.pdf < rcp.toml
    ```

-   Если вы хотите включить вертикальное положение на странице для каждого заголовка, используйте флаг `-v`:
    ```shell
    pdftocgen -v doc.pdf < rcp.toml
    ```


### <span class="section-num">4.3</span> pdfxmeta {#pdfxmeta}

-   Искать слово `Anaphoric` во всем PDF:
    ```shell
    pdfxmeta onlisp.pdf "Anaphoric"
    ```

-   Вывести результат в виде фильтра заголовков с автоматическими настройками:
    ```shell
    pdfxmeta -a 1 onlisp.pdf "Anaphoric"
    ```

-   Поиск без учета регистра `Anaphoric` во всем PDF:
    ```shell
    pdfxmeta -i onlisp.pdf "Anaphoric"
    ```

-   Использование регулярного выражения для поиска без учета регистра `Anaphoric` в PDF-файле:
    ```shell
    pdfxmeta onlisp.pdf "[Aa]naphoric"
    ```

-   Поиск только на странице 203:
    ```shell
    pdfxmeta -p 203 onlisp.pdf "anaphoric"
    ```
