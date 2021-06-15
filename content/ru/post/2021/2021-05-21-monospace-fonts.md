---
title: "Моноширинные шрифты"
date: 2021-05-21T13:25:00+03:00
lastmod: 2021-06-14T18:34:00+03:00
tags: ["programming"]
categories: ["сиянс", "computer-science"]
draft: false
slug: "monospace-fonts"
---

Для программирования и описания программ в статьях необходим шрифт с большим количеством символов. Стандартный буквенный набор поддерживает большинство шрифтов (но не все поддерживают кириллицу), но с дополнительными символами могут возникнуть проблемы. Особенно часто дополнительные символы используются в программах на языке _Julia_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Основные определения {#основные-определения}

-   Моноширинный (непропорциональный) шрифт --- это шрифт, в котором все знаки (кегельные площадки знаков) имеют одинаковую ширину.


## <span class="section-num">2</span> Сравнение шрифтов {#сравнение-шрифтов}

-   Есть несколько сайтов, на которых сравниваются шрифты для программирования на предмет широты охвата разных символов.
    -   <https://mono-math.netlify.app/> --- математические символы в моноширинных шрифтах.
    -   <https://devfonts.gafi.dev/> --- шрифты для программирования.
    -   <https://www.programmingfonts.org/> --- шрифты для программирования.
    -   <https://coding-fonts.css-tricks.com/> --- шрифты для программирования.
-   На данный момент наибольшее количество математических символов содержит шрифт _JuliaMono_.


## <span class="section-num">3</span> Шрифты с лигатурами {#шрифты-с-лигатурами}

-   Часть шрифтов для программирования содержит лигатуры.


### <span class="section-num">3.1</span> Fira Code {#fira-code}

-   Шрифт сделан на базе Fira Mono.
-   Репозиторий: <https://github.com/tonsky/FiraCode>
-   Автор: Никита Прокопов
    -   Блог в livejournal (на русском): <https://tonsky.livejournal.com/>
    -   Блог на английском: <https://tonsky.me/>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: есть
    -   Курсив: нет
-   Установка.
    -   Gentoo:

        ```shell
        emerge media-fonts/fira-code
        ```


### <span class="section-num">3.2</span> Iosevka {#iosevka}

-   Сайт: <https://typeof.net/Iosevka/>
-   Репозиторий: <https://github.com/be5invis/Iosevka/>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: есть
    -   Курсив: есть
-   Установка.
    -   Gentoo:

        ```shell
        emerge media-fonts/iosevka
        ```


### <span class="section-num">3.3</span> JetBrains Mono {#jetbrains-mono}

-   Сайт: <https://www.jetbrains.com/lp/mono/>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: есть
    -   Курсив: есть
-   Установка.
    -   Gentoo:

        ```shell
        emerge media-fonts/jetbrains-mono
        ```


### <span class="section-num">3.4</span> JuliaMono {#juliamono}

-   Достаточно полный набор математических символов:
    -   <https://mono-math.netlify.app/#JuliaMono>
    -   <https://coding-fonts.css-tricks.com/fonts/juliamono/?language=charmap>
-   <https://juliamono.netlify.app/>
-   <https://github.com/cormullion/juliamono>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: есть
    -   Курсив: нет
-   LaTeX
    -   Использование в LuaLaTeX и XeTeX:

        ```latex
        \newfontfamily\JuliaMono{JuliaMono-Regular}
        \newfontface\JuliaMonoMedium{JuliaMono-Regular}
        \setmonofont{JuliaMonoMedium}[Contextuals=Alternate]
        ```
    -   Стиль для `listings`:
        -   <https://github.com/mossr/julia-mono-listings>


### <span class="section-num">3.5</span> Hasklig {#hasklig}

-   Сделан на основе Source Code Pro с добавлением лигатур.
-   Репозиторий: <https://github.com/i-tu/Hasklig>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: есть
    -   Курсив: нет


### <span class="section-num">3.6</span> Cascadia Code {#cascadia-code}

-   Разработан для Windows Terminal.
-   Репозиторий: <https://github.com/microsoft/cascadia-code>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: есть
    -   Курсив: нет
-   Установка.
    -   Gentoo:

        ```shell
        emerge media-fonts/cascadia-code
        ```


## <span class="section-num">4</span> Применимость {#применимость}

-   Шрифт для редактора (например, emacs) желательно выбирать с курсивом. Иначе, теряется определённый набор выделений текста.


## <span class="section-num">5</span> Шрифты с иконками {#шрифты-с-иконками}


### <span class="section-num">5.1</span> Font Awesome {#font-awesome}

-   Наиболее известный шрифт с иконками.
-   <https://fontawesome.com/>
-   Font Awesome Pro
    -   <https://fontawesome.com/pro>
    -   Распространяется по платной подписке.
-   Font Awesome Free
    -   <https://github.com/FortAwesome/Font-Awesome>
    -   Лицензия:
        -   Иконки: CC BY 4.0
        -   Шрифты: SIL Open Font licence
        -   Программный код: MIT
    -   Для использования шрифта можно использовать список кодов для иконок <https://fontawesome.com/cheatsheet>.


### <span class="section-num">5.2</span> Nerd fonts {#nerd-fonts}

-   Проект по добавлению ы разные шрифты дополнительных глифов (в основном иконок).
-   <https://www.nerdfonts.com/>


## <span class="section-num">6</span> Шрифты {#шрифты}


### <span class="section-num">6.1</span> Source Code Pro {#source-code-pro}

-   Часть набора Source Pro.
-   Сайт: <http://adobe-fonts.github.io/source-code-pro/>
-   Репозиторий: <https://github.com/adobe-fonts/source-code-pro>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: нет
    -   Курсив: нет
-   Установка.
    -   Gentoo:

        ```shell
        emerge media-fonts/source-pro
        ```


### <span class="section-num">6.2</span> Hack {#hack}

-   Репозиторий: <https://github.com/source-foundry/Hack>
-   Свойства
    -   Лицензия: SIL Open Font licence
    -   Лигатуры: нет
    -   Курсив: есть
-   Установка.
    -   Gentoo:

        ```shell
        emerge media-fonts/hack
        ```
