---
title: "Организация меток для записей"
author: ["Dmitry S. Kulyabov"]
date: 2021-02-03T12:21:00+03:00
lastmod: 2022-08-09T20:42:00+03:00
tags: ["emacs", "hugo"]
categories: ["computer-science", "self-management"]
draft: false
slug: "tags-organizing"
---

Предлагается следующая структура _категорий_ и _меток_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Обоснование именования меток {#обоснование-именования-меток}

-   Метки и категории задаются для _org-mode todo_, _org-roam_, _hugo_.
-   Метки и категории должны быть согласованы для разных областей применения.
-   Метки и категории должны быть согласованы для разных языков (на данный момент русского и английского).
-   При этом на разных языках они могут звучать по-разному.
-   Предлагается категории предварять символом `@` (см. [Org-mode. Экспорт в Hugo]({{< relref "2020-12-17-org-mode-export-hugo" >}})).


## <span class="section-num">2</span> Категории и метки {#категории-и-метки}

-   `@science`: [Научная деятельность]({{< relref "2021-02-01-scientific-activity" >}})
    -   `education`: [Преподавание]({{< relref "2021-02-01-teaching" >}})
    -   `research`: [Научно-исследовательская деятельность]({{< relref "2021-02-01-research" >}})
    -   `sci_admin`: [Научно-административная деятельность]({{< relref "2021-02-01-scientific-administrative" >}})
    -   `sci_being`: [Бытие науки]({{< relref "2021-02-04-being-science" >}})
-   research
    -   maxwell
    -   kinetic
-   `@computer_science`: Компьютерные науки
    -   `sysadmin`: [Системное администрирование]({{< relref "2021-04-10-system-administration" >}})
    -   `hugo`: [Генератор статических сайтов Hugo]({{< relref "2020-12-07-hugo-site-generator" >}})
    -   `emacs`: [Emacs]({{< relref "2020-12-24-emacs" >}})
    -   `tex`: [Система TeX]({{< relref "2021-04-23-tex" >}})
-   `@blog`
-   `@self_management`: Информация по самоорганизации, управлением временем, организации дел.
    -   `gtd`: [Метод GTD]({{< relref "2021-07-12-gtd-method" >}})
-   `@book`: Книги, которые прочитал
    -   `science-people`: Биографии учёных, мемуары учёных.
    -   `culture`: Всё, что имеет отношение к культуре (культурология, литературоведение).
-   `@life`: [Жизнь]({{< relref "2021-11-26-life" >}})
-   `@reflections`: [Мысли]({{< relref "2021-12-14-reflections" >}})
-   `@games`: [Компьютерные игры]({{< relref "2022-06-07-computer-games" >}})
    -   `disciples`: [Disciples]({{< relref "2022-06-07-disciples-game" >}})
    -   `homm`: [Heroes of Might and Magic]({{< relref "2022-06-07-homm" >}})

| Уровень  | org-mode todo | org-roam          | blog (ru)        | blog (en)         |
|----------|---------------|-------------------|------------------|-------------------|
| category |               | @computer_science | computer-science | computer-science  |
| tag      |               | hard              |                  |                   |
| tag      |               | soft              |                  |                   |
| category | @science      | @science          | сиянс            | science           |
| tag      | education     | education         | education        | education         |
| tag      | research      | research          | research         | research          |
| tag      | sci_admin     | sci_admin         | sci-admin        | sci-admin         |
| tag      | sci_being     | sci_being         | sci-being        | sci-being         |
| category |               | @book             | листая-страницы  | through-the-pages |
| tag      |               | science-people    | люди-науки       | science-people    |
| tag      |               | culture           | культура         | culture           |
| category |               | @self_management  | self-management  | self-management   |
| tag      |               | gtd               | gtd              | gtd               |
| category |               | @life             | жизнь            | life              |
| category |               | @reflections      | мысли            | reflections       |
| category |               | @games            | games            | games             |
| tag      |               | disciples         | disciples        | disciples         |
| tag      |               | homm              | homm             | homm              |
