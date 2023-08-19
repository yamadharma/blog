---
title: "Литературное программирование"
author: ["Dmitry S. Kulyabov"]
date: 2023-08-05T19:47:00+03:00
lastmod: 2023-08-13T13:37:00+03:00
tags: ["article", "programming"]
categories: ["computer-science"]
draft: false
slug: "literate-programming"
---

Литературное программирование.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Автором метода является Дональд Кнут [<a href="#citeproc_bib_item_2">2</a>].
-   Распространённое название: _Грамотное программирование_.
-   Литературное программирование --- метод разработки, нацеленный на повышение познаваемости программ и основанный на встраивании исходного кода в документацию.
-   Познаваемость программы --- свойство исходного кода и сопроводительной документации, которое характеризует объём умственных усилий, затрачиваемых читателем на понимание программы в целом и её частей в частности.
-   Объектом воздействия в литературном программировании является мозг человека, а не компьютер.


### <span class="section-num">1.1</span> Идеология метода {#идеология-метода}

-   Программа оформляется как книга.
-   Исходный код разбивается на кусочки и рассредотачивается по документации.
-   Кусочки кода связываются посредством гиперссылок.
-   Первична документация.
-   За основу берётся описание программы, в которое вставляются кусочки исходного кода.
-   Для встраивания кода в документацию применяется специальная разметка текста.


## <span class="section-num">2</span> Принципы реализации методики литературного программирования {#принципы-реализации-методики-литературного-программирования}

-   Программа составляется из кусочков (фрагментов).
-   Каждый фрагмент содержит блок кода и описывающую его документацию.
-   Фрагменты связываются гиперссылками.
-   Все фрагменты хранятся вместе, в одном физическом источнике.


### <span class="section-num">2.1</span> Служебные программы {#служебные-программы}

-   Программа `weave` обрабатывает источник и формирует документ, предназначенный человеку.
    -   В этом документе программа представлена в виде книги для чтения, в которой код перемежается с описанием.
-   Программа `tangle` извлекает из того же самого источника исходные коды и формирует из них файлы, предназначенные компилятору.
    -   В этих файлах программа представлена в том виде, как того требует целевой язык программирования.


## <span class="section-num">3</span> Статьи {#статьи}

-   [Knuth, D. E. (1984): Literate Programming]({{< relref "2023-08-06-knuth_1984_literate-programming_en" >}}) [<a href="#citeproc_bib_item_2">2</a>]
-   [Schulte, E. et al. (2012): A multi-language computing environment for literate programming and reproducible research]({{< relref "2023-08-06-schulte_2012_multi-language-literat-programming_en" >}}) [<a href="#citeproc_bib_item_3">3</a>]
-   [Kery, M. B. et al. (2018): The story in the notebook]({{< relref "2023-08-07-kery_2018_story-notebook_en" >}}) [<a href="#citeproc_bib_item_1">1</a>]

## Литература

<div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>1.	Kery M. B. <a href="https://doi.org/10.1145/3173574.3173748">The story in the notebook</a> / M. B. Kery, M. Radensky, M. Arya [и др.] // Proceedings of the 2018 chi conference on human factors in computing systems. – ACM, 2018. – Сс. 1–11.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_2"></a>2.	Knuth D. E. <a href="https://doi.org/10.1093/comjnl/27.2.97">Literate programming</a> / D. E. Knuth // The computer journal. – 1984. – Т. 27. – № 2. – Сс. 97–111.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_3"></a>3.	Schulte E. <a href="https://doi.org/10.18637/jss.v046.i03">A multi-language computing environment for literate programming and reproducible research</a> / E. Schulte, D. Davison, T. Dye, C. Dominik // Journal of statistical software. – 2012. – Т. 46. – № 3.</div>
</div>
