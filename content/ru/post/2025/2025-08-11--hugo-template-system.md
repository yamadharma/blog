---
title: "Hugo. Система шаблонов"
author: ["Dmitry S. Kulyabov"]
date: 2025-08-11T21:10:00+03:00
lastmod: 2025-08-11T21:49:00+03:00
tags: ["hugo"]
categories: ["computer-science"]
draft: false
slug: "hugo-template-system"
---

Hugo. Система шаблонов.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Система шаблонов (Hugo v0.146.0) {#система-шаблонов--hugo-v0-dot-146-dot-0}


### <span class="section-num">1.1</span> Общая информация {#общая-информация}

-   Документация: <https://gohugo.io/templates/new-templatesystem-overview/>


### <span class="section-num">1.2</span> Изменения в папке `layouts` {#изменения-в-папке-layouts}

-   Папка `_default`  удалена.
    -   Сделать: переместить все файлы из `layouts/_default` в `layouts/`.
-   Папка `layouts/partials` переименована в `layouts/_partials`.
    -   Сделать: переименуйте папку.

-   Папка `layouts/shortcodes` переименована в `layouts/_shortcodes`.
    -   Сделать: переименуйте папку.

-   Любая папка в `layouts`, которая не начинается с `_`, представляет собой корень каталога страниц.
    -   Он может быть вложен настолько глубоко, насколько это необходимо.
    -   Папки `_shortcodes` и `_markup` можно размещать на любом уровне.
    -   Сделать: никаких действий не требуется.

-   Нет верхнего уровня папок `layouts/taxonomy` или `layouts/section`.
    -   Сделать: переместите наверх `layouts/` с одним из типов страниц: `section`, `taxonomy` или `term` в качестве базового имени или поместите макеты в таксономию Page path.

-   Шаблон с именем `taxonomy.html` был кандидатом на оба типа страниц: `term` и `taxonomy`.
    -   Теперь это рассматривается только для `taxonomy`.
    -   Сделать: создайте `taxonomy.html` и `term.html` или создать более общий макет, например `list.html`.

-   Для базовых шаблонов (например, `baseof.html` ), в предыдущих версиях Hugo можно было добавить один идентификатор (layout, type, or kind) с дефисом перед ключевым словом baseof.
    -   Сделать: переместите этот идентификатор после первой «точки», например, переименуйте `list-baseof.html` к `baseof.list.html`.

-   Новый универсальный макет `all`.
    -   Если у вас, например, есть `layouts/all.html`, и это единственный шаблон, этот макет будет использоваться для рендеринга всех HTML-страниц.

-   Убрали концепцию шаблона `_internal`.
    -   Сделать: заменить конструкции типа `{{ template "_internal/opengraph.html" . }}` на `{{ partial "opengraph.html" . }}`.

-   Идентификаторы, которые можно использовать в имени файла шаблона относятся:
    -   к одному из типов страниц (`home`, `page`, `section`, `taxonomy`, или `term`;
    -   к одному из стандартных макетов (`list`, `single`, или `all`),
    -   к пользовательскому макету (как определено в поле `layout`);
    -   языку (например, `en`);
    -   выходному формату (например, `html`, `rss`);
    -   суффикс, представляющий тип носителя.
    -   Например, `all.en.html` и `home.rss.xml` .

-   Не существует такого понятия, как шаблон `index.html` для домашней страницы.
    -   Сделать: переименовать `index.html` в `home.html`.


## <span class="section-num">2</span> Изменения в порядке поиска шаблонов {#изменения-в-порядке-поиска-шаблонов}

Мы объединили поиск шаблонов, чтобы он работал одинаково для всех [типов шаблонов](https://gohugo.io/templates/types/) . Предыдущая конфигурация была очень сложной для понимания и имела огромное количество вариантов. Новая конфигурация призвана быть естественной и не доставлять сюрпризов.

Идентификаторы, используемые при взвешивании шаблона, в порядке важности:

| Идентификатор                                           | Описание                                                                                              |
|---------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Пользовательский макет                                  | Обычай `layout` набрано на первой полосе.                                                             |
| [Типы страниц](https://gohugo.io/methods/page/kind/)    | Один из `home`, `section`, `taxonomy`, `term`, `page` .                                               |
| Стандарт макетов 1                                      | `list` или `single` .                                                                                 |
| Формат вывода                                           | Формат вывода (например, `html`, `rss` ).                                                             |
| Стандартные макеты 2                                    | `all` .                                                                                               |
| Язык                                                    | Язык (например, `en` ).                                                                               |
| Тип носителя                                            | Тип носителя (например, `text/html` ).                                                                |
| [Путь к странице](https://gohugo.io/methods/page/path/) | Путь к странице (например, `/blog/mypost` ).                                                          |
| Тип                                                     | ~type~набрано на первой полосе. ^{[2](https://gohugo.io/templates/new-templatesystem-overview/#fn:2)} |

Для шаблонов, размещенных в =layouts=Если папка частично или полностью совпадает [с путем к странице](https://gohugo.io/methods/page/path/) , более точное совпадение вверх будет считаться _лучшим_ . В [примере структуры папки](https://gohugo.io/templates/new-templatesystem-overview/#example-folder-structure) ниже это означает, что:

-   `layouts/docs/api/_markup/render-link.html=будет использоваться для отображения ссылок из пути страницы =/docs/api` и ниже.
-   `layouts/docs/baseof.html=будет использоваться как базовый шаблон для пути к странице =/docs` и ниже.
-   `layouts/tags/term.html=будет использоваться для всех =term=рендеринг в =tags=таксономия, за исключением =blue=термин, который будет использовать =layouts/tags/blue/list.html` .


## <span class="section-num">3</span> Пример структуры папки {#пример-структуры-папки}

```c
layouts
├── baseof.html
├── baseof.term.html
├── home.html
├── page.html
├── section.html
├── taxonomy.html
├── term.html
├── term.mylayout.en.rss.xml
├── _markup
│   ├── render-codeblock-go.term.mylayout.no.rss.xml
│   └── render-link.html
├── _partials
│   └── mypartial.html
├── _shortcodes
│   ├── myshortcode.html
│   └── myshortcode.section.mylayout.en.rss.xml
├── docs
│   ├── baseof.html
│   ├── _shortcodes
│   │   └── myshortcode.html
│   └── api
│       ├── mylayout.html
│       ├── page.html
│       └── _markup
│           └── render-link.html
└── tags
    ├── taxonomy.html
    ├── term.html
    └── blue
        └── list.html
```

---

1.  Старый способ делал это очень трудным/невозможным, например, переопределить =_internal/disqus.html=в теме. Теперь можно просто создать частичный вариант с тем же именем. [↩︎](https://gohugo.io/templates/new-templatesystem-overview/#fnref:1)

2.  The =type=набор в начале текста эффективно заменит =section=папка в [пути к странице](https://gohugo.io/methods/page/path/) при выполнении поиска. [↩︎](https://gohugo.io/templates/new-templatesystem-overview/#fnref:2)
