---
title: "Семантическое версионирование. Conventional Changelog"
date: 2021-01-16T17:41:00+03:00
lastmod: 2021-03-18T11:08:00+03:00
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


### Основные утилиты проекта {#основные-утилиты-проекта}

-   [conventional-changelog-cli](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-cli) --- утилита командной строки.
-   [standard-changelog](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/standard-changelog) --- утилита командной строки для формата коммитов _angular_.
-   conventional-github-releaser --- создание нового релиза на GitHub из метаданных git.
-   [conventional-recommended-bump](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-recommended-bump) --- узнать на основе коммитов, какая версия рекомендуется.
-   [conventional-commits-detector](https://github.com/conventional-changelog/conventional-commits-detector) --- определить, какое соглашение о коммитах использует репозиторий.
-   [commitizen](https://github.com/commitizen/cz-cli) --- утилита, задающая интерфейс к написанию коммитов.
-   commitlint --- проверка правильности текста коммита.


### Дополнительные утилиты {#дополнительные-утилиты}

-   [cz-customizable](https://github.com/leoforfree/cz-customizable) --- плагин для `commitizen` для конфигурации формы ввода сообщений.
-   [cz-customizable-ghooks](https://github.com/uglow/cz-customizable-ghooks) --- интеграция `cz-customizable` с `ghooks` или `husky`, чтобы использовать единую конфигурацию для генерации и проверки сообщений коммитов .


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


### conventional-recommended-bump {#conventional-recommended-bump}

узнать на основе коммитов, какая версия рекомендуется.


#### Установка {#установка}

```shell
yarn [global] add [--dev] conventional-recommended-bump
```


#### Использование {#использование}

```shell
npx conventional-recommended-bump -p angular
```

Здесь `angular` --- название пресета.

В результате получим уровень, на который изменяется версия.


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

При этом устанавливается скрипт `git-cz`, который мы и будем использовать для коммитов.


#### Использование {#использование}

-   Сконфигурим формат коммитов. Для этого добавим в файл `package.json` команду для формирования коммитов:

    ```js
    "config": {
        "commitizen": {
    	"path": "cz-conventional-changelog"
        }
    }
    ```
-   Выполнение коммитов:

    ```shell
    git cz
    ```


### conventional-github-releaser {#conventional-github-releaser}

Утилита, создающая новый выпуск на GitHub на основе метаданных git.


#### Установка {#установка}

```shell
yarn [global] add [--dev] conventional-github-releaser
```


#### Использование {#использование}

-   Создайте новый токен для для доступа к github
    -   Токен создаётся по ссылке <https://github.com/settings/tokens/new>.
    -   Права для токена: `public_repo` или `repo`.
    -   Обязательно сразу скопируйте свой новый токен личного доступа. Нет возможности получить доступ к его значению ещё раз.
    -   Установите созданный токен как значение переменной окружения `CONVENTIONAL_GITHUB_RELEASER_TOKEN`.
    -   Также можно указать свой токен аутентификации с помощью флага `-t` или `--token`.
-   Создание релиза с определённым пресетом:

    ```shell
    conventional-github-releaser -p angular
    ```

    Здесь `angular` --- один из пресетов : `angular`, `atom`, `codemirror`, `ember`, `eslint`, `express`, `jquery`, `jscs`, `jshint`.


## Примерный рабочий процесс {#примерный-рабочий-процесс}

-   Внести изменения.
-   Зафиксировать эти изменения.
-   Проверить состояние Travis CI.
-   Изменить версию в `package.json`.
-   Закоммитить файлы: `package.json`.
-   Задать метку (tag).
-   Выложить на удалённый репозиторий (`push`).
-   Сделать релиз (`conventional-github-releaser`)

Причина, по которой вы должны зафиксировать изменения и создать метку после
выполнения `standard-changelog` заключается в том, что `CHANGELOG.md` должен быть
включён в новую версию.


## Backlinks {#backlinks}

-   [Семантическое версионирование]({{< relref "2020-12-11-semantic-versioning" >}})
