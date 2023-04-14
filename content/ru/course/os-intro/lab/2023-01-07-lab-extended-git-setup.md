---
title: "Лабораторная работа Продвинутое использование git"
author: ["Dmitry S. Kulyabov"]
date: 2023-01-07T17:50:00+03:00
lastmod: 2023-01-07T19:15:00+03:00
draft: false
weight: 220
toc: true
type: "book"
feedback: false
slug: "lab-extended-git-setup"
summary: "Продвинутое использование git"
linktitle: "Продвинутое использование git"
menu:
  "lab-extended-git-setup":
    identifier: "лабораторная-работа-продвинутое-использование-git"
    parent: "os-intro-lab"
    weight: 220
---

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Цель работы {#цель-работы}


## <span class="section-num">2</span> Теоретические сведения {#теоретические-сведения}


### <span class="section-num">2.1</span> Рабочий процесс Gitflow {#рабочий-процесс-gitflow}

-   Рабочий процесс _Gitflow Workflow_. Будем описывать его с использованием пакета `git-flow`.


#### <span class="section-num">2.1.1</span> Общая информация {#общая-информация}

-   Gitflow Workflow опубликована и популяризована Винсентом Дриссеном.
-   Gitflow Workflow предполагает выстраивание строгой модели ветвления с учётом выпуска проекта.
-   Данная модель отлично подходит для организации рабочего процесса на основе релизов.
-   Работа по модели Gitflow включает создание отдельной ветки для исправлений ошибок в рабочей среде.
-   Последовательность действий при работе по модели Gitflow:
    -   Из ветки `master` создаётся ветка `develop`.
    -   Из ветки `develop` создаётся ветка `release`.
    -   Из ветки `develop` создаются ветки `feature`.
    -   Когда работа над веткой `feature` завершена, она сливается с веткой `develop`.
    -   Когда работа над веткой релиза `release` завершена, она сливается в ветки `develop` и `master`.
    -   Если в `master` обнаружена проблема, из `master` создаётся ветка `hotfix`.
    -   Когда работа над веткой исправления `hotfix` завершена, она сливается в ветки `develop` и `master`.


#### <span class="section-num">2.1.2</span> Процесс работы с Gitflow {#процесс-работы-с-gitflow}

<!--list-separator-->

1.  Основные ветки (master) и ветки разработки (develop)

    -   Для фиксации истории проекта в рамках этого процесса вместо одной ветки `master` используются две ветки. В ветке `master` хранится официальная история релиза, а ветка `develop` предназначена для объединения всех функций. Кроме того, для удобства рекомендуется присваивать всем коммитам в ветке `master` номер версии.
    -   При использовании библиотеки расширений `git-flow` нужно инициализировать структуру в существующем репозитории:
        ```shell
        git flow init
        ```
    -   Для github параметр `Version tag prefix` следует установить в `v`.
    -   После этого проверьте, на какой ветке Вы находитесь:
        ```shell
        git branch
        ```

<!--list-separator-->

2.  Функциональные ветки (feature)

    -   Под каждую новую функцию должна быть отведена собственная ветка, которую можно отправлять в центральный репозиторий для создания резервной копии или совместной работы команды. Ветки `feature` создаются не на основе `master`, а на основе `develop`. Когда работа над функцией завершается, соответствующая ветка сливается обратно с веткой `develop`. Функции не следует отправлять напрямую в ветку `master`.
    -   Как правило, ветки `feature` создаются на основе последней ветки `develop`.

    <!--list-separator-->

    1.  Создание функциональной ветки

        -   Создадим новую функциональную ветку:
            ```shell
            git flow feature start feature_branch
            ```

        -   Далее работаем как обычно.

    <!--list-separator-->

    2.  Окончание работы с функциональной веткой

        -   По завершении работы над функцией следует объединить ветку `feature_branch` с `develop`:
            ```shell
            git flow feature finish feature_branch
            ```

<!--list-separator-->

3.  Ветки выпуска (release)

    -   Когда в ветке `develop` оказывается достаточно функций для выпуска, из ветки develop создаётся ветка `release`. Создание этой ветки запускает следующий цикл выпуска, и с этого момента новые функции добавить больше нельзя --- допускается лишь отладка, создание документации и решение других задач. Когда подготовка релиза завершается, ветка `release` сливается с `master` и ей присваивается номер версии. После нужно выполнить слияние с веткой `develop`, в которой с момента создания ветки релиза могли возникнуть изменения.
    -   Благодаря тому, что для подготовки выпусков используется специальная ветка, одна команда может дорабатывать текущий выпуск, в то время как другая команда продолжает работу над функциями для следующего.
    -   Создать новую ветку release можно с помощью следующей команды:
        ```shell
        git flow release start 1.0.0
        ```
    -   Для завершения работы на ветке `release` используются следующие команды:
        ```shell
        git flow release finish 1.0.0
        ```

<!--list-separator-->

4.  Ветки исправления (hotfix)

    -   Ветки поддержки или ветки `hotfix` используются для быстрого внесения исправлений в рабочие релизы. Они создаются от ветки `master`. Это единственная ветка, которая должна быть создана непосредственно от master. Как только исправление завершено, ветку следует объединить с `master` и `develop`. Ветка `master` должна быть помечена обновлённым номером версии.
    -   Наличие специальной ветки для исправления ошибок позволяет команде решать проблемы, не прерывая остальную часть рабочего процесса и не ожидая следующего цикла релиза.
    -   Ветку `hotfix` можно создать с помощью следующих команд:
        ```shell
        git flow hotfix start hotfix_branch
        ```
    -   По завершении работы ветка `hotfix` объединяется с `master` и `develop`:
        ```shell
        git flow hotfix finish hotfix_branch
        ```


## <span class="section-num">3</span> Задание {#задание}


## <span class="section-num">4</span> Последовательность выполнения работы {#последовательность-выполнения-работы}


### <span class="section-num">4.1</span> Установка программного обеспечения {#установка-программного-обеспечения}


#### <span class="section-num">4.1.1</span> Установка git-flow {#установка-git-flow}

-   Linux
    -   Fedora
        -   Установка из коллекции репозиториев _Copr_ (<https://copr.fedorainfracloud.org/coprs/elegos/gitflow/>):
            ```shell
            # Enable the copr repository
            dnf copr enable elegos/gitflow
            # Install gitflow
            dnf install gitflow
            ```