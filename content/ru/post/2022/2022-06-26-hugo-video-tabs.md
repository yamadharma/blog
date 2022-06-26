---
title: "Hugo. Видео во вкладках"
author: ["Dmitry S. Kulyabov"]
date: 2022-06-26T18:46:00+03:00
lastmod: 2022-06-26T19:35:00+03:00
tags: ["hugo"]
categories: ["computer-science"]
draft: false
slug: "hugo-video-tabs"
---

Размещение видео во вкладках на сайте.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Прагматика {#прагматика}

-   Из-за проблем с _Youtube_ было принято решение размещать видео параллельно на _RuTube_.
-   Размещение видеофайлов последовательно выглядит несколько громоздко и несколько смущает пользователя.
-   Принято решение размещать видео с разных хостингов на вкладках.


## <span class="section-num">2</span> Реализация {#реализация}

-   Релизация строится на добавлении сокращений для вкладок (см. [Hugo. Вкладки]({{< relref "2022-06-26-hugo-tabbed-view" >}})).
-   При использовании сокращения `tab` отображается не видеоплеер, а код.
-   Поэтому я дополнительно ввёл сокращение `rtab` (raw tab):

<!--listend-->

```html
{{ $tabName := .Get "tabName" }}
{{ $tabID := delimit (shuffle (slice "a" "b" "c" "d" "e" "f")) "" }}
{{ .Parent.Scratch.Add "tabName" (slice $tabName) }}
{{ .Parent.Scratch.Add "tabID" (slice $tabID) }}

<div class="tab-pane fade show {{ if eq .Ordinal 0 }}active {{ end }}" id="{{ $tabID }}" role="tabpanel" aria-labelledby="nav-1">

	{{ $.Inner }}

</div>
```

-   Здесь оригинальная конструкция
    ```html
    {{ $.Inner | markdownify }}
    ```
    заменена на
    ```html
    {{ $.Inner }}
    ```
-   Следует разместить этот файл в каталоге `layouts/shortcodes` сайта.


## <span class="section-num">3</span> Использование {#использование}

-   Код:
    ```markdown
    {{</* tabs tabTotal="2" */>}}
    {{</* rtab tabName="RuTube" */>}}

    {{</* rutube 1bea1bcf9215678e8ccf797187cc52fd */>}}

    {{</* /rtab */>}}
    {{</* rtab tabName="Youtube" */>}}

    {{</* youtube ysEdxhyYl8k */>}}

    {{</* /rtab */>}}
    {{</* /tabs */>}}
    ```
-   Отображение:

    {{< tabs tabTotal="2" >}}
    {{< rtab tabName="RuTube" >}}

    {{< rutube 1bea1bcf9215678e8ccf797187cc52fd >}}

    {{< /rtab >}}
    {{< rtab tabName="Youtube" >}}

    {{< youtube ysEdxhyYl8k >}}

    {{< /rtab >}}
    {{< /tabs >}}
