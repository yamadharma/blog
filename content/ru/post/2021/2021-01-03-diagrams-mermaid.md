---
title: "Диаграммы. Mermaid"
author: ["Dmitry S. Kulyabov"]
date: 2021-01-03T14:19:00+03:00
lastmod: 2021-10-12T21:13:00+03:00
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


## Необходимое программное обеспечение {#необходимое-программное-обеспечение}


## Синтаксис {#синтаксис}


### Элементы синтаксиса {#элементы-синтаксиса}

-   Стили соединителей
    -   стрелка

        ```mermaid
        graph LR;
            A-->B
        ```

<!--listend-->

-   пунктир

    ```mermaid
    graph LR;
        A-.-->B
    ```
-   без стрелки
-   стрелка с меткой

<!--listend-->

-   Комментарий
-   Ориентация
    -   `TB` - сверху вниз
    -   `TD` - сверху вниз
    -   `BT` - снизу вверх
    -   `RL` - справа налево
    -   `LR` - слева направо


### Типы диаграмм {#типы-диаграмм}
