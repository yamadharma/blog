---
title: "Практический сценарий использования git"
date: 2021-01-17T20:06:00+03:00
lastmod: 2021-03-01T12:18:00+03:00
tags: ["education", "programming"]
categories: ["сиянс"]
draft: false
slug: "git-practical-use-case"
---

Предлагается следующий практический сценарий использование git. В нём мы используем стратегию _git flow_, скрипты для генерации общепринятых коммитов, журнала изменений.

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
    choco install nodejs
    choco install yarn
    ```
-   MacOS

    ```shell
    brew install node
    ```


### Настройка Node.js {#настройка-node-dot-js}

Для работы с Node.js добавим каталог с исполняемыми файлами, устанавливаемыми `yarn`, в переменную `PATH`.

-   Linux
    В файле `~/.bashrc` добавьте к переменной `PATH`:

    ```conf-unix
    PATH=~/.yarn/bin:$PATH
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
    choco install git
    ```


### Общепринятые коммиты {#общепринятые-коммиты}


#### commitizen {#commitizen}

Данная программа используется для помощи в форматировании коммитов.

```shell
yarn global add commitizen
```

При этом устанавливается скрипт `git-cz`, который мы и будем использовать для коммитов.


## Настройка git {#настройка-git}


### Настройка параметров git {#настройка-параметров-git}

-   Зададим имя и email владельца репозитория:

    ```shell
    git config --global user.name "Name Surname"
    git config --global user.email "work@mail"
    ```
-   Настроим utf-8 в выводе сообщений git:

    ```shell
    git config --global core.quotepath false
    ```
-   Настройте верификацию коммитов git (см. [Верификация коммитов git с помощью GPG]({{< relref "2021-01-28-verifying-git-commits-gpg" >}})).


## Практический сценарий использования git {#практический-сценарий-использования-git}


### Создание репозитория git {#создание-репозитория-git}


#### Подключение репозитория к github {#подключение-репозитория-к-github}

-   Создайте репозиторий на GitHub. Для примера назовём его `test-repo`.
-   Рабочий каталог будем обозначать как `workdir`. Вначале нужно перейти в этот каталог:

    ```shell
    cd workdir
    ```
-   Инициализируем системы git:

    ```shell
    git init
    ```
-   Создаём заготовку для файла `README.md`:

    ```shell
    echo "# test-repo" >> README.md
    git add README.md
    ```
-   Делаем первый коммит и выкладываем на github:

    ```shell
    git commit -m "first commit"
    git remote add origin git@github.com:<username>/test-repo.git
    git push -u origin master
    ```


#### Конфигурация общепринятых коммитов {#конфигурация-общепринятых-коммитов}

-   Конфигурация для пакетов Node.js

    ```shell
    yarn init
    ```

    Необходимо заполнить несколько параметров пакета.

    -   Название пакета.
    -   Лицензия пакета. Список лицензий для npm: <https://spdx.org/licenses/>. Предлагается выбирать лицензию `CC-BY-4.0`. (см. [Выбор лицензии для научной работы]({{< relref "2021-02-22-scientific-work-choosing-license" >}})).
-   Сконфигурим формат коммитов. Для этого добавим в файл `package.json` команду для формирования коммитов:

    ```js
    "config": {
        "commitizen": {
    	"path": "cz-conventional-changelog"
        }
    }
    ```

    Таким образом, файл `package.json` приобретает вид:

    ```js
    {
        "name": "test-repo",
        "version": "1.0.0",
        "description": "Git repo for educational purposes",
        "main": "index.js",
        "repository": "git@github.com:username/test-repo.git",
        "author": "Name Surname <username@gmail.com>",
        "license": "CC-BY-4.0",
        "config": {
    	"commitizen": {
    	    "path": "cz-conventional-changelog"
    	}
        }
    }
    ```
-   Добавим файл лицензии:

    ```shell
    wget https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt -O LICENSE
    ```
-   Добавим шаблон игнорируемых файлов. Просмотрим список имеющихся шаблонов:

    ```shell
    curl -L -s https://www.gitignore.io/api/list
    ```

    Затем скачаем шаблон, например, для C и C++:

    ```shell
    curl -L -s https://www.gitignore.io/api/c >> .gitignore
    curl -L -s https://www.gitignore.io/api/c++ >> .gitignore
    ```

    Можно это же сделать через web-интерфейс на сайте <https://www.gitignore.io/>.
-   Добавим новые файлы:

    ```shell
    git add .
    ```
-   Выполним коммит:

    ```shell
    git cz
    ```
-   Отправим на github:

    ```shell
    git push
    ```


#### Конфигурация git-flow {#конфигурация-git-flow}

-   Инициализируем git-flow

    ```shell
    git flow init
    ```

    Префикс для ярлыков установим в `v`.
-   Проверьте, что Вы на ветке `develop`:

    ```shell
    git branch
    ```
-   Создадим релиз с версией 1.0.0

    ```shell
    git flow release start 1.0.0
    ```
-   Создадим журнал изменений

    ```shell
    standard-changelog
    ```
-   Добавим журнал изменений в индекс

    ```shell
    git add CHANGELOG.md
    git commit -am 'chore(site): add changelog'
    ```
-   Зальём релизную ветку в основную ветку

    ```shell
    git flow release finish 1.0.0
    ```
-   Отправим данные на github

    ```shell
    git push --all
    git push --tags
    ```
-   Создадим релиз на github:

    ```shell
    conventional-github-releaser -p angular
    ```


### Работа с репозиторием git {#работа-с-репозиторием-git}


## Backlinks {#backlinks}

-   [Структура лабораторной работы]({{< relref "2021-01-16-laboratory-work-structure" >}})
