---
title: "Курс Моделирование сетей передачи данных"
date: 2021-06-24T15:01:00+03:00
lastmod: 2021-06-28T13:28:00+03:00
tags: ["network", "education"]
categories: ["сиянс"]
draft: false
slug: "course-simulation-data-networks"
---

Курс Моделирование сетей передачи данных.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Предназначение курса {#предназначение-курса}

-   Курс описывает не аналитическое моделирование (modeling) сетей, а моделирование путём создания натурного стенда на основе виртуализации (simulation).
-   Изучается не теоретическая, а операциональная часть модели.


## <span class="section-num">2</span> Информация по предмету {#информация-по-предмету}

-   Наименование дисциплины: Моделирование сетей передачи данных
-   Объем курса:
    -   4 кредита,
    -   144 часа
    -   контактные часы: 54 часа
    -   самостоятельная работа: 63 часа
    -   контроль: 27 часов
-   Курс: 4
    -   Семестр: 7
    -   Модуль: 14 (E)
-   Продолжительность курса: 9 недель
-   Лекции: 18 часов (2 часа/нед)
-   Лабораторные работы: 36 часов (4 часа/нед)


## <span class="section-num">3</span> БРС {#брс}

| Активность | Количество | Баллы за единицу | Общие баллы |
|------------|------------|------------------|-------------|
| А1.1       | 14         | 3                | 42          |
| А1.2       | 14         | 2                | 28          |
| А2         | 8          | 1                | 8           |
| А3         | 1          | 12               | 12          |
| A4         | 1          | 10               | 10          |
|            |            |                  | 100         |

-   Активности
    -   А1.1: Лабораторные работы. Выполнение.
    -   А1.2: Лабораторные работы. Самопроверка и взаимопроверка.
    -   А2: Тесты к лекциям работам.
    -   А3: Доклады по темам.
    -   A4: Итоговый контроль знаний (тест).

-   Разделы
    -   Р1: Введение в моделирование сетей передачи данных
    -   Р2: Моделирование производительности сетей передачи данных

-   Темы
    -   T1. Генерация трафика.
    -   T2. Эмуляция сетей.
    -   T3. Настройка пропускной способности сети.
    -   T4. Управление перегрузкой TCP.
    -   T5. Задержки и размер буфера TCP.
    -   T6. Повышение пропускной способности TCP.
    -   T7. Буферы маршрутизатора.
    -   T8. Контроль скорости TCP.


## <span class="section-num">4</span> Лабораторные работы {#лабораторные-работы}

1.  Введение в Mininet.
2.  Генератор трафика iperf.
3.  Эмуляция сетей: задержка, джиттер.
4.  Эмуляция сетей: потеря, дублирование, переупорядочивание пакетов.
5.  Настройка пропускной способности сети с помощью Token Bucket.
6.  Традиционное управление перегрузкой TCP: HTCP, Cubic, Reno.
7.  Управление перегрузкой TCP на основе скорости: BBR.
8.  Задержки и размер буфера TCP.
9.  Повышение пропускной способности TCP с помощью параллельных потоков.
10. Измерение справедливости TCP.
11. Размер буфера маршрутизатора.
12. Контроль скорости TCP.
13. Влияние MSS на пропускную способность.
14. Переполнение буфера маршрутизатора.


## <span class="section-num">5</span> Лекции {#лекции}

1.  Современные технологии межсетевого уровня IP.
2.  Параметры TCP.
3.  Формирование трафика на границе сети.
4.  Назначение, разновидности и основные функции маршрутизаторов.
5.  Динамическая маршрутизация.
6.  Статическая маршрутизация.
7.  Качество сетевого обслуживания (QoS).
8.  Средства QoS коммуникационного узла. Протоколы сигнализации QoS и службы QoS IP-уровня.


## <span class="section-num">6</span> Темы докладов {#темы-докладов}

-   Обзор возможностей системы моделирования Mininet.
-   Генераторы трафика. Особенности в разных системах моделирования.
-   Эмуляция сетей передачи данных: особенности моделирования задержки передачи данных.
-   Эмуляция сетей передачи данных: особенности моделирования потери, дублирования, переупорядочивания пакетов.
-   Обзор алгоритмов управления трафиком:
    -   Алгоритм скользящего временного окна с 2 цветным маркером (Time Sliding Window with Two Color Marking).
    -   Алгоритм трёхцветного маркера для одного входящего потока (A Single Rate Three Color Marker).
    -   Двухпараметровый трёхцветный маркер (Two Rate Three Color Marker).
    -   Token Bucket Filter (TBF) или «маркерное ведро».
-   Обзор алгоритмов управления перегрузками:
    -   Механизм приоритетной обработки трафика (Priority Queue).
    -   Алгоритм стохастического справедливого обслуживания (Stochastic Fairness Queueing, SFQ).
    -   Алгоритм взвешенного обслуживания (Weighted Queuing, WQ).
    -   Взвешенное справедливое обслуживание (Weighted Fair Queuing, WFQ).
    -   Алгоритм обработки очередей с малой задержкой (Low Latency Queuing, LLQ).
    -   Дисциплина взвешенного циклического обслуживания (Weighted Round Robin, WRR).
-   Алгоритмы избежания перегрузок: обзор различных алгоритмов случайного раннего обнаружения (Random Early Detect, RED) перегрузки.
-   Особенности различных типов протокола TCP (TCP Tahoe, TCP Reno, TCP New Reno, TCP Vegas, TCP Westwood).
-   Обзор моделей TCP: TCP Hybla, BIC-TCP, CUBIC TCP, TCP Illinois, TCP-Veno.
-   Традиционное управление перегрузкой TCP: HTCP, Cubic, Reno.
-   Управление перегрузкой TCP на основе скорости: BBR.
-   Задержки и размер буфера TCP.
-   Повышение пропускной способности TCP с помощью параллельных потоков.
-   Измерение справедливости TCP.
-   Контроль скорости TCP.
-   Влияние MSS на пропускную способность.