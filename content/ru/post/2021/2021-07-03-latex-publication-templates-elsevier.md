---
title: "LaTeX. Шаблоны публикаций. Elsevier"
date: 2021-07-03T20:26:00+03:00
lastmod: 2021-07-04T10:16:00+03:00
tags: ["tex"]
categories: ["computer-science"]
draft: false
slug: "latex-publication-templates-elsevier"
---

Подготовка публикаций для издательства _Elsevier_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Основная информация {#основная-информация}

-   Используется два класса:
    -   классический: elsarticle;
    -   новый: cas.


### <span class="section-num">1.1</span> Elsarticle {#elsarticle}

-   CTAN: <http://www.ctan.org/tex-archive/macros/latex/contrib/elsarticle>
-   Шаблон статьи: <https://www.elsevier.com/%5F%5Fdata/assets/file/0007/56842/elsarticle-template.zip>


### <span class="section-num">1.2</span> Cas {#cas}

-   Класс имеет два варианта:
    -   с одним столбцом (cas-sc.cls);
    -   с двумя столбцами (cas-dc.cls).
-   CTAN: <https://www.ctan.org/pkg/els-cas-templates/>
-   Шаблон статьи: <http://mirrors.ctan.org/macros/latex/contrib/els-cas-templates.zip>


## <span class="section-num">2</span> Тонкая настройка {#тонкая-настройка}


### <span class="section-num">2.1</span> Раздел _Благодарности_ {#раздел-благодарности}

-   В _elsarticle_ отсутствует команда для раздела _Acknowledgements_ ( _Благодарности_).
-   Следует явно задать раздел:

    ```latex
    \section*{Acknowledgement}
    ```
