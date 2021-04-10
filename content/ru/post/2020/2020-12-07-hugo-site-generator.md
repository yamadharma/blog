---
title: "Генератор статических сайтов Hugo"
date: 2020-12-07T14:06:00+03:00
lastmod: 2021-02-23T12:03:00+03:00
tags: ["blogging"]
categories: ["sysadmin"]
draft: false
slug: "hugo-site-generator"
---

Особенности генератора статических сайтов Hugo.

<!--more-->

{{< toc >}}


## Язык описания страниц {#язык-описания-страниц}

-   В качестве языка описания страниц используется Markdown. Сам Hugo использует библиотеку [Goldmark](https://github.com/yuin/goldmark/). Этот диалект полностью соответствует спецификации [CommonMark](https://commonmark.org/).
-   Язык расширен в основном за счёт операторов (shortcodes) и поддержки расширений для диаграмм, LaTeX и др. [Синтаксис Markdown для генератора сайтов Hugo]({{< relref "2020-11-26-hugo-markdown" >}}).
-   Кроме того, возможно использование и других диалектов Markdown.
-   Также возможно использование [Emacs Org-mode](https://github.com/niklasfasching/go-org), [AsciiDoc](https://asciidoctor.org/), [RST](http://docutils.sourceforge.net/rst.html), [Pandoc](https://www.pandoc.org/) через внешние программы.


## Собственная favicon для сайта {#собственная-favicon-для-сайта}

-   Собственная иконка для сайта делается в виде файла `icon.png`, размеры 512x512 пикселей.
-   Иконка располагается в каталоге `assets/media/`.


## Backlinks {#backlinks}

-   [Введение в научное программирование]({{< relref "2020-10-11-introduction-scientific-programming" >}})

<!--listend-->

-   [Синтаксис языка Markdown]({{< relref "2020-12-08-markdown-syntax" >}})
