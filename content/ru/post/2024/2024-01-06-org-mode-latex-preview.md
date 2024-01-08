---
title: "Org-mode. Предпросмотр TeX"
author: ["Dmitry S. Kulyabov"]
date: 2024-01-06T19:38:00+03:00
lastmod: 2024-01-06T20:13:00+03:00
tags: ["emacs", "org-mode", "tex"]
categories: ["computer-science"]
draft: false
slug: "org-mode-latex-preview"
---

Предпросмотр TeX в org-mode.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Входит в состав пакета org.


## <span class="section-num">2</span> Использование {#использование}

-   Визуализация запускается командой `C-c C-x C-l` (`org-preview-latex-fragment`).
-   Визуализация поддерева: `C-u C-c C-x C-l`.
-   Визуализация всего буфера: `C-u C-u C-c C-x C-l`.
-   Команда обрабатывает код Latex и создаёт изображение png или svg, которое накладывается на код LaTeX.
-   Просмотр других элементов LaTeX (например, листинг для кода) также работает.


## <span class="section-num">3</span> Реализация {#реализация}

-   Список процедур обработки находятся переменной `org-preview-latex-process-alist`.
-   Используются методы: `dvipng`, `imagemagick`, `dvisvgm`.
-   Фрагмент кода встраивается в полный файл LaTeX, который затем обрабатывается программой LaTeX для создания файла dvi или pdf.
-   Затем результирующий файл преобразуется в формат png или svg.


## <span class="section-num">4</span> Настройка {#настройка}

-   Необходимо выбрать метод конвертации (`dvipng`, `imagemagick`, `dvisvgm`):
    ```emacs-lisp
    (setq org-latex-create-formula-image-program 'dvipng)
    ```
-   Набор используемых пакетов LaTeX заносятся в переменные:
    -   `org-latex-default-packages-alist` : список пакетов по умолчанию, лучше не изменять;
    -   `org-latex-packages-alist` : пустая по умолчанию переменная, заносите информацию сюда.
-   Созданные изображения лучше поместить в отдельный кэш:
    ```emacs-lisp
    (setq org-preview-latex-image-directory (concat home-cache-path "org-latex/"))
    ```


## <span class="section-num">5</span> Опции в org-файле {#опции-в-org-файле}

-   Вы можете включить предварительный просмотр всех фрагментов LaTeX в файле с помощью опции:
    ```org
    #+STARTUP: latexpreview
    ```
-   Чтобы отключить предпросмотр:
    ```org
    #+STARTUP: nolatexpreview
    ```
