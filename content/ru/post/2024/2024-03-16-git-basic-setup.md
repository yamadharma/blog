---
title: "Базовая настройка git"
author: ["Dmitry S. Kulyabov"]
date: 2024-03-16T17:34:00+03:00
lastmod: 2024-03-16T17:39:00+03:00
tags: ["sysadmin", "git"]
categories: ["computer-science"]
draft: false
slug: "git-basic-setup"
---

Базовая настройка git.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Первичная настройка параметров git {#первичная-настройка-параметров-git}

-   Зададим имя и email владельца репозитория:
    ```shell
    git config --global user.name "Name Surname"
    git config --global user.email "work@mail"
    ```
-   Настроим utf-8 в выводе сообщений git:
    ```shell
    git config --global core.quotepath false
    ```
-   Настройте верификацию и подписание коммитов git (см. [Верификация коммитов git с помощью GPG]({{< relref "2021-01-28-verifying-git-commits-gpg" >}})).
-   Зададим имя начальной ветки (будем называть её `master`):
    ```shell
    git config --global init.defaultBranch master
    ```
-   Зададим опцию для автоматического задания удалённой ветки:
    ```shell
    git config --global push.autoSetupRemote true
    ```


## <span class="section-num">2</span> Учёт переносов строк {#учёт-переносов-строк}

-   В разных операционных системах приняты разные символы для перевода строк:
    -   Windows: `\r\n` (`CR` и `LF`);
    -   Unix: `\n` (`LF`);
    -   Mac: `\r` (`CR`).
-   Посмотреть значения переносов строк в репозитории можно командой:
    ```shell
    git ls-files --eol
    ```


### <span class="section-num">2.1</span> Параметр `autocrlf` {#параметр-autocrlf}

-   Настройка `core.autocrlf` предназначена для того, чтобы в главном репозитории все переводы строк текстовых файлах были одинаковы.
-   Настройка `core.autocrlf` с параметрами `true` и `input` делает все переводы строк текстовых файлов в главном репозитории одинаковыми.
    -   `core.autocrlf true`: конвертация `CRLF->LF` при коммите и обратно `LF->CRLF` при выгрузке кода из репозитория на файловую систему (обычно используется в Windows).
    -   `core.autocrlf input`: конвертация `CRLF->LF` только при коммитах (используются в MacOS/Linux).
-   Варианты конвертации

    <div class="table-caption">
      <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1:</span>
      Варианты конвертации для разных значений параметра core.autocrlf
    </div>

    | core.autocrlf | false           | input           | true            |
    |---------------|-----------------|-----------------|-----------------|
    | git commit    | LF -&gt; LF     | LF -&gt; LF     | LF -&gt; CRLF   |
    |               | CR -&gt; CR     | CR -&gt; CR     | CR -&gt; CR     |
    |               | CRLF -&gt; CRLF | CRLF -&gt; LF   | CRLF -&gt; CRLF |
    | git checkout  | LF -&gt; LF     | LF -&gt; LF     | LF -&gt; CRLF   |
    |               | CR -&gt; CR     | CR -&gt; CR     | CR -&gt; CR     |
    |               | CRLF -&gt; CRLF | CRLF -&gt; CRLF | CRLF -&gt; CRLF |
-   Установка параметра:
    -   Для Windows
        ```shell
        git config --global core.autocrlf true
        ```
    -   Для Linux
        ```shell
        git config --global core.autocrlf input
        ```


### <span class="section-num">2.2</span> Параметр `safecrlf` {#параметр-safecrlf}

-   Настройка `core.safecrlf`  предназначена для проверки, является ли окончаний строк обратимым для текущей настройки `core.autocrlf`.
    -   `core.safecrlf true`: запрещается необратимое преобразование `lf<->crlf`. Полезно, когда существуют бинарные файлы, похожие на текстовые файлы.
    -   `core.safecrlf warn`: печать предупреждения, но коммиты с необратимым переходом принимаются.
-   Установка параметра:
    ```shell
    git config --global core.safecrlf warn
    ```
