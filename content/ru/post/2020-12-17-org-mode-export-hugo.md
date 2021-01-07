---
title: "Org-mode. Экспорт в Hugo"
date: 2020-12-17T11:01:00+03:00
lastmod: 2021-01-07T14:43:00+03:00
tags: ["blogging"]
categories: ["sysadmin"]
draft: false
slug: "org-mode-export-hugo"
---

Экспорт org-mode в Hugo является одной из составных частей научного рабочего процесса на основе Emacs и org-mode.

<!--more-->

{{< toc >}}


## Использование языка Markdown внутри Org {#использование-языка-markdown-внутри-org}

При экспорте Org преобразуется в стандартный Markdown. Однако в Hugo
используются собственные нестандартные расширения (см. [Синтаксис
Markdown для генератора сайтов Hugo]({{< relref "2020-11-26-hugo-markdown" >}})). При необходимости их можно
вставлять прямо в текст.


## Настройка экспорта {#настройка-экспорта}

Экспорт производится в рамках общего фреймворка org-mode для экспорта (см. [Org-mode. Экспорт]({{< relref "2020-12-10-org-mode-export" >}})).


### Экспорт специфических элементов {#экспорт-специфических-элементов}


#### Экспорт операторов Hugo {#экспорт-операторов-hugo}

Для экспорта конкретных элементов, необходимых только для Hugo, следует использовать блок `export`. Например, оглавление задаётся следующим образом:

```org
#+begin_export hugo
{{</* toc */>}}
#+end_export
```

Это позволяет задавать оглавление только для Hugo.


#### Отбивка резюме (Summary Splitter) {#отбивка-резюме--summary-splitter}

Отбивка резюме задаётся конструкцией

```org
#+hugo: more
```


#### Резюме и подробная информация {#резюме-и-подробная-информация}

-   Специальный блок «Детали» `#+begin_details … #+end_details`
    используется для создания элемента, раскрывающего дополнительные
    сведения (`<details>` и `<summary>`).

    ```org
    #+begin_details
    #+begin_summary
    Краткая информация
    #+end_summary
    А здесь подробная информация.
    #+end_details
    ```

    Выглядить это так:

    <details>
    <summary>
    Краткая информация
    </summary>
    <p class="details">

    А здесь подробная информация.
    </p>
    </details>

-   Если блок `summary` отсутствует, резюме будет заменено на некоторое значение по умолчанию. Так, блок

    ```org
    #+begin_details
    А здесь подробная информация.
    #+end_details
    ```

    будет иметь следующий вид:

    <details>
    <p class="details">А здесь подробная информация.
    </p>
    </details>

-   Можно показывать блок открытым по умолчанию. Для этого следует добавить атрибут HTML `#+attr_html: :open t`:

    ```org
    #+attr_html: :open t
    #+begin_details
    #+begin_summary
    Краткая информация
    #+end_summary
    А здесь подробная информация.
    #+end_details
    ```

    <details open>
    <summary>
    Краткая информация
    </summary>
    <p class="details">

    А здесь подробная информация.
    </p>
    </details>


### Свойства экспорта {#свойства-экспорта}


#### Обязательные свойства {#обязательные-свойства}

Для экспорта необходимо установить следующие обязательные свойства:

-   `HUGO_SECTION` - название раздела Hugo по умолчанию для всех
    сообщений. Обычно это свойство устанавливается для сообщений или
    блога. Значение по умолчанию устанавливается с помощью
    `org-hugo-default-section-directory`.
-   `HUGO_BASE_DIR` - корневой каталог сайта Hugo. Например, если
    `HUGO_BASE_DIR` установлен на `~/hugo/`, то экспортированные файлы
    Markdown будут сохранены в каталог `~/hugo/content/<HUGO_SECTION>/`.


#### Формат заголовка {#формат-заголовка}

Поддерживаются форматы заголовка TOML (по умолчанию) и YAML.

<!--list-separator-->

-  Экспорт для всего файла

    ```org
    #+hugo_front_matter_format: yaml
    ```

<!--list-separator-->

-  Экспорт для поддерева

    ```org
    :PROPERTIES:
    :EXPORT_HUGO_FRONT_MATTER_FORMAT: yaml
    :END:
    ```


#### Свойства экспорта для заголовка Hugo {#свойства-экспорта-для-заголовка-hugo}

<a id="table--hugo-export-properties-front-matter"></a>
<div class="table-caption">
  <span class="table-number"><a href="#table--hugo-export-properties-front-matter">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1</a></span>:
  Сводная таблица свойств экспорта для заголовка Hugo
</div>

| Hugo front-matter (TOML)           | Уровень файла                        | Уровень поддерева                       |
|------------------------------------|--------------------------------------|-----------------------------------------|
| `title = "foo"`                    | `#+title: foo`                       | `* foo`                                 |
| `date = 2017-09-11T14:32:00-04:00` |                                      | `CLOSED: [2017-09-11 Mon 14:32]`        |
| `date = 2017-07-24`                | `#+date: 2017-07-24`                 | `:EXPORT_DATE: 2017-07-24`              |
| `publishDate = 2018-01-26`         | `#+hugo_publishdate: 2018-01-26`     | `SCHEDULED: <2018-01-26 Fri>`           |
| `publishDate = 2018-01-26`         |                                      | `:EXPORT_HUGO_PUBLISHDATE: 2018-01-26:` |
| `expiryDate = 2999-01-01`          | `#+hugo_expirydate: 2999-01-01`      | `DEADLINE: <2999-01-01 Tue>`            |
| `expiryDate = 2999-01-01`          |                                      | `:EXPORT_HUGO_EXPIRYDATE: 2999-01-01:`  |
| `lastmod = <current date>`         | `#+hugo_auto_set_lastmod: t`         | `:EXPORT_HUGO_AUTO_SET_LASTMOD: t`      |
| `lastmod = <current date>`         |                                      | `#+hugo_auto_set_lastmod: t`            |
| `tags = ["toto", "zulu"]`          | `#+hugo_tags: toto zulu`             | `* foo :toto:zulu:`                     |
| `categories = ["x", "y"]`          | `#+hugo_categories: x y`             | `* foo :@x:@y:`                         |
| `draft = true`                     | `#+hugo_draft: true`                 | `* TODO foo`                            |
| `draft = false`                    | `#+hugo_draft: false`                | `* foo` или `* DONE foo`                |
| `weight = 123` (manual)            | `#+hugo_weight: 123`                 | `:EXPORT_HUGO_WEIGHT: 123`              |
| `weight = 123` (auto-calc)         |                                      | `:EXPORT_HUGO_WEIGHT: auto`             |
| `tags_weight = 123` (manual)       | `#+hugo_weight: :tags 123`           | `:EXPORT_HUGO_WEIGHT: :tags 123`        |
| `tags_weight = 123` (auto-calc)    |                                      | `:EXPORT_HUGO_WEIGHT: :tags auto`       |
| `weight = 123` (in [menu.foo])     | `#+hugo_menu: :menu foo :weight 123` | `:EXPORT_HUGO_MENU: :menu foo`          |
| `categories_weight = 123`          | `#+hugo_weight: :categories 123`     |                                         |


## Сочетания клавиш {#сочетания-клавиш}

Экспорт осуществляется через стандартный интерфейс экспорта в org-mode.


### Для режимов _один пост на файл_ и _один пост на поддерево_ {#для-режимов-один-пост-на-файл-и-один-пост-на-поддерево}

-   `C-c C-e H H` Экспорт «Что я имею в виду».
    -   Если курсор находится в допустимом поддереве сообщения Hugo,
        экспортирует это поддерево в сообщение Hugo в Markdown. Допустимое
        поддерево сообщений Hugo - это поддерево, для которого установлено
        свойство `EXPORT_FILE_NAME`.
    -   Если файл предназначен для экспорта целиком (т.е. имеет ключевое
        слово `#+title`), экспортирует весь файл Org в сообщение Hugo в
        Markdown.
-   `C-c C-e H A` Экспорт всего «Что я имею в виду».
    -   Если в org-файле есть одно или несколько действительных
        поддеревьев сообщений Hugo, экспортирует их в сообщения Hugo в
        Markdown.
    -   Если файл предназначен для экспорта целиком (т. е. вообще нет
        действительных поддеревьев сообщений Hugo и есть ключевое слово
        `#+title`), экспортирует весь org-файл в сообщение Hugo в
        Markdown.


### Для режима _один пост на файл_ {#для-режима-один-пост-на-файл}

-   `C-c C-e H h` Экспорт файла Org в сообщение Hugo в Markdown.