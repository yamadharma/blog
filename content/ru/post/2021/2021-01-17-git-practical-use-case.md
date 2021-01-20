---
title: "Практический сценарий использования git"
date: 2021-01-17T20:06:00+03:00
lastmod: 2021-01-18T13:35:00+03:00
tags: ["education", "programming"]
categories: ["сиянс"]
draft: false
slug: "git-practical-use-case"
---

Предлагается следующий практический сценарий использование git.

<!--more-->

{{< toc >}}


## Используемые стандарты и программные продукты {#используемые-стандарты-и-программные-продукты}

-   Стандарт Git Flow (см. [Варианты Git Workflow]({{< relref "2020-10-30-git-workflow" >}})).
-   Стандарт [Семантическое версионирование]({{< relref "2020-12-11-semantic-versioning" >}}).
-   Стандарт [Общепринятые коммиты]({{< relref "2020-12-11-conventional-commits" >}}).


## Установка программного обеспечения {#установка-программного-обеспечения}

-   Для Windows используется пакетный менеджер Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})).
-   Для MacOS используется пакетный менеджер [Homebrew](https://brew.sh/).


### Установка Node.js {#установка-node-dot-js}

На Node.js базируется программное обеспечение для семантического версионирования и общепринятых коммитов.

-   Gentoo

    ```shell
    emerge nodejs
    ```
-   Ubuntu

    ```shell
    apt-get install nodejs
    apt-get install yarn
    ```
-   Windows

    ```shell
    choco -y install nodejs
    choco -y install yarn
    ```
-   MacOS

    ```shell
    brew install node
    ```


### Установка git-flow {#установка-git-flow}

-   Gentoo

    ```shell
    emerge dev-vcs/git-flow
    ```
-   Ubuntu

    ```shell
    apt-get install git-flow
    ```
-   Windows
    Git-flow входит в состав пакета git.

    ```shell
    choco -y install git
    ```


### Общепринятые коммиты {#общепринятые-коммиты}


#### commitizen {#commitizen}

Данная программа используется для помощи в форматировании коммитов.

```shell
yarn global add commitizen
```


## Настройка git {#настройка-git}


## Практический сценарий использования git {#практический-сценарий-использования-git}

-   Рабочий каталог будем обозначать как `workdir`. Вначале нужно перейти в этот каталог:

    ```shell
    cd workdir
    ```
-   Инициализация системы git:

    ```shell
    git init
    ```
-   Конфигурация для пакетов Node.js

    ```shell
    yarn init
    ```

    Необходимо заполнить несколько параметров пакета.

    -   Название пакета.
    -   Лицензия пакета. Список лицензий для npm: <https://spdx.org/licenses/>. Предлагается выбирать лицензию `CC-BY-4.0`.
-   Сконфигурить формат коммитов.

    ```shell
    npm install commitizen
    ```


## Backlinks {#backlinks}


### [Структура лабораторной работы]({{< relref "2021-01-16-laboratory-work-structure" >}}) {#структура-лабораторной-работы}

Исходный код программ, отчёты по лабораторным работам и т.д. размещаются в системе контроля версий git (см. [Практический сценарий использования git]({{< relref "2021-01-17-git-practical-use-case" >}})).
