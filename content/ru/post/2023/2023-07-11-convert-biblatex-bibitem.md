---
title: "Преобразование biblatex в bibitem"
author: ["Dmitry S. Kulyabov"]
date: 2023-07-11T19:48:00+03:00
lastmod: 2023-08-24T13:38:00+03:00
tags: ["tex"]
categories: ["computer-science"]
draft: false
slug: "convert-biblatex-bibitem"
---

Преобразование biblatex в bibitem.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Некоторые журналы принимают библиографию только в виде:
    ```bibtex
    \begin{thebibliography}{99}
    \bibitem{name}
    ...
    \end{thebibliography}
    ```
-   Выходной формат _bibtex_ даёт результат, очень похожий на искомый.
-   Но _biblatex_ имеет абсолютно другой формат.
-   Необходимо преобразовать файлы, создаваемые _biblatex_, в искомый вид.


## <span class="section-num">2</span> Пакет `biblatex2bibitem` {#пакет-biblatex2bibitem}

-   Репозиторий: <https://gitlab.com/Nickkolok/biblatex2bibitem>
-   Входит в состав TeXlive.


## <span class="section-num">3</span> Использование {#использование}

-   В преамбуле после загрузки biblatex добавьте:
    ```latex
    \usepackage{biblatex2bibitem}
    ```
-   В конце документа добавьте:
    ```latex
    \printbibitembibliography
    ```
-   Результат в виде `bibitems` будет записан непосредственно в файл pdf.
-   Этот код можно скопировать из файла `.pdf` в файл `.tex`.
-   Скопировать можно мышкой, выделив нужные строки в просмотрщике.
-   Можно скопировать с помощью `pdftotext`.


## <span class="section-num">4</span> Настройка {#настройка}


### <span class="section-num">4.1</span> Разделители bibitem {#разделители-bibitem}

-   По умолчанию полученные `bibitems` разделяются строкой с пустой парой фигурных скобок, чтобы облегчить чтение кода.
-   Можно заменить эти скобки, или просто убрать:
    ```latex
    \renewcommand{\printgeneratedbibitemseparator}{}
    ```


### <span class="section-num">4.2</span> Другие переопределяемые команды {#другие-переопределяемые-команды}

-   `\print@begin@thebibliography`: по умолчанию `\begin{thebibliography}{99}`;
-   `\print@end@thebibliography`: по умолчанию `\end{thebibliography}`;
-   `\print@bibitem@command`: по умолчанию `\bibitem`.
