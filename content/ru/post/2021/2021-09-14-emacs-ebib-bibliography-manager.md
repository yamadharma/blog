---
title: "Emacs. Менеджер библиографической информации Ebib"
author: ["Dmitry S. Kulyabov"]
date: 2021-09-14T16:19:00+03:00
lastmod: 2021-09-25T21:00:00+03:00
tags: ["emacs", "sysadmin"]
categories: ["science", "computer-science"]
draft: false
slug: "emacs-ebib-bibliography-manager"
---

Менеджер библиографической информации _Ebib_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}


## <span class="section-num">2</span> Организация библиографической информации {#организация-библиографической-информации}


## <span class="section-num">3</span> Управление списками чтения {#управление-списками-чтения}


### <span class="section-num">3.1</span> Общая информация {#общая-информация}

-   Есть возможность управлять списком чтения в виде org-файла.
-   Имя файла задаётся `ebib-reading-list-file`.
-   В строке режима буфера записи будет отображаться `[R]` для записи из списка чтения.


### <span class="section-num">3.2</span> Комбинации клавиш {#комбинации-клавиш}

-   `R d`: пометить запись как выполненную.
-   `R a`: добавить текущую запись в список чтения.
-   `R v`: просмотр листа чтения.


### <span class="section-num">3.3</span> Шаблоны захвата {#шаблоны-захвата}

-   Шаблон задаётся в переменной `ebib-reading-list-template`.


#### <span class="section-num">3.3.1</span> Модификаторы шаблона {#модификаторы-шаблона}

-   `%K` (`ebib-reading-list-create-org-identifier`)
    -   Ключ записи. Заносится в свойства записи как `:Custom_id:`.
-   `%T` (`ebib-create-org-title`)
    -   Название публикации
-   `%M` (`ebib-reading-list-todo-marker`)
    -   Метка выполнения записи.
    -   По умолчанию `TODO`.
-   `%L` (`ebib-create-org-link`)
    -   Ссылка на файл публикации.
-   `%F` (`ebib-create-org-file-link`)
    -   Ссылка на файл публикации.
-   `%D` (`ebib-create-org-doi-link`)
    -   Ссылка на _doi_ публикации.
-   `%U` (`bib-create-org-url-link`)
    -   Ссылка на _url_ публикации.


#### <span class="section-num">3.3.2</span> Пример шаблона захвата {#пример-шаблона-захвата}

-   Шаблон по умолчанию имеет вид:

    ```elisp
    (setq ebib-reading-list-template "* %M %T\n:PROPERTIES:\n%K\n:END:\n%F\n")
    ```
