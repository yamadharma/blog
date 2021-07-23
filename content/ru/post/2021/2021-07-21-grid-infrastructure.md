---
title: "Инфраструктура GRID"
author: ["Dmitry S. Kulyabov"]
date: 2021-07-21T12:39:00+03:00
lastmod: 2021-07-21T16:03:00+03:00
categories: ["сиянс"]
draft: false
slug: "grid-infrastructure"
---

Инфраструктура GRID. Работа в рамках этой инфраструктуры.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Краткая информация {#краткая-информация}

-   WLCG (Worldwide LHC Computing Grid) предназначен для обработки больших объёмов данных, поступающих с LHC (Большой адронный коллайдер, БАК).
-   В его состав входит 170 вычислительных центров из 36 стран.
-   Грид LCG был запущен 3 октября 2008 года.
-   Сайт: <https://wlcg.web.cern.ch/>


## <span class="section-num">2</span> Уровни ГРИДа ЦЕРН {#уровни-грида-церн}


### <span class="section-num">2.1</span> Структура уровней {#структура-уровней}

-   Состоит из центров разных уровней или ярусов (Tier):
    -   Tier-0:
        -   1 центр: CERN + Будапешт (Венгрия);
    -   Tier-1:
        -   в России есть 1 центр ОИЯИ (Дубна) (эксперимент CMS) + «Курчатовский институт» (эксперименты ALICE, ATLAS и LHCb);
    -   Tier-2;
    -   Tier-3;
    -   компьютеры пользователей.


### <span class="section-num">2.2</span> Поток данных {#поток-данных}

-   Уровни различаются по масштабу ресурсов (сетевые, вычислительные, дисковые, архивные) и по выполняемым функциям.
-   Tier-0 --- первичная реконструкция событий, калибровка, хранение копий полных баз данных.
    -   Изначально файл с данными эксперимента хранится на компьютерной ферме эксперимента.
    -   Спустя время происходит трансферт данных из эксперимента в центральный компьютерный центр ЦЕРН (сайт Tier-0).
    -   Здесь происходит первичная обработка данных.
    -   Он является двойным компьютерным центром: одна часть находится в ЦЕРН под Женевой, а вторая часть --- в Будапеште, Венгрии.
    -   Его основная задача --- сохранить данные.
    -   Данные хранятся на магнитных лентах (библиотеки).
-   Tier-1 --- полная реконструкция событий, хранение актуальных баз данных по событиям, создание и хранение наборов анализируемых событий, моделирование, анализ.
    -   Обработка происходит в компьютерных центрах первого уровня (сайты Tier-1).
    -   Производится первичный анализ данных.
    -   Учёные не имеют доступа к сайтам на уровне Tier-1.
-   Tier-2 --- репликация и хранение наборов анализируемых событий, моделирование, анализ.
    -   Это сайты, компьютерные центры уровня университета или большого института.
    -   Анализ обработанных данных.
    -   Зачастую исследователям нужны обработанные данные, а не сырые.
    -   Работают в основном обычные учёные, использующие приготовленные данные.
    -   Генерация симулированных событий.
-   Tier-3 --- кластеры отдельных исследовательских групп.
    -   Это уже гораздо более простые сайты.
    -   Данные обрабатываются и постобрабатываются.
    -   Обучаются простые модели машинного обучения, необходимые для последующего анализа данных.


## <span class="section-num">3</span> Технические ограничения {#технические-ограничения}

-   В рамках проекта создаётся 27 ТБ необработанных данных в день.
-   Плюс к этому 10 ТБ --- «краткие данные событий», которые представляют выходные расчёты, сделанные процессором фермы центра данных CERN.
-   Эти данные передаются из Tier0 в Tier1 по выделенным соединениям со скоростью 10 Гбит/с.
-   Центры уровня Tier2 подключены к сетям общего назначения.
-   Данные, получаемые в LHC на всех элементах её распределённой вычислительной сети растёт на 10--15 Петабайт ежегодно.
-   Необходимы:
    -   вычислительная мощность (суперкомпьютер);
    -   пропускная способность линий связи.


## <span class="section-num">4</span> Создание собственного центра ГРИД {#создание-собственного-центра-грид}

-   Для отдельного университета целью может являться максимум Tier-2.
-   Для сертификации по этому уровню необходима не только техническая составляющая, но и наличие серьёзной научной составляющей.
-   Кроме того, для Tier-2 необходимы значительные финансовые вливания.
-   Вполне можно начать взаимодействие на уровне Tier-3 (уровень отдельной лаборатории).