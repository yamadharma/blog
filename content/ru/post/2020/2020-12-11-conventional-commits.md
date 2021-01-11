---
title: "Общепринятые коммиты"
date: 2020-12-11T19:39:00+03:00
lastmod: 2021-01-11T11:24:00+03:00
tags: ["programming"]
categories: ["sysadmin"]
draft: false
slug: "conventional-commits"
---

Использование спецификации _Conventional Commits_.

<!--more-->

{{< toc >}}


## Описание {#описание}

Спецификация [Conventional Commits](https://www.conventionalcommits.org/ru/):

-   Соглашение о том, как нужно писать сообщения commit'ов.
-   Совместимо с [SemVer](http://semver.org/) (см. [Семантическое версионирование]({{< relref "2020-12-11-semantic-versioning" >}})). Даже вернее сказать, сильно связано с семантическим версионированием.
-   Регламентирует структуру и основные типы коммитов.


### Структура коммита {#структура-коммита}

```text
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```


#### Базовые типы коммитов {#базовые-типы-коммитов}

-   `fix:` --- коммит типа fix исправляет ошибку (bug) в вашем коде (он соответствует PATCH в SemVer).
-   `feat:` --- коммит типа feat добавляет новую функцию (feature) в ваш код (он соответствует MINOR в SemVer).
-   `BREAKING CHANGE:` --- коммит, который содержит текст `BREAKING CHANGE:` в начале своего не обязательного тела сообщения (body) или в
    подвале (footer), добавляет изменения, нарушающие обратную
    совместимость вашего API (он соответствует MAJOR в SemVer). BREAKING CHANGE может быть частью коммита любого типа.
-   Другое: коммиты с типами, которые отличаются от `fix:` и `feat:`,
    также разрешены. Например, @commitlint/config-conventional
    (основанный на The Angular convention) рекомендует: chore:, docs:,
    style:, refactor:, perf:, test:, и другие.


#### Типы коммитов The Angular convention {#типы-коммитов-the-angular-convention}

Конвенция Angular ([The Angular convention](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines)) требует следующие типы коммитов:

-   `build:` Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
-   `ci:` Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
-   `docs:` Documentation only changes
-   `feat:` A new feature
-   `fix:` A bug fix
-   `perf:` A code change that improves performance
-   `refactor:` A code change that neither fixes a bug nor adds a feature
-   `style:` Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
-   `test:` Adding missing tests or correcting existing tests


#### Типы коммитов @commitlint/config-conventional {#типы-коммитов-commitlint-config-conventional}


## Программное обеспечение {#программное-обеспечение}


## Backlinks {#backlinks}


### [Система контроля версий git]({{< relref "2020-12-07-git-cvs" >}}) {#система-контроля-версий-git}

[Общепринятые коммиты]({{< relref "2020-12-11-conventional-commits" >}})
