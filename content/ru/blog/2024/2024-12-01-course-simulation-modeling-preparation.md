---
title: "Подготовка курса Имитационное моделирование"
author: ["Dmitry S. Kulyabov"]
date: 2024-12-01T19:51:00+03:00
lastmod: 2026-01-29T14:44:00+03:00
tags: ["rudn", "education"]
categories: ["job", "science"]
draft: false
slug: "course-simulation-modeling-preparation"
---

Подготовка курса Имитационное моделирование.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Прагматика {#прагматика}


### <span class="section-num">1.1</span> Предыдущий вариант курса {#предыдущий-вариант-курса}

-   Предыдущая инкарнация курса называлась _Моделирование информационных процессов_.
-   В рамках курса предлагались несколько подходов к имитационного моделирования.
-   Каждый метод демонстрировался на базе собственного средства моделирования.
-   Однако для студентов оказалось сложным осваивать несколько программных средств.


### <span class="section-num">1.2</span> Разрабатываемый вариант курса {#разрабатываемый-вариант-курса}

-   Предлагается использовать один язык программирования --- Julia.
-   Для каждого метода имитационного моделирования используется своя библиотека.
-   Каждый метод демонстрируется на основе специфической задачи, а также на основе сквозной практической задачи.
-   У нас две школы математического моделирования с разными математическими аппаратами:
    -   дифференциальные уравнения;
    -   теория массового обслуживания.
-   Предлагается демонстрировать применение на основе следующих сквозных задач:
    -   модель SIR (дифференциальные уравнения);
    -   модель хищник--жертва (дифференциальные уравнения);
    -   ? (теория массового обслуживания).
-   На каждый раздел имитационного моделирования предлагается выделить 3 лабораторных работы.
-   2 лабораторных работы на специфические задачи, 1 лабораторная работа на сквозные задачи.
-   На каждую лабораторную работу  по 2 задачи.


## <span class="section-num">2</span> Используемые разделы имитационного моделирования {#используемые-разделы-имитационного-моделирования}

-   дискретно-событийное моделирование;
-   системная динамика;
-   агентное моделирование;
-   сети Петри.


## <span class="section-num">3</span> Структура курса {#структура-курса}


### <span class="section-num">3.1</span> Установка и настройка программного обеспечения {#установка-и-настройка-программного-обеспечения}

-   [Рабочее пространство на основе DrWatson]({{< relref "2026-01-29--workspace-based-drwatson" >}})


### <span class="section-num">3.2</span> Сквозные задачи {#сквозные-задачи}

-   Описываются сквозные задачи.
-   Сквозные задачи решаются с помощью методов аналитического моделирования.
-   Две сквозных задачи:
    -   Модель SIR.
    -   Модель хищник-жертва.


### <span class="section-num">3.3</span> Агентное моделирование {#агентное-моделирование}

-   Задачи типа взаимодействия множества агентов.
-   Модель хищник-жертва:
    -   <https://juliadynamics.github.io/Agents.jl/stable/examples/predator_prey/>
-   Маргаритковый мир:
    -   <https://ru.wikipedia.org/wiki/%D0%9C%D0%B0%D1%80%D0%B3%D0%B0%D1%80%D0%B8%D1%82%D0%BA%D0%BE%D0%B2%D1%8B%D0%B9_%D0%BC%D0%B8%D1%80>
    -   <https://juliadynamics.github.io/AgentsExampleZoo.jl/dev/examples/daisyworld/>
-   Пожар в лесу:
    -   <https://juliadynamics.github.io/AgentsExampleZoo.jl/dev/examples/forest_fire/>


### <span class="section-num">3.4</span> Сети Петри {#сети-петри}

-   Перенос лабораторных с курса Моделирование информационных процессов.
-   Хищник-жертва:
    -   <https://algebraicjulia.github.io/AlgebraicPetri.jl/stable/generated/predation/lotka-volterra/>
-   SIR:
    -   <https://algebraicjulia.github.io/AlgebraicPetri.jl/stable/generated/covid/epidemiology/>


### <span class="section-num">3.5</span> Дискретно-событийное моделирование {#дискретно-событийное-моделирование}

-   Задачи теории массового обслуживания.
-   Задача ремонта:
    -   <https://juliadynamics.github.io/ConcurrentSim.jl/stable/examples/ross/>
-   Очередь  M/M/c:
    -   <https://juliadynamics.github.io/ConcurrentSim.jl/stable/examples/mmc/>


### <span class="section-num">3.6</span> Системная динамика {#системная-динамика}

-   Пока не понятно.
-   Будем делать позже.


## <span class="section-num">4</span> Используемые библиотеки {#используемые-библиотеки}


### <span class="section-num">4.1</span> Идеи реализации {#идеи-реализации}

-   Идея лабораторных почерпнута из репозитория SIR model in Julia.
-   Репозиторий: <https://github.com/epirecipes/sir-julia>


### <span class="section-num">4.2</span> Аналитические методы {#аналитические-методы}


#### <span class="section-num">4.2.1</span> ModelingToolkit {#modelingtoolkit}

-   Репозиторий: <https://github.com/SciML/ModelingToolkit.jl>
-   Документация: <https://docs.sciml.ai/ModelingToolkit/stable/>


#### <span class="section-num">4.2.2</span> Modia {#modia}

-   Репозиторий: <https://github.com/ModiaSim/Modia.jl>
-   Документация: <https://modiasim.github.io/docs/>


### <span class="section-num">4.3</span> Агентный подход {#агентный-подход}


#### <span class="section-num">4.3.1</span> Agents.jl {#agents-dot-jl}

-   Репозиторий: <https://github.com/JuliaDynamics/Agents.jl>
-   Документация: <https://juliadynamics.github.io/Agents.jl>


### <span class="section-num">4.4</span> Сети Петри {#сети-петри}


#### <span class="section-num">4.4.1</span> Petri.jl {#petri-dot-jl}

-   Репозиторий: <https://github.com/AlgebraicJulia/Petri.jl>


#### <span class="section-num">4.4.2</span> AlgebraicPetri.jl {#algebraicpetri-dot-jl}

-   Репозиторий: <https://github.com/AlgebraicJulia/AlgebraicPetri.jl>
-   Документация: <https://algebraicjulia.github.io/AlgebraicPetri.jl>


### <span class="section-num">4.5</span> Дискретно-событийное моделирование {#дискретно-событийное-моделирование}


#### <span class="section-num">4.5.1</span> ConcurrentSim.jl {#concurrentsim-dot-jl}

-   Репозиторий: <https://github.com/JuliaDynamics/ConcurrentSim.jl>
-   Документация: <https://juliadynamics.github.io/ConcurrentSim.jl>
