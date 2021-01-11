---
title: "Генератор статических сайтов Hugo"
date: 2020-12-07T14:06:00+03:00
lastmod: 2021-01-10T20:21:00+03:00
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


## Backlinks {#backlinks}


### [Введение в научное программирование]({{< relref "2020-10-11-introduction-scientific-programming" >}}) {#введение-в-научное-программирование}

Генератор сайтов Hugo [Генератор статических сайтов Hugo]({{< relref "2020-12-07-hugo-site-generator" >}}).


### [Синтаксис языка Markdown]({{< relref "2020-12-08-markdown-syntax" >}}) {#синтаксис-языка-markdown}

Генератор статистических сайтов [Hugo](https://gohugo.io/) [Генератор статических сайтов Hugo]({{< relref "2020-12-07-hugo-site-generator" >}}) использует вариант Markdown на основе библиотеки [Goldmark](https://github.com/yuin/goldmark/) [Синтаксис markdown для генератора сайтов Hugo]({{< relref "2020-11-26-hugo-markdown" >}}).
