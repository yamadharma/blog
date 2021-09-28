---
title: "Научное программное обеспечение"
author: ["Dmitry S. Kulyabov"]
date: 2021-08-25T12:10:00+03:00
lastmod: 2021-08-25T18:50:00+03:00
draft: false
slug: "scientific-software"
---

Научное программное обеспечение. Специфика. Назначение.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Специфика научного программного обеспечения {#специфика-научного-программного-обеспечения}

-   Научное ПО имеет ряд особенностей, которые не встречаются в современном коммерческом ПО.


### <span class="section-num">1.1</span> Используемые алгоритмы крайне сложны {#используемые-алгоритмы-крайне-сложны}

-   Зачастую в них разбирается очень узкая группа людей (в мире).


### <span class="section-num">1.2</span> Низкая универсальность {#низкая-универсальность}

-   Всё, что можно сделать стандартными методами, уже давно сделано.


### <span class="section-num">1.3</span> Уникальная модель распространения {#уникальная-модель-распространения}

-   Основной источник информации о научном ПО --- реферируемые научные журналы.
-   Информация о самих программах становится доступным уже после того, как с помощью этих программ были получены и опубликованы научные результаты.
-   Наличие результата оправдывает существование описываемого программного обеспечения.


### <span class="section-num">1.4</span> Остаточное финансирование {#остаточное-финансирование}

-   Кроме редких специфических случаев на научное ПО не выдаётся целенаправленное финансирование.
-   Написание ПО рассматривается как производная от конкретной научной задачи.
-   Иногда крупные популярные программы удостаиваются отдельных грантов.


### <span class="section-num">1.5</span> Учёный --- не программист {#учёный-не-программист}

-   Программы пишутся самими учёными, не являющимися специалистами в индустриальной разработке программного обеспечения.
-   Важен научный результат.
-   Культуре разработки уделяется мало внимания.


### <span class="section-num">1.6</span> Унаследованный код (legacy) {#унаследованный-код--legacy}

-   Наследуется код и средства разработки.
-   Большой процент технического долга.
-   Возникают требования к средствам разработки: большое время жизни и поддержка давно разработанного ПО.
-   Поэтому стараются избегать средств программирования, нарушающих совместимость (как пример, python).


### <span class="section-num">1.7</span> Фрагментация разработки {#фрагментация-разработки}

-   Разные модули программ пишутся разными людьми (студентами, аспирантами, сотрудниками).
-   Они работают над кодом в течение 2--3 лет, пока это нужно для подготовки диплома или диссертации, или пока есть финансирование.
-   Код бросается в полусыром виде.
-   Из-за отсутствия культуры программирования через несколько лет возникает спагетти-код.


### <span class="section-num">1.8</span> Сложность отладки и тестирования {#сложность-отладки-и-тестирования}

-   Сравнить результаты работы программ зачастую просто не с чем (т.к. это и есть передний край науки).
-   Для отладки программы, её приходится сравнивать с верификацией модели.


### <span class="section-num">1.9</span> Требования к пользователям {#требования-к-пользователям}

-   Трудно отделить ошибки программы от специфики исследуемого объекта.
-   Для интерпретации полученного результата нужна высокая научная квалификация пользователя.