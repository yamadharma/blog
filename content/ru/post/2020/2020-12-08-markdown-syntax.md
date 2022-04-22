---
title: "Синтаксис языка Markdown"
author: ["Dmitry S. Kulyabov"]
date: 2020-10-22T09:48:00+03:00
lastmod: 2022-04-17T17:47:00+03:00
tags: ["programming", "education"]
categories: ["computer-science"]
draft: false
slug: "markdown-syntax"
---

Общая информация по языку Markdown.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Варианты языка Markdown {#варианты-языка-markdown}

-   Генератор статистических сайтов [Hugo](https://gohugo.io/) (см. [Генератор статических сайтов Hugo]({{< relref "2020-12-07-hugo-site-generator" >}})) использует вариант Markdown на основе библиотеки [Goldmark](https://github.com/yuin/goldmark/) (см. [Синтаксис markdown для генератора сайтов Hugo]({{< relref "2020-11-26-hugo-markdown" >}})).


## <span class="section-num">2</span> Специальные элементы {#специальные-элементы}


### <span class="section-num">2.1</span> Видео _Youtube_ {#видео-youtube}

-   Видео youtube нельзя добавить напрямую.
-   В некоторых особых случаях можно добавлять непосредственно ссылку (например, в системе Moodle).
-   Можно добавить изображение со ссылкой на видео в виде `html`:

    ```html
    <a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE" target="_blank">
      <img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" alt="alternative text for search engines" width="240" height="180" border="10" />
    </a>
    ```
-   Можно добавить изображение со ссылкой на видео в виде `markdown` (см. [Миниатюры видео для youtube]({{< relref "2022-02-05-youtube-video-thumbnail" >}})):

    ```markdown
    [![alternative text for search engines](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID)
    ```


### <span class="section-num">2.2</span> Видео _Rutube_ {#видео-rutube}

-   Идентификатор видео на _Rutube_ представляет собой шестнадцатеричное число.
-   В адресе для миниатюры используются первые цифры идентификатора.
-   Изображение со ссылкой на видео в виде `markdown`:

    ```markdown
    [![alternative text for search engines](https://pic.rutubelist.ru/video/12/34/RUTUBE_PIC_ID.jpg)](https://rutube.ru/video/RUTUBE_VIDEO_ID/)
    ```

    -   Здесь 12 --- первые 2 цифры `RUTUBE_PIC_ID`; 34 --- 3 и 4 цифры `RUTUBE_PIC_ID`.
-   Связь `RUTUBE_PIC_ID` и `RUTUBE_VIDEO_ID` мне пока не понятна.
