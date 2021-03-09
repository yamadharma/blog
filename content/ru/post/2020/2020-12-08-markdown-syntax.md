---
title: "Синтаксис языка Markdown"
date: 2020-10-22T09:48:00+03:00
lastmod: 2021-03-07T21:54:00+03:00
tags: ["programming"]
categories: ["soft"]
draft: false
slug: "markdown-syntax"
---

Общая информация по языку Markdown.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Варианты языка Markdown {#варианты-языка-markdown}

-   Генератор статистических сайтов [Hugo](https://gohugo.io/) (см. [Генератор статических сайтов Hugo]({{< relref "2020-12-07-hugo-site-generator" >}})) использует вариант Markdown на основе библиотеки [Goldmark](https://github.com/yuin/goldmark/) (см. [Синтаксис markdown для генератора сайтов Hugo]({{< relref "2020-11-26-hugo-markdown" >}})).


## <span class="section-num">2</span> Видео youtube {#видео-youtube}

-   Видео youtube нельзя добавить напрямую.
-   В некоторых особых случаях можно добавлять непосредственно ссылку (например, в системе Moodle).
-   Можно добавить изображение со ссылкой на видео в виде `html`:

    ```html
    <a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE" target="_blank">
      <img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" alt="alternative text for search engines" width="240" height="180" border="10" />
    </a>
    ```
-   Можно добавить изображение со ссылкой на видео в виде `markdown`:

    ```markdown
    [![alternative text for search engines](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)
    ```


## <span class="section-num">3</span> Backlinks {#backlinks}

-   [Введение в научное программирование]({{< relref "2020-10-11-introduction-scientific-programming" >}})
