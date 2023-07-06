---
title: "Спецификации компьютеров"
author: ["Dmitry S. Kulyabov"]
date: 2023-06-11T21:50:00+03:00
lastmod: 2023-06-23T13:09:00+03:00
tags: ["sysadmin", "rudn"]
categories: ["computer-science", "job"]
draft: false
slug: "computer-specifications"
---

Мне время от времени приходится делать спецификации компьютерного оборудования для закупок. Правда, зачастую покупают несколько другое оборудование.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> 2023 {#2023}


### <span class="section-num">1.1</span> Спецификация сервера для ИФиТ {#спецификация-сервера-для-ифит}


#### <span class="section-num">1.1.1</span> Требования к серверу {#требования-к-серверу}

1.  Перечень программного обеспечения, установленного на сервере (наименование, версия, тип лицензии, количественные характеристики).
    -   Программный комплекс параллельных вычислений (написанный силами сотрудников).
    -   FlexNet
    -   LabView
    -   Matlab
    -   Maple
    -   Digital Visual Fortran
    -   OriginLab
    -   База данных с поддержкой SQL
2.  Описание клиент-серверного взаимодействия (сервер – дисплейный класс) для каждой единицы программного обеспечения из п.1.
    -   Организация и связывание компьютеров для обеспечения параллельных вычислений.
    -   Сервер FlexNet используется для обеспечения сетевых лицензий пакетов научной графики и численного анализа данных OriginLab.
    -   Набор функций, позволяющий связать и управлять объектами как виртуальных, так и физических инструментов и средой LabView.
    -   Пакет прикладных программ для решения задач технических вычислений. Используется в качестве сервера для вычислений.
    -   Система компьютерной математики. Обеспечение параллельной работы с системой подготовки научной документации, численных и аналитических вычислений посредством Web-технологий (браузер) с нескольких устройств.
    -   Набор библиотек для разработки на языке Фортран.
    -   Обеспечение хранения и организации экспериментальных данных, научной библиотеки, используемой студентами и сотрудниками в своей учебной и научной работе.
3.  Общий объем накопленных данных с указанием срока накопления этих данных.
    -   Приблизительно около 25 ТБ в течение 15 лет.


#### <span class="section-num">1.1.2</span> Анализ требований {#анализ-требований}

-   От сервера требуется выполнение двух задач:
    -   файловый сервер (хранение рабочих данных, обеспечение доступа к программам);
    -   высокопроизводительный компьютер для вычислений.
-   Соединение этих двух функций в одном компьютере не представляется целесообразным.
-   Предлагается ориентироваться на функцию файлового сервера.
-   Для высокопроизводительных вычислений рекомендовать использовать ЦОД Университета.
-   При этом рекомендуется дать возможность прототипирования и отладки программного обеспечения.


#### <span class="section-num">1.1.3</span> Примерная спецификация оборудования {#примерная-спецификация-оборудования}

-   Спецификация сервера:
    -   процессор: не менее 4-х процессоров Intel Xeon E7-8800 v3 или Intel Xeon E7-4800 v3;
    -   память: 128GB DDR4-1866 ECC LRDIMM;
    -   сетевой адаптер: 1 Гбит/с;
    -   контроллер RAID 2GB кэш (RAID 0/1/1+0/5/5+0/6/6+0) на 6 дисков;
    -   дисковая подсистема 6 Hot-plug SFF 3.5" SAS/SATA HDD/SSD не менее 18TB каждый;
    -   оптический привод DVD-RW standard;
    -   блок питания 2 штуки Hot Plug Power Supply, отказоустойчивый двойной блок питания, схема резервирования 1+1;
    -   форм-фактор 2U Rackmount.
-   ИБП: APC Smart-UPS XL 3000VA RM 3U 230V.
-   Пример:
    -   Сервер STSS Flagman QX427.4-006LH
    -   <http://www.stss.ru/products/servers/Q-series/QX427.4-006LH.html>
    -   Примерная цена 5 000 000 ₽.