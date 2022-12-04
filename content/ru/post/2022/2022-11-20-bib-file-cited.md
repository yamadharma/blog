---
title: "Создание bib-файла с процитированными ссылками"
author: ["Dmitry S. Kulyabov"]
date: 2022-11-20T19:44:00+03:00
lastmod: 2022-12-04T21:17:00+03:00
tags: ["tex"]
categories: ["computer-science"]
draft: false
slug: "bib-file-cited"
---

Как создать bib-файл, в котором будут ссылки, процитированные в тексте.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Прагматика {#прагматика}

-   Использования потока работ с централизованным bib-файлом.
-   Создание очищенного bib-файл для отправки публикации.


## <span class="section-num">2</span> Утилиты {#утилиты}


### <span class="section-num">2.1</span> bibexport {#bibexport}

-   CTAN: <https://ctan.org/pkg/bibexport>
-   Поставляется в дистрибутиве TeX Live.
-   Работает с полями bibtex, не поддерживает biblatex (см. [bibtex vs biblatex]({{< relref "2022-09-11-bibtex-biblatex" >}})).
-   Можно добавить свои поля.
-   Не совместим с _biber_.
-   Использование:
    ```shell
    bibexport -o extracted.bib myarticle.aux
    ```

    -   `extracted.bib` : имя, которое вы хотите дать своему новому bib-файлу;
    -   необходимо указать расширение `.aux` (или вообще не указывать расширение).
-   Если используется централизованная база библиографии, то можно использовать её вместо локально bib-файла:
    ```shell
    bibexport -r ~/work/bib/bib/main.bib -o extracted.bib myarticle.aux
    ```


### <span class="section-num">2.2</span> Jabref {#jabref}

-   Сайт: <https://www.jabref.org/>
-   Работает также с _biblatex_ и _biber_.
-   Можно работать как в режиме командной строки, так и в режиме графического интерфейса.
-   В режиме командной строки:
    ```shell
    jabref -n -a old_ref.aux,new_ref.bib old_ref.bib
    ```

    -   `-n` : отключение графического интерфейса.


### <span class="section-num">2.3</span> bibtool {#bibtool}

-   Сайт: <http://www.gerd-neugebauer.de/software/TeX/BibTool/en/>
-   CTAN: <https://www.ctan.org/pkg/bibtool>
-   Использование:
    ```shell
    bibtool -x article.aux -o NewBib.bib
    ```
