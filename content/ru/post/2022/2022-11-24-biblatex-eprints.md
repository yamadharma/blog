---
title: "Biblatex. Препринты"
author: ["Dmitry S. Kulyabov"]
date: 2022-11-24T16:02:00+03:00
lastmod: 2023-02-16T10:28:00+03:00
tags: ["tex"]
categories: ["computer-science"]
draft: false
slug: "biblatex-eprints"
---

Поддержка препринтов в biblatex.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Biblatex по умолчанию поддерживает только препринты _arxiv.org_.
-   Для подключения других типов препринтов необходимо описать их самостоятельно.
-   В bibtex только некоторые стили поддерживают препринты.


## <span class="section-num">2</span> Поля для описание препринтов {#поля-для-описание-препринтов}

-   Рекомендуется использовать следующие поля для ссылки на ArXiv:
    ```bibtex
    archivePrefix = "arXiv",
    eprint        = "0707.3168",
    primaryClass  = "hep-th",
    ```
-   В _biblatex_ используются другие названия полей (см. [bibtex vs biblatex]({{< relref "2022-09-11-bibtex-biblatex" >}})):

    <div class="table-caption">
      <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1:</span>
      Соответствие полей BibTeX и biblatex для препринтов
    </div>

    | BibTeX        | biblatex    |
    |---------------|-------------|
    | archivePrefix | eprinttype  |
    | primaryClass  | eprintclass |
    | eprint        | eprint      |
-   Следует заметить, что указатель секции `primaryClass` на данный момент не используется в _arXiv_.
-   Пример ссылки на статью, имеющую также вариант на arxiv.org в формате _bibtex_:
    ```bibtex
    @Article{Beneke:1997hv,
         author        = "M. Beneke and G. Buchalla and I. Dunietz",
         title         = "{Mixing induced CP asymmetries in inclusive B decays}",
         journal       = "Phys. Lett.",
         volume        = "B393",
         year          = "1997",
         pages         = "132-142",
         archivePrefix = "arXiv",
         eprint        = "0707.3168",
         primaryClass  = "hep-th"
    }
    ```
-   Пример ссылки на статью, имеющую также вариант на arxiv.org в формате _biblatex_:
    ```bibtex
    @Article{Beneke:1997hv,
         author        = "M. Beneke and G. Buchalla and I. Dunietz",
         title         = "{Mixing induced CP asymmetries in inclusive B decays}",
         journal       = "Phys. Lett.",
         volume        = "B393",
         year          = "1997",
         pages         = "132-142",
         eprinttype    = "arXiv",
         eprint        = "0707.3168",
         eprintlass    = "hep-th"
    }
    ```

-   Ссылка может выглядеть следующим образом:
    ```tex
    [1] M. Beneke and G. Buchalla and I. Dunietz, Mixing induced CP asymmetries in inclusive B decays, Phys. Lett. B393, 132-142, 1997, hep-ph/9609357.
    ```
-   В _BibTeX_ не все стили поддерживают ссылки на препринты.
-   В _BibLaTeX_ ссылки на препринты поддерживаются в ядре системы.


## <span class="section-num">3</span> Архивы препринтов {#архивы-препринтов}


### <span class="section-num">3.1</span> medRxiv {#medrxiv}

-   Сайт: <https://www.medrxiv.org/>.


### <span class="section-num">3.2</span> bioRxiv {#biorxiv}

-   Сайт: <https://www.biorxiv.org/>.


### <span class="section-num">3.3</span> ChemRxiv {#chemrxiv}

-   Сайт: <https://chemrxiv.org/>.


### <span class="section-num">3.4</span> Pubmed Central {#pubmed-central}

-   Идентификатор: `PMCID`.
-   Ссылка на бесплатный полный текст статьи.
-   Вид ссылки: `PMCID: PMC2943379`.
-   Содержание ссылки: <http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2943379/>.


## <span class="section-num">4</span> Реферативные базы {#реферативные-базы}


### <span class="section-num">4.1</span> Pubmed {#pubmed}

-   Идентификатор: Pubmed ID (`PMID`).
-   Ссылка на реферат статьи. Ссылка на полный текст статьи в основном через _doi_.
-   Вид ссылки: `PMID: 20708976`.
-   Содержание ссылки: <http://www.ncbi.nlm.nih.gov/pubmed/20708976>.


### <span class="section-num">4.2</span> Mathematical Reviews {#mathematical-reviews}

-   Реферативный математический журнал, издаваемый Американским математическим обществом с 1940 года.
-   Электронная база данных (MathSciNet).
-   Содержит рефераты книг и статей по всем разделам математики и её приложениям в информатике, механике и физике.
-   Сайт: <http://www.ams.org/publications/math-reviews/math-reviews>
-   Идентификатор: MR.
-   Вид ссылки: `MR: 2355127`.
-   Содержание ссылки: <http://www.ams.org/mathscinet-getitem?mr=MR2355127>.


### <span class="section-num">4.3</span> Zentralblatt MATH {#zentralblatt-math}

-   Реферативный математический журнал, основанный издательством «Шпрингер»
-   Электронная база данных «ZBMATH --- The database Zentralblatt MATH».
-   Вид ссылки: `Zbl: 0544.05037`.
-   Содержание ссылки: <http://www.zentralblatt-math.org/zmath/en/search/?q=an:0544.05037>.


## <span class="section-num">5</span> Подходы к реализации поддержки архивов препринтов {#подходы-к-реализации-поддержки-архивов-препринтов}


### <span class="section-num">5.1</span> Определение нового типа для `eprint` {#определение-нового-типа-для-eprint}

-   У biblatex не может быть двух типов поля `eprint` для одной и той же записи.
-   Можно создать новый формат `eprint`, но нельзя будет использовать разные форматы `eprint` для одной библиографической записи.
-   Продемонстрируем на примере PMCID.
-   Добавим новый формат поля:
    ```latex
    \DeclareFieldFormat{eprint:pmcid}{%
      PMCID\addcolon\space
      \ifhyperref
      {\href{http://www.ncbi.nlm.nih.gov/pmc/articles/#1}{\nolinkurl{#1}}}
      {\nolinkurl{#1}}}
    \DeclareFieldAlias{eprint:PMCID}{eprint:pmcid}
    \DeclareFieldAlias{eprint:pmc}{eprint:pmcid}
    \DeclareFieldAlias{eprint:PMC}{eprint:pmcid}
    ```

-   Пример записи:
    ```bibtex
    @article{ContEp,
      author        = {Mark G. Frei and Hitten P. Zaveri and Susan Arthurs and Gregory K. Bergey and Christophe Jouny and Klaus Lehnertz and Jean Gotman and Ivan Osorio and Theoden I. Netoff and Walter J. Freeman and John Jefferys and Gregory Worrell and Michel Le Van Quyen and Steven J. Schiff and Florian Mormannn},
      title         = {Controversies in epilepsy},
      subtitle      = {Debates held during the Fourth International Workshop on Seizure Prediction},
      journaltitle  = {Epilepsy \& Behavior},
      volume        = {19},
      number        = {1},
      pages         = {4-16},
      date          = {2010-09},
      doi           = {10.1016/j.yebeh.2010.06.009},
      eprint        = {PMC2943379},
      eprinttype    = {pmcid},
    }
    ```


### <span class="section-num">5.2</span> Определение новых полей через модель данных {#определение-новых-полей-через-модель-данных}

-   Можно создать отдельные поля для разного типа препринтов так, чтобы они не занимали слот `eprint` и могли использоваться вместе.
-   При объявлении модели данных нам нужно убедиться, что _biblatex_ действительно известен тип полей, которые мы объявляем.
-   Это делается с помощью необязательного аргумента `\DeclareDatamodelFields`.
-   Определим новые поля `pmid` и `pmcid`:
    ```latex
    \DeclareDatamodelFields[type=field,datatype=verbatim]{pmid}
    \DeclareDatamodelEntryfields{pmid}
    \DeclareDatamodelFields[type=field,datatype=verbatim]{pmcid}
    \DeclareDatamodelEntryfields{pmcid}
    ```

    -   Эти поля задаются в отдельном файле с расширением `.dbx`.
    -   Затем мы вызываем эту модель данных через `datamodel=` в параметрах `biblatex`.
    -   Пусть файл называется `eprint.dbx`.
    -   Тогда загружаться эта модель данных будет следующим образом:
        ```latex
        \usepackage[backend=biber, style=authoryear, datamodel=eprint]{biblatex}
        ```
-   Зададим форматирование для печати этих полей:
    ```latex
    \DeclareFieldFormat{eprint:pmcid}{%
      PMCID\addcolon\space
      \ifhyperref
        {\href{http://www.ncbi.nlm.nih.gov/pmc/articles/#1}{\nolinkurl{#1}}}
        {\nolinkurl{#1}}}
    \DeclareFieldAlias{eprint:PMC}{eprint:pmcid}
    \DeclareFieldAlias{eprint:PMCID}{eprint:pmcid}
    \DeclareFieldAlias{eprint:pmc}{eprint:pmcid}
    \DeclareFieldAlias{pmcid}{eprint:pmcid}
    \DeclareFieldAlias{pmid}{eprint:pubmed}
    ```
-   Задам нужно распечатать поля, это достигается переопределением макроса `doi+eprint+url`:
    ```latex
    \renewbibmacro*{doi+eprint+url}{%
      \iftoggle{bbx:doi}
      {\printfield{doi}}
      {}%
      \newunit\newblock
      \printfield{pmcid}%
      \newunit\newblock
      \printfield{pmid}%
      \newunit\newblock
      \iftoggle{bbx:eprint}
      {\usebibmacro{eprint}}
      {}%
      \newunit\newblock
      \iftoggle{bbx:url}
      {\usebibmacro{url+urldate}}
      {}}
    ```
-   Пример записи:
    ```bibtex
    @article{ContEp,
      author        = {Mark G. Frei and Hitten P. Zaveri and Susan Arthurs and Gregory K. Bergey and Christophe Jouny and Klaus Lehnertz and Jean Gotman and Ivan Osorio and Theoden I. Netoff and Walter J. Freeman and John Jefferys and Gregory Worrell and Michel Le Van Quyen and Steven J. Schiff and Florian Mormannn},
      title         = {Controversies in epilepsy},
      subtitle      = {Debates held during the Fourth International Workshop on Seizure Prediction},
      journaltitle  = {Epilepsy \& Behavior},
      volume        = {19},
      number        = {1},
      pages         = {4-16},
      date          = {2010-09},
      doi           = {10.1016/j.yebeh.2010.06.009},
      pmcid         = {PMC2943379},
      pmid          = {20708976},
    }
    ```


## <span class="section-num">6</span> Реализация поддержки архивов препринтов {#реализация-поддержки-архивов-препринтов}

-   Для реализации выбираем подход задания новых типов для `eprint`:
    ```latex
    %% Pubmed Central
    \DeclareFieldFormat{eprint:pmcid}{%
      PMCID\addcolon\space
      \ifhyperref
      {\href{http://www.ncbi.nlm.nih.gov/pmc/articles/#1}{\nolinkurl{#1}}}
      {\nolinkurl{#1}}}
    \DeclareFieldAlias{eprint:PMCID}{eprint:pmcid}
    \DeclareFieldAlias{eprint:pmc}{eprint:pmcid}
    \DeclareFieldAlias{eprint:PMC}{eprint:pmcid}
    %% Pubmed
    %% medRxiv
    %% bioRxiv
    %% ChemRxiv
    %% Mathematical Reviews
    \DeclareFieldFormat{eprint:mr}{%
      MR\addcolon\space
      \ifhyperref
      {\href{http://www.ams.org/mathscinet-getitem?mr=MR#1}{\nolinkurl{#1}}}
      {\nolinkurl{#1}}}
    %% Zentralblatt MATH
    \DeclareFieldFormat{eprint:zbl}{%
      Zbl\addcolon\space
      \ifhyperref
      {\href{http://zbmath.org/?q=an:#1}{\nolinkurl{#1}}}
      {\nolinkurl{#1}}}
    %% Jstor
    \DeclareFieldAlias{jstor}{eprint:jstor}
    ```
