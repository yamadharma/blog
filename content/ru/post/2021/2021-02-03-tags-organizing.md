---
title: "Организация меток для записей"
author: ["Dmitry S. Kulyabov"]
date: 2021-02-03T12:21:00+03:00
lastmod: 2023-07-14T17:32:00+03:00
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
    -   `sci_writing`: [Научная писанина]({{< relref "2022-08-25-scientific-writing" >}})
    -   `modeling`: [Математическое моделирование]({{< relref "2021-02-21-mathematical-modeling" >}})
-   `@physics`:
    -   `maxwell`
    -   `kinetic`
-   `@computer_science`: Компьютерные науки
    -   `emacs`: [Emacs]({{< relref "2020-12-24-emacs" >}})
    -   `gentoo`[^fn:1]: [Linux. Дистрибутив Gentoo]({{< relref "2022-09-17-linux-gentoo-distribution" >}})
    -   `hugo`: [Генератор статических сайтов Hugo]({{< relref "2020-12-07-hugo-site-generator" >}})
    -   `sysadmin`: [Системное администрирование]({{< relref "2021-04-10-system-administration" >}})
    -   `network`:
    -   `ipv6`: [Протокол IPv6]({{< relref "2023-06-26-ipv6-protocol" >}})
    -   `hard`:
    -   `tex`: [Система TeX]({{< relref "2021-04-23-tex" >}})
    -   `pandoc`: [Pandoc]({{< relref "2021-08-28-pandoc" >}})
    -   `linux`: [Администрирование Linux]({{< relref "2023-06-07-linux-administration" >}})
    -   `windows`: [Администрирование Windows]({{< relref "2021-05-01-windows-administration" >}})
    -   `redhat`:
    -   `cisco`: [Администрирование Cisco]({{< relref "2021-06-16-cisco-administration" >}})
    -   `org_mode`: [Org-mode]({{< relref "2021-10-14-org-mode" >}})
    -   `org_roam`: [Org-roam]({{< relref "2022-11-23-org-roam" >}})
-   `@self_management`: Информация по самоорганизации, управлением временем, организации дел.
    -   `gtd`: [Метод GTD]({{< relref "2021-07-12-gtd-method" >}})
    -   `zettelkasten`: [Метод Zettelkasten]({{< relref "2021-02-18-zettelkasten-method" >}})
    -   `blog`: [Ведение блога]({{< relref "2023-03-17-blogging" >}})
-   `@book`: [Прочитанные книги]({{< relref "2020-12-15-books" >}})
    -   `science_people`[^fn:2]: [Книги. Люди науки]({{< relref "2021-02-20-books-science-people" >}})
    -   `culture`[^fn:3]: [Книги. Культура]({{< relref "2021-01-10-books-culture" >}})
    -   `science_philosophy`: [Книги. Философия науки]({{< relref "2021-01-06-books-science-philosophy" >}})
    -   `history`: [Книги. История]({{< relref "2023-05-06-books-history" >}})
    -   `physics`: [Книги. Физика]({{< relref "2023-07-01-books-physics" >}})
    -   `fiction`: [Книги. Художественная литература]({{< relref "2023-07-14-books-fiction" >}})
-   `@life`: [Жизнь]({{< relref "2021-11-26-life" >}})
    -   `apartment`: [Квартира]({{< relref "2022-12-16-apartment" >}})
    -   `recreation`: [Отдых]({{< relref "2023-01-17-recreation" >}})
    -   `health`: [Здоровье]({{< relref "2022-10-19-health" >}})
    -   `money`: [Взгляд обывателя на финансы]({{< relref "2023-02-18-philistine-view-finance" >}})
    -   `appliance` : [Бытовая техника]({{< relref "2023-05-14-household-appliances" >}})
-   `@job`: Работа
    -   `rudn`: [РУДН]({{< relref "2023-01-17-rudn" >}})
-   `@thinking`: [Мысли]({{< relref "2021-12-14-reflections" >}})
    -   `sociology`: [Социологические заметки]({{< relref "2021-10-23-sociological-notes" >}})
-   `@games`: [Компьютерные игры]({{< relref "2022-06-07-computer-games" >}})
    -   `disciples`: [Disciples]({{< relref "2022-06-07-disciples-game" >}})
    -   `homm`: [Heroes of Might and Magic]({{< relref "2022-06-07-homm" >}})
    -   `mm`: [Might And Magic]({{< relref "2023-04-02-might-magic" >}})
    -   `diablo`: [Игры. Diablo]({{< relref "2023-06-16-games-diablo" >}})

| Уровень  | org-mode todo | org-roam            | blog (ru)        | blog (en)         |
|----------|---------------|---------------------|------------------|-------------------|
| category |               | `@computer_science` | computer-science | computer-science  |
| tag      |               | `hard`              |                  |                   |
| tag      |               | `soft`              |                  |                   |
| tags     |               | `gentoo`            |                  |                   |
| category | `@science`    | `@science`          | `сиянс`          | `science`         |
| tag      | `education`   | `education`         | `education`      | `education`       |
| tag      | `research`    | `research`          | `research`       | `research`        |
| tag      | `sci_admin`   | `sci_admin`         | `sci-admin`      | `sci-admin`       |
| tag      | `sci_being`   | `sci_being`         | `sci-being`      | `sci-being`       |
| tag      | `sci_writing` | `sci_writing`       | `sci-writing`    | `sci-writing`     |
| category |               | `@book`             | листая-страницы  | through-the-pages |
| tag      |               | `science_people`    | люди-науки       | science-people    |
| tag      |               | `culture`           | культура         | culture           |
| category |               | `@self_management`  | self-management  | self-management   |
| tag      |               | `gtd`               | gtd              | gtd               |
| category |               | `@life`             | жизнь            | life              |
| category |               | `@reflections`      | мысли            | reflections       |
| category |               | `@games`            | games            | games             |
| tag      |               | `disciples`         | disciples        | disciples         |
| tag      |               | `homm`              | homm             | homm              |

[^fn:1]: Это мой основной дистрибутив Linux.
[^fn:2]: Биографии учёных, мемуары учёных.
[^fn:3]: Всё, что имеет отношение к культуре (культурология, литературоведение).