---
title: "Семантическое версионирование. Conventional Changelog"
date: 2021-01-16T17:41:00+03:00
lastmod: 2021-02-28T16:30:00+03:00
tags: ["programming"]
categories: ["sysadmin"]
draft: false
slug: "semantic-versioning-conventional-changelog"
---

Пакет _Conventional Changelog_ представляет собой набор утилит. Их можно использовать как вместе, так и по отдельности. Также можно задавать свой рабочий процесс.

<!--more-->

{{< toc >}}


## Репозитории {#репозитории}

-   Основной монорепозиторий: <https://github.com/conventional-changelog/conventional-changelog>


## Список утилит {#список-утилит}

-   conventional-changelog-cli --- утилита командной строки.
-   standard-changelog --- утилита командной строки для формата коммитов _angular_.
-   conventional-github-releaser --- создание нового релиза на GitHub из метаданных git.
-   conventional-recommended-bump --- получить рекомендованную версию на основе обычных коммитов.
-   conventional-commits-detector --- определить, какое соглашение о коммитах использует репозиторий.
-   commitizen --- утилита, задающая интерфейс к написанию коммитов.
-   commitlint --- проверка правильности текста коммита.


## Настройка утилит {#настройка-утилит}


### conventional-commits-detector {#conventional-commits-detector}

Определить, какое соглашение о коммитах используется в репозитории.


#### Установка {#установка}

```shell
yarn [global] add [--dev] conventional-commits-detector
```


#### Использование {#использование}

```shell
npx conventional-commits-detector
```

В результате получим возможный тип коммитов.


### standard-changelog {#standard-changelog}

Генерация журнала изменений с использованием соглашений о коммитах _angular_.


#### Установка {#установка}

```shell
yarn [global] add [--dev] standard-changelog
```


#### Использование {#использование}

Параметры запуска можно посмотреть следующим образом:

```shell
npx standard-changelog --help
```

Генерация файла журнала выполняется следующим образом:

```shell
npx standard-changelog
```

или

```shell
npx standard-changelog -i CHANGELOG.md -s
```


### conventional-changelog-cli {#conventional-changelog-cli}

Создаёт журнал изменений из метаданных git (если соглашение о коммитах отлично от _angular_).


#### Установка {#установка}

```shell
yarn [global] add [--dev] conventional-changelog-cli
```


#### Использование {#использование}

```shell
cd my-project
npx conventional-changelog -p angular -i CHANGELOG.md -s
```

Если инструмент используется впервые и нужно учесть все предыдущие журналы изменений, можно выполнить команду:

```shell
cd my-project
npx conventional-changelog -p angular -i CHANGELOG.md -s -r 0
```


### commitizen {#commitizen}

Утилита, реализующая интерактивный процесс для генерации коммита.


#### Установка {#установка}

```shell
yarn [global] add [--dev] commitizen
```


#### Использование {#использование}

```shell

```


### conventional-github-releaser {#conventional-github-releaser}

Утилита, создающая новый выпуск на GitHub на основе метаданных git.


#### Установка {#установка}

```shell
yarn [global] add [--dev] conventional-github-releaser
```


#### Использование {#использование}

-   Создание релиза с определённым пресетом:

    ```shell
    conventional-github-releaser -p angular
    ```

    Здесь `angular` --- один из пресетов : `angular`, `atom`, `codemirror`, `ember`, `eslint`, `express`, `jquery`, `jscs`, `jshint`.

-   Недавно сломали утилиту (см. <https://github.com/conventional-changelog/releaser-tools/issues/190>). Пока не починят, можно применять такой трюк:

    ```shell
    CONVENTIONAL_GITHUB_RELEASER_TOKEN=asdf conventional-github-releaser -p angular
    ```


## Примерный рабочий процесс {#примерный-рабочий-процесс}

-   Внести изменения.
-   Зафиксировать эти изменения.

Причина, по которой вы должны зафиксировать изменения и создать метку после
выполнения `standard-changelog` заключается в том, что CHANGELOG.md должен быть
включён в новую версию.


## Backlinks {#backlinks}

-   [Семантическое версионирование]({{< relref "2020-12-11-semantic-versioning" >}})
