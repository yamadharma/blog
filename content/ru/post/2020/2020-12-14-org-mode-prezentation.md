---
title: "Org-mode. Презентации"
date: 2020-12-14T10:49:00+03:00
lastmod: 2021-03-04T18:48:00+03:00
tags: ["org-mode", "emacs", "tex"]
categories: ["computer-science"]
draft: false
slug: "org-mode-prezentation"
---

Создание презентаций в org-mode Emacs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Beamer {#beamer}


### <span class="section-num">1.1</span> Конфигурационный файл Emacs {#конфигурационный-файл-emacs}

-   Считаем, что экспорт в LaTeX уже настроен (см. [Org-mode. Экспорт в LaTeX]({{< relref "2020-12-14-org-mode-export-latex" >}})).
-   Подключаем библиотеку экспорта:

<!--listend-->

```elisp
(require 'ox-beamer)
```

-   Задаём уровень заголовка, который будет восприниматься как заголовок слайда:

    ```elisp
    (setq org-beamer-frame-level 3)
    ```

    Этот параметр можно переопределить как на уровне файла:

    ```org
    #+OPTIONS: H:3
    ```

    так и на уровне поддерева:

    ```org
    :EXPORT_OPTIONS: H:3
    ```


### <span class="section-num">1.2</span> Опции экспорта {#опции-экспорта}

Общие опции экспорта:

-   [Org-mode. Экспорт]({{< relref "2020-12-10-org-mode-export" >}})
-   [Org-mode. Экспорт в LaTeX]({{< relref "2020-12-14-org-mode-export-latex" >}})

<a id="table--Опции экспорта для файла и поддерева"></a>

| Опции экспорта файла | Опции экспорта поддерева     |
|----------------------|------------------------------|
| BEAMER\_THEME        | EXPORT\_BEAMER\_THEME        |
| BEAMER\_COLOR\_THEME | EXPORT\_BEAMER\_COLOR\_THEME |
| BEAMER\_FONT\_THEME  | EXPORT\_BEAMER\_FONT\_THEME  |
| BEAMER\_INNER\_THEME | EXPORT\_BEAMER\_INNER\_THEME |
| BEAMER\_OUTER\_THEME | EXPORT\_BEAMER\_OUTER\_THEME |
| BEAMER\_HEADER       |                              |


### <span class="section-num">1.3</span> Явный разрыв слайда {#явный-разрыв-слайда}

-   Если текст не умещается на одном слайде, его нужно разбить. Для этого необходимо установить параметр `allowframebreaks` для конкретного слайда:

    ```org
    ** A very long "frame" with breaks
    :PROPERTIES:
    :BEAMER_OPT: allowframebreaks,label=
    :END:
    ```
-   Чтобы добавить явный разрыв страницы:

    ```org
    #+beamer: \framebreak
    ```
-   Можно установить глобально для всех слайдов:

    ```org
    #+BIND: org-beamer-frame-default-options "allowframebreaks"
    ```


### <span class="section-num">1.4</span> Таблицы {#таблицы}


#### <span class="section-num">1.4.1</span> Управление шириной таблицы {#управление-шириной-таблицы}

Можно задать атрибуты для таблицы:

```org
#+ATTR_LATEX: :align lp{0.4\linewidth}l
```
