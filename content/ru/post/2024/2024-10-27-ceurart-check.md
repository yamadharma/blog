---
title: "Проверка документов в CEURART"
author: ["Dmitry S. Kulyabov"]
date: 2024-10-27T19:39:00+03:00
lastmod: 2025-03-30T20:13:00+03:00
tags: ["latex"]
categories: ["computer-science"]
draft: false
slug: "ceurart-check"
---

Проверка документов перед отправкой в депозитарий CEUR-WS.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Основные проблемы {#основные-проблемы}

-   Возможные проблемы с pdf-файлами.
-   Pdf-документы не используют шрифты Libertinus.
    -   Необходимо запрашивать исправления у организаторов семинаров, если многие документы не используют Libertinus.
    -   Если документов всего 1-2, то можно на это закрыть глаза.
-   Растровые документы pdf.
    -   Нет возможности выделения текста.
    -   Поисковые системы, такие как Google Scholar, не смогут правильно проиндексировать эти статьи.


## <span class="section-num">2</span> Утилиты {#утилиты}

-   Утилиты для проверки документов для CEUR-WS находятся в репозитории: <https://github.com/yamadharma/ceurart-check>
-   `check-pdf-errors`:
    -   Проверяет pdf-файлы.
    -   Проверка наличия фразы 'Creative Commons' в pdf-файлах.
        -   Это делается чтобы проверить, можно ли выделить текст (не является ли документ картинкой).
    -   Проверка использования шрифтов Libertinus.
    -   Проверка дублирования pdf-файлов.
-   `check-index-errors`:
    -   Проверяет файл `index.html`.


## <span class="section-num">3</span> Проверка {#проверка}

-   Проверьте pdf-файлы:
    ```shell
    check-pdf-errors
    ```
-   Проверьте `index.html`:
    ```shell
    check-index-errors
    ```
