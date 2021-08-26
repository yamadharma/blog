---
title: "Org-mode. Экспорт в LaTeX"
author: ["Dmitry S. Kulyabov"]
date: 2020-12-14T10:35:00+03:00
lastmod: 2021-08-24T17:30:00+03:00
tags: ["org-mode", "emacs", "tex"]
categories: ["computer-science"]
draft: false
slug: "org-mode-export-latex"
---

Экспорт из org-mode в LaTeX.

<!--more-->

{{< toc >}}

Общие настройки экспорта из org-mode описаны в [Org-mode. Экспорт]({{< relref "2020-12-10-org-mode-export" >}}).


## Параметры экспорта {#параметры-экспорта}


### Значения параметров экспорта {#значения-параметров-экспорта}


### Соответствие параметров экспорта для файла и поддерева {#соответствие-параметров-экспорта-для-файла-и-поддерева}

<a id="table--Опции экспорта для файла и поддерева"></a>

| Опции экспорта файла  | Опции экспорта поддерева      |
|-----------------------|-------------------------------|
| LaTeX\_CLASS          | EXPORT\_LaTeX\_CLASS          |
| LaTeX\_CLASS\_OPTIONS | EXPORT\_LaTeX\_CLASS\_OPTIONS |
| LaTeX\_HEADER         | EXPORT\_LaTeX\_HEADER         |


## Специальные варианты экспорта {#специальные-варианты-экспорта}


### Экспорт фрагментов математики {#экспорт-фрагментов-математики}

-   Применяется для экспорта в формат `odt`.
-   Можно экспортировать в формат MathML или в виде рисунка


#### Экспорт в формате MathML {#экспорт-в-формате-mathml}

-   В файле задаётся опция:

    ```org
    #+OPTIONS: tex:t
    ```
-   Можно установить переменную emacs `org-export-with-latex`:

    ```elisp
    (setq org-export-with-latex t)
    ```
-   Устанавливается программа конвертации. Предлагается установить LaTeXML <https://dlmf.nist.gov/LaTeXML/>.
-   В Gentoo _ebuild_ находится в оверлее _flammie_.

    ```shell
    emerge dev-tex/LaTeXML
    ```
-   В конфигурационном файле задаётся переменная `org-latex-to-mathml-convert-command`:

    ```elisp
    (setq org-latex-to-mathml-convert-command
          "latexmlmath \"%i\" --presentationmathml=%o")
    ```


#### Экспорт в виде рисунка {#экспорт-в-виде-рисунка}

-   В файле устанавливаются опции:
    -   экспорт в `png`:

        ```org
        #+OPTIONS: tex:dvipng
        ```
    -   экспорт в `svg`:

        ```org
        #+OPTIONS: tex:dvisvgm
        ```
    -   экспорт в `png`:

        ```org
        #+OPTIONS: tex:imagemagick
        ```
-   Для генерации изображения запускается соответствующая программа.
