---
title: "Emacs. Пакет tab-line"
author: ["Dmitry S. Kulyabov"]
date: 2024-01-08T20:02:00+03:00
lastmod: 2024-01-08T20:14:00+03:00
tags: ["emacs"]
categories: ["computer-science"]
draft: false
slug: "emacs-tab-line"
---

Emacs. Пакет tab-line.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Включено в Emacs 27.
-   Область действия --- в рамках окна, в каждом табе --- буфер.


## <span class="section-num">2</span> Настройка {#настройка}


### <span class="section-num">2.1</span> Включение режима {#включение-режима}

-   Включить режим:
    ```emacs-lisp
    (global-tab-line-mode t)
    ```


### <span class="section-num">2.2</span> Группировка вкладок {#группировка-вкладок}

-   Вкладки группируются согласно функции `tab-line-tabs-function`.


## <span class="section-num">3</span> Навигация {#навигация}

-   Передвижение по вкладкам выполняется с помощью клавиш:
    -   `C-x LEFT` (-previous-buffer=);
    -   `C-x RIGHT` (`next-buffer`).
