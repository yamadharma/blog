---
title: "BibTeX. Поля"
author: ["Dmitry S. Kulyabov"]
date: 2023-07-11T18:07:00+03:00
lastmod: 2023-07-11T19:09:00+03:00
tags: ["tex"]
categories: ["computer-science"]
draft: false
slug: "bibtex-fields"
---

Поля базы BibTeX.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Стандартные типы полей {#стандартные-типы-полей}

-   `address`: адрес издателя или учреждения;
-   `annote`: аннотация;
-   `author`: список авторов произведения;
-   `booktitle`: название книги;
-   `chapter`: номер главы в книге;
-   `edition`: номер издания книги;
-   `editor`: список редакторов книги;
-   `howpublished`: дата публикации для нестандартных публикаций;
-   `institution`: название учреждения, опубликовавшего и/или спонсировавшего отчёт;
-   `journal`: название журнала или журнала, в котором была опубликована статья;
-   `month`: месяц публикации работы;
-   `note`: примечания;
-   `number`: номер отчета или номер выпуска журнальной статьи;
-   `organization`: название учреждения, которое организовало или спонсировало конференцию или опубликовало руководство;
-   `pages`: номера страниц или диапазон страниц;
-   `publisher`: издательство;
-   `school`: название университета или учреждения, присуждающего степень;
-   `series`: название серии или набора книг;
-   =title =: название работы;
-   `type`: тип технического отчета или диссертации;
-   `volume`: номер тома;
-   `year`: год публикации работы.


## <span class="section-num">2</span> Нестандартные типы полей {#нестандартные-типы-полей}

-   Поддерживаются не всеми стилями BibTeX:
    -   `doi`: номер DOI (например, 10.1038/d41586-018-07848-2)
    -   `issn`: номер ISSN (например, 1476-4687)
    -   `isbn`: номер ISBN (например, 9780201896831)
    -   `url`: URL-адрес веб-страницы.