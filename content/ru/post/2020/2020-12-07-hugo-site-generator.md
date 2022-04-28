---
title: "Генератор статических сайтов Hugo"
author: ["Dmitry S. Kulyabov"]
date: 2020-12-07T14:06:00+03:00
lastmod: 2022-04-28T18:24:00+03:00
tags: ["hugo", "MOC", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "hugo-site-generator"
---

Особенности генератора статических сайтов Hugo.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Темы {#темы}

-   В рамах Hugo создан набор разнообразных тем.
-   Для сайта научного работника или научной группы можно рекомендовать набор тем Wowchemy (см. [Hugo. Шаблон для научных работников]({{< relref "2021-07-02-hugo-template-for-scientists" >}})).


## <span class="section-num">2</span> Язык описания страниц {#язык-описания-страниц}

-   В качестве языка описания страниц используется Markdown. Сам Hugo использует библиотеку [Goldmark](https://github.com/yuin/goldmark/). Этот диалект полностью соответствует спецификации [CommonMark](https://commonmark.org/).
-   Язык расширен в основном за счёт операторов (shortcodes) и поддержки расширений для диаграмм, LaTeX и др. ( см. [Синтаксис Markdown для генератора сайтов Hugo]({{< relref "2020-11-26-hugo-markdown" >}})).
-   Кроме того, возможно использование и других диалектов Markdown.
-   Также возможно использование [Emacs Org-mode](https://github.com/niklasfasching/go-org), [AsciiDoc](https://asciidoctor.org/), [RST](http://docutils.sourceforge.net/rst.html), [Pandoc](https://www.pandoc.org/) через внешние программы.


## <span class="section-num">3</span> Собственная favicon для сайта {#собственная-favicon-для-сайта}

-   Собственная иконка для сайта делается в виде файла `icon.png`, размеры 512x512 пикселей.
-   Иконка располагается в каталоге `assets/media/`.


## <span class="section-num">4</span> Взаимодействие с внешними сервисами {#взаимодействие-с-внешними-сервисами}

-   Для комментариев используются сервисы [Disqus](https://disqus.com/) и [Commento](https://commento.io/) (см. [Комментирование для статических сайтов]({{< relref "2021-05-25-commenting-static-sites" >}})).


## <span class="section-num">5</span> Процесс создания блога {#процесс-создания-блога}

-   Предлагается не писать заметки непосредственно для сайта, а использовать систему генерации статических сайтов как бэкенд для систем ведения заметок.
-   Предлагается использовать режим _org-roam_ (см. [Использование org-roam]({{< relref "2020-10-05-use-org-roam" >}})) редактора _emacs_ как реализации _Zettelkasten_ (см. [Метод Zettelkasten]({{< relref "2021-02-18-zettelkasten-method" >}})).
-   Для реализации методики _Zettelkasten_ на сайте необходима реализация обратных ссылок (см. [Обратные ссылки в Hugo]({{< relref "2021-06-02-backlinks-hugo" >}})).


## <span class="section-num">6</span> Создание статического сайта {#создание-статического-сайта}

-   [Создание сайта на Hugo]({{< relref "2022-04-12-creating-hugo-site" >}})
