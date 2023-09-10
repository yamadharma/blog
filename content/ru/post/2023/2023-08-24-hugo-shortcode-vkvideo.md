---
title: "Hugo shortcode. Видео на VK Video"
author: ["Dmitry S. Kulyabov"]
date: 2023-08-24T18:35:00+03:00
lastmod: 2023-08-24T18:43:00+03:00
draft: false
slug: "hugo-shortcode-vkvideo"
---

Shortcode для видео _VK Video_ для Hugo.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общее описание {#общее-описание}

-   Видеохостинг _VK Video_: <https://vk.com/video>.
-   Реализация сделана на скорую руку.


## <span class="section-num">2</span> Реализация {#реализация}

-   Добавьте в структуру сайта Hugo файл `layouts/shortcodes/vkvideo.html`:
    ```html
    <div class="embed video-player">
      <iframe
        {{ if .IsNamedParams }}
        src="https://vk.com/video_ext.php?oid={{ .Get "oid" }}&id={{ .Get "id" }}&hd={{ .Get "hd" }}"
        {{ else }}
        src="https://vk.com/video_ext.php?oid={{ index .Params 0 }}&id={{ index .Params 1 }}&hd={{ index .Params 2 }}"
        {{ end }}
        width="720" height="405" allow="autoplay; encrypted-media; fullscreen; picture-in-picture;" frameborder="0" allowfullscreen></iframe>
    </div>
    ```


## <span class="section-num">3</span> Использование {#использование}


### <span class="section-num">3.1</span> Параметры {#параметры}

-   `oid`: идентификатор владельца;
-   `id`: идентификатор видео;
-   `hd`: хэш (внутренняя функция хостера).


### <span class="section-num">3.2</span> Вставка видео {#вставка-видео}

-   Для вставки видео _VK Video_ используется следующая конструкция (с именованными параметрами):
    ```markdown
    {{</* vkvideo oid="606414976" id="456239563" hd="2" */>}}
    ```
-   Для вставки видео _VK Video_ используется следующая конструкция (с позиционными параметрами):
    ```markdown
    {{</* vkvideo 606414976 456239563 2 */>}}
    ```
