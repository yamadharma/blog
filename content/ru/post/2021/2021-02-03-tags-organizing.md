---
title: "Организация меток для записей"
date: 2021-02-03T12:21:00+03:00
lastmod: 2021-02-20T17:24:00+03:00
categories: ["blog"]
draft: false
slug: "tags-organizing"
---

Предлагается следующая структура _категорий_ и _меток_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Обоснование именований меток {#обоснование-именований-меток}

-   Метки и категории задаются для _org-mode todo_, _org-roam_, _hugo_.
-   Метки и категории должны быть согласованы для разных областей применения.
-   Метки и категории должны быть согласованы для разных языков (на данный момент русского и английского).
-   При этом на разных языках они могут звучать по-разному.
-   Предлагается категории предварять символом `@` (см. [Org-mode. Экспорт в Hugo]({{< relref "2020-12-17-org-mode-export-hugo" >}})).


## <span class="section-num">2</span> Категории и метки {#категории-и-метки}

-   @science
    -   education
    -   research
    -   sci\_admin
-   research
    -   emacs
    -   tex
    -   maxwell
    -   kinetic
-   @blog
-   @book
    -   science-people
    -   culture

| Уровень  | org-mode todo | org-roam           | blog (ru)        | blog (en)        |
|----------|---------------|--------------------|------------------|------------------|
| category |               | @computer\_science | computer-science | computer-science |
| tag      |               | hard               |                  |                  |
| tag      |               | soft               |                  |                  |
| category | @science      | @science           | сиянс            | science          |
| tag      | education     | education          | education        | education        |
| tag      | research      | research           | research         | research         |
| tag      | sci\_admin    | sci\_admin         | sci-admin        | sci-admin        |
| category |               | @book              | листая-страницы  |                  |
| tag      |               | science-people     | люди-науки       |                  |
| tag      |               | culture            | культура         |                  |


## <span class="section-num">3</span> Backlinks {#backlinks}

-   [Самоорганизация]({{< relref "2021-02-03-self-management" >}})
