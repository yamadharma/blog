---
title: "Обратные ссылки в Hugo"
date: 2021-06-02T17:19:00+03:00
lastmod: 2021-07-02T16:51:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "backlinks-hugo"
---

Можно создавать обратные ссылки и в самом Hugo.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Источники обратных ссылок {#источники-обратных-ссылок}

-   У меня обратные ссылки получаются из заметок в Org-roam, которые я стараюсь вести по методике Zettelkasten (см. [Метод Zettelkasten]({{< relref "2021-02-18-zettelkasten-method" >}})).
-   В этом случае можно создавать их напрямую из emacs.
-   Но, возможно, оптимальнее создавать их с помощью самого Hugo.


## <span class="section-num">2</span> Создание обратных ссылок в Hugo {#создание-обратных-ссылок-в-hugo}


### <span class="section-num">2.1</span> Общая информация {#общая-информация}

-   Примеры создания обратных ссылок в Hugo:
    -   <https://gabrielleearnshaw.medium.com/implementing-backlinks-in-a-hugo-website-e548d3d8f0e0>
    -   <https://seds.nl/notes/export%5Forg%5Froam%5Fbacklinks%5Fwith%5Fgohugo/>
-   Есть тема для Hugo, основным свойством которой является поддержка обратных ссылок:
    -   <https://github.com/kausalflow/connectome>
-   Для создания обратных ссылок необходимо поправить шаблон.
-   Саму генерацию обратных ссылок будем выполнять с помощью механизма _частичных шаблонов_:
    -   <https://gohugo.io/templates/partials/>.
-   Шаблон страницы будем делать на основе шаблона _single page_:
    -   <https://gohugo.io/templates/single-page-templates>.


### <span class="section-num">2.2</span> Каталоги для новой структуры {#каталоги-для-новой-структуры}

-   Добавим каталог `layouts` в корень нашего сайта для создания собственных шаблонов:

    ```shell
    layouts
    ├── _default
    │   └── single.html
    └── partials
        └── backlinks.html
    ```


### <span class="section-num">2.3</span> Шаблон генерации обратных ссылок {#шаблон-генерации-обратных-ссылок}

-   Зададим частичный шаблон `layouts/partials/backlinks.html`, создающий список обратных ссылок и отображающий его:

    ```html
    {{ $re := $.File.BaseFileName }}
    {{ $backlinks := slice }}
    {{ range .Site.AllPages }}
       {{ if and (findRE $re .RawContent) (not (eq $re .File.BaseFileName)) }}
          {{ $backlinks = $backlinks | append . }}
       {{ end }}
    {{ end }}

    <hr>
    {{ if gt (len $backlinks) 0 }}
      <div class="bl-section">
        <h4>Links to this note</h4>
        <div class="backlinks">
          <ul>
           {{ range $backlinks }}
    	  <li><a href="{{ .RelPermalink }}">{{ .Title }}</a></li>
           {{ end }}
         </ul>
        </div>
      </div>
    {{ else  }}
      <div class="bl-section">
        <h4>No notes link to this note</h4>
      </div>
    {{ end }}
    ```


### <span class="section-num">2.4</span> Шаблон страницы {#шаблон-страницы}

-   Шаблон страницы лучше делать на основе используемой темы.
-   Я использую шаблон _Academic_ (`https://github.com/wowchemy/starter-hugo-academic`), основанную на модуле _wowchemy_ (`https://github.com/wowchemy/wowchemy-hugo-modules.git`).
    -   Скачиваю модуль:

        ```shell
        git clone https://github.com/wowchemy/wowchemy-hugo-modules.git
        ```
    -   Копирую файл `wowchemy-hugo-modules/wowchemy/layouts/_default/single.html` в локальный каталог. Он имеет следующий вид (зависит от темы):

        ```html
        {{- define "main" -}}

        <article class="article">

          {{ partial "page_header" . }}

          <div class="article-container">

            <div class="article-style">
              {{ .Content }}
            </div>

            {{ partial "page_footer" . }}

          </div>
        </article>

        {{- end -}}
        ```
    -   Добавляю использование частичного шаблона обратных ссылок:

        ```diff
        --- orig/single.html	2021-06-02 18:12:17.337530907 +0300
        +++ single.html	2021-06-02 16:15:08.178764024 +0300
        @@ -8,6 +8,7 @@

             <div class="article-style">
               {{ .Content }}
        ​+      {{ partial "backlinks" . }}
             </div>

             {{ partial "page_footer" . }}
        ```
    -   Получаю следующий файл `layouts/_default/single.html`:

        ```html
        {{- define "main" -}}

        <article class="article">

          {{ partial "page_header" . }}

          <div class="article-container">

            <div class="article-style">
              {{ .Content }}
              {{ partial "backlinks" . }}
            </div>

            {{ partial "page_footer" . }}

          </div>
        </article>

        {{- end -}}
        ```
