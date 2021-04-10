---
title: "Диаграммы. Mermaid"
date: 2021-01-03T14:19:00+03:00
lastmod: 2021-01-10T18:58:00+03:00
tags: ["blogging"]
categories: ["sysadmin"]
draft: false
slug: "diagrams-mermaid"
---

Материалы по языку рисования диаграмм Mermaid.

<!--more-->

{{< toc >}}


## Введение {#введение}

-   Mermaid - язык программирования для рисования диаграмм и библиотека для визуализации.
-   Инструментарий написан на javascript.
-   Интегрирован в системы рендеринга языка Markdown:
    -   Pandoc: <https://pandoc.org/>
    -   Hugo: <https://gohugo.io/>


## Ресурсы {#ресурсы}

-   Страница Mermaid: <https://mermaid-js.github.io/>
-   Страница на github: <https://github.com/mermaid-js/mermaid>
-   Утилита командной строки: <https://github.com/mermaid-js/mermaid-cli>
-   HTTP сервер: <https://github.com/TomWright/mermaid-server>
-   Онлайн редактор: <https://mermaid-js.github.io/mermaid-live-editor/>


## Синтаксис {#синтаксис}


### Элементы синтаксиса {#элементы-синтаксиса}

-   Стили фигур
-   Стили соединителей
    -   стрелка
    -   пунктир
    -   без стрелки
    -   стрелка с меткой
-   Комментарий
-   Ориентация
    -   `TB` - сверху вниз
    -   `TD` - сверху вниз
    -   `BT` - снизу вверх
    -   `RL` - справа налево
    -   `LR` - слева направо


### Типы диаграмм {#типы-диаграмм}


#### graph {#graph}


#### Круговая диаграмма (pie) {#круговая-диаграмма--pie}


#### gantt {#gantt}


#### sequenceDiagram {#sequencediagram}


#### stateDiagram {#statediagram}


#### classDiagram {#classdiagram}


#### gitgraph {#gitgraph}


## Backlinks {#backlinks}


### [Синтаксис Markdown для генератора сайтов Hugo]({{< relref "2020-11-26-hugo-markdown" >}}) {#синтаксис-markdown-для-генератора-сайтов-hugo}

Как обычно для Markdown поддерживается расширение для рисования диаграмм [mermaid](https://mermaid-js.github.io/mermaid/) (см. [Диаграммы. Mermaid]({{< relref "2021-01-03-diagrams-mermaid" >}})). Для использования нужно включить эту функцию в файле `params.toml` или добавив `diagram: true` в преамбуле страницы.
