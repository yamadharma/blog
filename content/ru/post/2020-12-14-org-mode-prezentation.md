---
title: "Org-mode. Презентации"
date: 2020-12-14T10:49:00+03:00
lastmod: 2021-02-21T20:04:00+03:00
tags: ["org-mode", "emacs"]
categories: ["blog"]
draft: false
slug: "org-mode-prezentation"
---

## Beamer {#beamer}


### Конфигурационный файл Emacs {#конфигурационный-файл-emacs}

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


### Опции экспорта {#опции-экспорта}

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
