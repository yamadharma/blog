---
title: "Видео. KDEnlive. Создание intro и outro"
author: ["Dmitry S. Kulyabov"]
date: 2021-07-23T19:47:00+03:00
lastmod: 2021-07-23T20:04:00+03:00
categories: ["computer_science"]
draft: false
slug: "video-kdenlive-creation-intro-outro"
---

Создание _intro_ и _outro_ с помощью KDEnlive.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   _intro_ --- заставка в начале видео.
-   _outro_ --- финальная заставка видео.
-   Служат для привлечения внимания и выработки условного рефлекса у зрителя.


## <span class="section-num">2</span> Слияние файлов {#слияние-файлов}

-   После создания заставок их надо добавить к исходному файлу.
-   Предлагается для Этого использовать Avidemux (<http://avidemux.sourceforge.net/>).
-   С помощью командной строки это можно сделать так:

    ```shell
    yes | avidemux3_cli --load intro.mp4 --append input.mkv --append outro.mp4 --output-format mkv --save output.mkv
    ```
-   Поскольку `avidemux3_cli` просит подтверждение действий, я добавил в начало команду `yes` (чтобы не отвечать).


## <span class="section-num">3</span> Видео {#видео}

{{< youtube vu7GrfNyT-M >}}
