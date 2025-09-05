---
title: "Рабочее пространство для лабораторной работы"
author: ["Dmitry S. Kulyabov"]
date: 2021-01-16T12:51:00+03:00
lastmod: 2025-09-02T18:55:00+03:00
tags: ["education"]
categories: ["science"]
draft: false
slug: "workspace-laboratory-work"
---

При выполнении лабораторной работы следует придерживаться структуры рабочего пространства.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Основные идеи {#основные-идеи}

-   Стандартные соглашения об именах
-   Стандартное соглашение для путей к файлам
-   Стандартная настройка курса внутри шаблона курса


## <span class="section-num">2</span> Общие правила {#общие-правила}

-   Для именования каталогов и файлов будем использовать соглашение Denote (см. [Denote. Соглашение об именовании]({{< relref "2025-01-03--denote-naming-convention" >}})).
-   Рабочее пространство по предмету располагается в следующей иерархии:
    ```bash
    ~/work/study/
    └── <учебный год>/
        └── <учебный год>==<код предмета>/
    ```

-   Например, для 2025-2026 учебного года (второй семестр) и предмета «Операционные системы» (код предмета `os-intro`) структура каталогов примет следующий вид:
    ```bash
    ~/work/study/
    └── 2026-1/
        └── 2026-1==os-intro/
    ```
-   Название проекта на хостинге git имеет вид:
    ```text
    <учебный год>--study--<код предмета>
    ```
-   Например, для 2025-2026 учебного года и предмета «Операционные системы» (код предмета `os-intro`) название проекта примет следующий вид:
    ```text
    2026-1--study--os-intro
    ```

-   Каталог для лабораторных работ имеет вид `labs`.
-   Каталоги для лабораторных работ имеют вид `lab<номер>`, например: `lab01`, `lab02` и т.д.
-   Каталог для групповых проектов имеет вид `group-project`.
-   Каталог для персональных проектов имеет вид `personal-project`.
-   Каталог для внешнего курса имеет вид `external-course`.
-   Если проектов несколько, то они нумеруются подобно лабораторным работам.
-   Этапы проекта обозначаются как `stage<номер>`.


## <span class="section-num">3</span> Шаблон для рабочего пространства {#шаблон-для-рабочего-пространства}

-   Репозиторий: <https://github.com/yamadharma/course-directory-student-template>.


### <span class="section-num">3.1</span> Сознание репозитория курса на основе шаблона {#сознание-репозитория-курса-на-основе-шаблона}

-   Репозиторий на основе шаблона можно создать либо вручную, через web-интерфейс, либо с помощью утилит `gh` (см. [github: утилиты командной строки]({{< relref "2021-08-04-github-command-line-utilities" >}})).


#### <span class="section-num">3.1.1</span> Создание с помощью утилит {#создание-с-помощью-утилит}

-   Создание выглядит следующим образом:
    ```shell
    gh repo create <new-repo-name> --template="<owner/template-repo>"
    ```
-   Например, для 2024-2025 учебного года и предмета «Операционные системы» (аббревиатура предмета --- `os-intro`) создание репозитория примет следующий вид:
    ```shell
    mkdir -p ~/work/study/2026-1/2026-1==study--os-intro
    cd ~/work/study/2026-1/2026-1==study--os-intro
    gh repo create 2026-1--study--os-intro --template=yamadharma/course-directory-student-template --public
    git clone --recursive git@github.com:<owner>/2026-1--study--os-intro.git
    ```


#### <span class="section-num">3.1.2</span> Создание вручную {#создание-вручную}

-   Сделать свой репозиторий на основе шаблона можно и вручную: <https://docs.github.com/ru/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template>.


### <span class="section-num">3.2</span> Структура шаблона {#структура-шаблона}

-   Посмотреть доступные цели `make`:
    ```shell
    make help
    ```
-   Посмотреть список доступных курсов:
    ```shell
    make list
    ```
-   При создании структуры название курса берётся из следующих мест:
    -   название курса находится в файле `COURSE`;
    -   каталог курса называется как аббревиатура курса.


### <span class="section-num">3.3</span> Настройка каталога курса {#настройка-каталога-курса}

-   Перейдите в каталог курса:
    ```shell
    cd ~/work/study/2026-1/2026-1==study--os-intro/2026-1--study--os-intro
    ```
-   Создайте необходимые каталоги:
    ```shell
    echo os-intro > COURSE
    make prepare
    ```
-   Отправьте файлы на сервер:
    ```shell
    git add .
    git commit -am 'feat(main): make course structure'
    git push
    ```


### <span class="section-num">3.4</span> Использование git flow {#использование-git-flow}

-   Будем использовать для работы git flow (см. [Рабочий процесс Gitflow]({{< relref "2021-04-18-gitflow-workflow" >}})).
-   [Практический сценарий использования git]({{< relref "2021-01-17-git-practical-use-case" >}})


#### <span class="section-num">3.4.1</span> Конфигурация git-flow {#конфигурация-git-flow}

-   Инициализируем git-flow
    ```shell
    git flow init
    ```
    Префикс для ярлыков установим в `v`.
-   Проверьте, что Вы на ветке `develop`:
    ```shell
    git branch
    ```
-   Загрузите весь репозиторий в хранилище:
    ```shell
    git push -u --all
    ```
-   Создадим релиз с версией 1.0.0
    ```shell
    git flow release start 1.0.0
    ```
-   Создадим журнал изменений
    ```shell
    standard-changelog --first-release
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
-   Скопируем CHANGELOG.md в каталог `release`:
    ```shell
    mkdir -p ../release
    cp CHANGELOG.md ../release
    ```
-   Создадим релиз на github. Для этого будем использовать утилиты работы с github (см. [github: утилиты командной строки]({{< relref "2021-08-04-github-command-line-utilities" >}})):
    ```shell
    gh release create v1.0.0 -F ../release/CHANGELOG.md
    ```
