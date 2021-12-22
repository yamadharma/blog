---
title: "Организация меток для записей"
author: ["Dmitry S. Kulyabov"]
date: 2021-02-03T12:21:00+03:00
lastmod: 2021-12-14T17:33:00+03:00
categories: ["self-management"]
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

-   `@science`: Научные занятия.
    -   `education`: Преподавание.
    -   `research`: Научные исследования и инженерная деятельность.
    -   `sci_admin`: Научно-административная деятельность.
-   research
    -   emacs
    -   tex
    -   maxwell
    -   kinetic
-   `@blog`
-   `@self_management`: Информация по самоорганизации, управлением временем, организации дел.
-   `@book`: Книги, которые прочитал
    -   `science-people`: Биографии учёных, мемуары учёных.
    -   `culture`: Всё, что имеет отношение к культуре (культурология, литературоведение).
-   `@life`: Жизнь
-   `@reflections`: Размышления, мысли

| Уровень  | org-mode todo | org-roam           | blog (ru)        | blog (en)         |
|----------|---------------|--------------------|------------------|-------------------|
| category |               | @computer\_science | computer-science | computer-science  |
| tag      |               | hard               |                  |                   |
| tag      |               | soft               |                  |                   |
| category | @science      | @science           | сиянс            | science           |
| tag      | education     | education          | education        | education         |
| tag      | research      | research           | research         | research          |
| tag      | sci\_admin    | sci\_admin         | sci-admin        | sci-admin         |
| category |               | @book              | листая-страницы  | through-the-pages |
| tag      |               | science-people     | люди-науки       | science-people    |
| tag      |               | culture            | культура         | culture           |
| category |               | @self\_management  | self-management  | self-management   |
| tag      |               | gtd                | gtd              | gtd               |
| category | @life         | @life              | жизнь            | life              |
| category | @reflections  | @reflections       | мысли            | reflections       |
