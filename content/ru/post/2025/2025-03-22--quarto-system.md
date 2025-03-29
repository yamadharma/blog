---
title: "Система Quarto"
author: ["Dmitry S. Kulyabov"]
date: 2025-03-22T17:37:00+03:00
lastmod: 2025-03-28T22:08:00+03:00
tags: ["science-writing", "markdown"]
categories: ["computer-science"]
draft: false
slug: "quarto-system"
---

Система Quarto.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://quarto.org/>
-   Репозиторий: <https://github.com/quarto-dev/quarto-cli>
-   Quarto — это современная система для создания научной, технической и прочей документации.
-   Входной язык: Markdown.
-   Выходные форматы: html, pdf, epub, docx, презентации в формате reveal.js.
-   Интеграция с языками программирования: R, Python, Julia, Observable JS.
    -   Интеграция как в babel (см. [Emacs. Org Babel]({{< relref "2022-10-15-emacs-org-babel" >}})) или julyter.
    -   Позволяет включать в документы интерактивные элементы, такие как виджеты и динамические визуализации.


## <span class="section-num">2</span> Установка {#установка}

-   Gentoo, репозиторий karma (см. [Gentoo. Репозиторий karma]({{< relref "2024-05-25-gentoo-karma-repository" >}})):
    ```shell
    emerge quarto
    ```


## <span class="section-num">3</span> Общий алгоритм работы {#общий-алгоритм-работы}

```mermaid
flowchart LR
  A{Выбираем тип проекта} --> B(Редактируем YAML)
  B --> C(Пишем текст и код)
  B --> D(Добавляем изображения)
  C --> E(Настраиваем отображение)
  D --> E
  E <--> B
  E --> F[Публикация]

  classDef optional stroke-dasharray:10;
  class D optional
  class E optional
```


## <span class="section-num">4</span> Использование {#использование}

-   [Quarto. Язык markdown]({{< relref "2025-03-23--quarto-markdown" >}})
-   [Quarto. Оформление метаданных]({{< relref "2025-03-23--quarto-metadata-formatting" >}})
-   [Quarto. Цитирование]({{< relref "2025-03-23--quarto-citations" >}})
-   [Quarto. Перекрёстные ссылки]({{< relref "2025-03-23--quarto-cross-references" >}})
-   [Quarto. Структура для книги]({{< relref "2025-03-27--quarto-book-structure" >}})
-   [Quarto. Формат pdf]({{< relref "2025-03-27--quarto-pdf-format" >}})
