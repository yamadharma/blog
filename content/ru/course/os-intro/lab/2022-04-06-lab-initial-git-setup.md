---
title: "Лабораторная работа Первоначальна настройка git"
author: ["Dmitry S. Kulyabov"]
date: 2022-04-06T18:06:00+03:00
lastmod: 2023-02-02T19:00:00+03:00
tags: ["education"]
categories: ["computer-science"]
draft: false
weight: 205
toc: true
type: "book"
feedback: false
slug: "lab-initial-git-setup"
summary: "Первоначальна настройка git"
linktitle: "Первоначальна настройка git"
menu:
  "lab-initial-git-setup":
    identifier: "лабораторная-работа-первоначальна-настройка-git"
    parent: "os-intro-lab"
    weight: 205
---

Лабораторная работа _Первоначальна настройка git_.

<!--more-->


## <span class="section-num">1</span> Цель работы {#цель-работы}

-   Изучить идеологию и применение средств контроля версий.
-   Освоить умения по работе с git.


## <span class="section-num">2</span> Теоретические сведения {#теоретические-сведения}


### <span class="section-num">2.1</span> Системы контроля версий. Общие понятия {#системы-контроля-версий-dot-общие-понятия}

_Системы контроля версий (Version Control System, VCS)_ применяются при работе нескольких человек над одним проектом. Обычно основное дерево проекта хранится в локальном или удалённом репозитории, к которому настроен доступ для участников проекта. При внесении изменений в содержание проекта система контроля версий позволяет их фиксировать, совмещать изменения, произведённые разными участниками проекта, производить откат к любой более ранней версии проекта, если это требуется.

В классических системах контроля версий используется централизованная модель, предполагающая наличие единого репозитория для хранения файлов. Выполнение большинства функций по управлению версиями осуществляется специальным сервером. Участник проекта (пользователь) перед началом работы посредством определённых команд получает нужную ему версию файлов. После внесения изменений, пользователь размещает новую версию в хранилище. При этом предыдущие версии не удаляются из центрального хранилища и к ним можно вернуться в любой момент. Сервер может сохранять не полную версию изменённых файлов, а производить так называемую дельта-компрессию --- сохранять только изменения между последовательными версиями, что позволяет уменьшить объём хранимых данных.

Системы контроля версий поддерживают возможность отслеживания и разрешения конфликтов, которые могут возникнуть при работе нескольких человек над одним файлом. Можно объединить (слить) изменения, сделанные разными участниками (автоматически или вручную), вручную выбрать нужную версию, отменить изменения вовсе или заблокировать файлы для изменения. В зависимости от настроек блокировка не позволяет другим пользователям получить рабочую копию или препятствует изменению рабочей копии файла средствами файловой системы ОС, обеспечивая таким образом, привилегированный доступ только одному пользователю, работающему с файлом.

Системы контроля версий также могут обеспечивать дополнительные, более гибкие функциональные возможности. Например, они могут поддерживать работу с несколькими версиями одного файла, сохраняя общую историю изменений до точки ветвления версий и собственные истории изменений каждой ветви. Кроме того, обычно доступна информация о том, кто из участников, когда и какие изменения вносил. Обычно такого рода информация хранится в журнале изменений, доступ к которому можно ограничить.

В отличие от классических, в распределённых системах контроля версий центральный репозиторий не является обязательным.

Среди классических VCS наиболее известны CVS, Subversion, а среди распределённых --- Git, Bazaar, Mercurial. Принципы их работы схожи, отличаются они в основном синтаксисом используемых в работе команд.


### <span class="section-num">2.2</span> Примеры использования git {#примеры-использования-git}

-   Система контроля версий Git представляет собой набор программ командной строки. Доступ к ним можно получить из терминала посредством ввода команды `git` с различными опциями.
-   Благодаря тому, что Git является распределённой системой контроля версий, резервную копию локального хранилища можно сделать простым копированием или архивацией.


#### <span class="section-num">2.2.1</span> Основные команды git {#основные-команды-git}

-   Перечислим наиболее часто используемые команды `git`.

-   Создание основного дерева репозитория:
    ```sh
    git init
    ```

-   Получение обновлений (изменений) текущего дерева из центрального репозитория:
    ```sh
    git pull
    ```

-   Отправка всех произведённых изменений локального дерева в центральный репозиторий:
    ```sh
    git push
    ```

-   Просмотр списка изменённых файлов в текущей директории:
    ```sh
    git status
    ```

-   Просмотр текущих изменений:
    ```sh
    git diff
    ```

-   Сохранение текущих изменений:
    -   добавить все изменённые и/или созданные файлы и/или каталоги:
        ```sh
        git add .
        ```

    -   добавить конкретные изменённые и/или созданные файлы и/или каталоги:
        ```sh
        git add имена_файлов
        ```

    -   удалить файл и/или каталог из индекса репозитория (при этом файл и/или каталог остаётся в локальной директории):
        ```sh
        git rm имена_файлов
        ```

-   Сохранение добавленных изменений:
    -   сохранить все добавленные изменения и все изменённые файлы:
        ```sh
        git commit -am 'Описание коммита'
        ```
    -   сохранить добавленные изменения с внесением комментария через встроенный редактор:
        ```sh
        git commit
        ```
    -   создание новой ветки, базирующейся на текущей:
        ```sh
        git checkout -b имя_ветки
        ```
    -   переключение на некоторую ветку:
        ```sh
        git checkout имя_ветки
        ```

        -   (при переключении на ветку, которой ещё нет в локальном репозитории, она будет создана и связана с удалённой)
    -   отправка изменений конкретной ветки в центральный репозиторий:
        ```sh
        git push origin имя_ветки
        ```
    -   слияние ветки с текущим деревом:
        ```sh
        git merge --no-ff имя_ветки
        ```

-   Удаление ветки:
    -   удаление локальной уже слитой с основным деревом ветки:
        ```sh
        git branch -d имя_ветки
        ```
    -   принудительное удаление локальной ветки:
        ```sh
        git branch -D имя_ветки
        ```
    -   удаление ветки с центрального репозитория:
        ```sh
        git push origin :имя_ветки
        ```


#### <span class="section-num">2.2.2</span> Стандартные процедуры работы при наличии центрального репозитория {#стандартные-процедуры-работы-при-наличии-центрального-репозитория}

-   Работа пользователя со своей веткой начинается с проверки и получения изменений из центрального репозитория (при этом в локальное дерево до начала этой процедуры не должно было вноситься изменений):
    ```sh
    git checkout master
    git pull
    git checkout -b имя_ветки
    ```

-   Затем можно вносить изменения в локальном дереве и/или ветке.

-   После завершения внесения какого-то изменения в файлы и/или каталоги проекта необходимо разместить их в центральном репозитории. Для этого необходимо проверить, какие файлы изменились к текущему моменту:
    ```sh
    git status
    ```

-   При необходимости удаляем лишние файлы, которые не хотим отправлять в центральный репозиторий.
-   Затем полезно просмотреть текст изменений на предмет соответствия правилам ведения чистых коммитов:
    ```sh
    git diff
    ```

-   Если какие-либо файлы не должны попасть в коммит, то помечаем только те файлы, изменения которых нужно сохранить. Для этого используем команды добавления и/или удаления с нужными опциями:
    ```sh
    git add …
    git rm …
    ```

-   Если нужно сохранить все изменения в текущем каталоге, то используем:
    ```sh
    git add .
    ```

-   Затем сохраняем изменения, поясняя, что было сделано:
    ```sh
    git commit -am "Some commit message"
    ```

-   Отправляем изменения в центральный репозиторий:
    ```sh
    git push origin имя_ветки
    ```
    или
    ```sh
    git push
    ```


#### <span class="section-num">2.2.3</span> Работа с локальным репозиторием {#работа-с-локальным-репозиторием}

-   Создадим локальный репозиторий.
-   Сначала сделаем предварительную конфигурацию, указав имя и email владельца репозитория:
    ```sh
    git config --global user.name "Имя Фамилия"
    git config --global  user.email "work@mail"
    ```

-   Настроим utf-8 в выводе сообщений `git`:
    ```sh
    git config --global quotepath false
    ```

-   Для инициализации локального репозитория, расположенного, например, в каталоге `~/tutorial`, необходимо ввести в командной строке:
    ```sh
    cd
    mkdir tutorial
    cd tutorial
    git init
    ```
-   После это в каталоге `tutorial` появится каталог `.git`, в котором будет храниться история изменений.
-   Создадим тестовый текстовый файл `hello.txt` и добавим его в локальный репозиторий:
    ```sh
    echo 'hello world' > hello.txt
    git add hello.txt
    git commit -am 'Новый файл'
    ```
-   Воспользуемся командой `status` для просмотра изменений в рабочем каталоге, сделанных с момента последней ревизии:
    ```sh
    git status
    ```
-   Во время работы над проектом так или иначе могут создаваться файлы, которые не требуется добавлять в последствии в репозиторий. Например, временные файлы, создаваемые редакторами, или объектные файлы, создаваемые компиляторами. Можно прописать шаблоны игнорируемых при добавлении в репозиторий типов файлов в файл `.gitignore` с помощью сервисов. Для этого сначала нужно получить список имеющихся шаблонов:
    ```sh
    curl -L -s https://www.gitignore.io/api/list
    ```
-   Затем скачать шаблон, например, для C и C++
    ```sh
    curl -L -s https://www.gitignore.io/api/c >> .gitignore
    curl -L -s https://www.gitignore.io/api/c++ >> .gitignore
    ```


#### <span class="section-num">2.2.4</span> Работа с сервером репозиториев {#работа-с-сервером-репозиториев}

-   Для последующей идентификации пользователя на сервере репозиториев необходимо сгенерировать пару ключей (приватный и открытый):
    ```sh
    ssh-keygen -C "Имя Фамилия <work@mail>"
    ```
-   Ключи сохраняться в каталоге `~/.ssh/`.
-   Существует несколько доступных серверов репозиториев с возможностью бесплатного размещения данных. Например, <https://github.com/>.
-   Для работы с ним необходимо сначала завести на сайте <https://github.com/> учётную запись. Затем необходимо загрузить сгенерённый нами ранее открытый ключ.
-   Для этого зайти на сайт <https://github.com/> под своей учётной записью и перейти в меню _GitHub setting_.
-   После этого выбрать в боковом меню _GitHub setting&gt;SSH-ключи_ и нажать кнопку _Добавить ключ_. Скопировав из локальной консоли ключ в буфер обмена:
    ```sh
    cat ~/.ssh/id_rsa.pub | xclip -sel clip
    ```

-   Вставляем ключ в появившееся на сайте поле.

-   После этого можно создать на сайте репозиторий, выбрав в меню , дать ему название и сделать общедоступным (публичным).

-   Для загрузки репозитория из локального каталога на сервер выполняем следующие команды:
    ```sh
    git remote add origin
      ssh://git@github.com/<username>/<reponame>.git
    git push -u origin master
    ```

-   Далее на локальном компьютере можно выполнять стандартные процедуры для работы с `git` при наличии центрального репозитория.


### <span class="section-num">2.3</span> Базовая настройка git {#базовая-настройка-git}


#### <span class="section-num">2.3.1</span> Первичная настройка параметров git {#первичная-настройка-параметров-git}

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


#### <span class="section-num">2.3.2</span> Учёт переносов строк {#учёт-переносов-строк}

-   В разных операционных системах приняты разные символы для перевода строк:
    -   Windows: `\r\n` (`CR` и `LF`);
    -   Unix: `\n` (`LF`);
    -   Mac: `\r` (`CR`).
-   Посмотреть значения переносов строк в репозитории можно командой:
    ```shell
    git ls-files --eol
    ```

<!--list-separator-->

1.  Параметр `autocrlf`

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

<!--list-separator-->

2.  Параметр `safecrlf`

    -   Настройка `core.safecrlf`  предназначена для проверки, является ли окончаний строк обратимым для текущей настройки `core.autocrlf`.
        -   `core.safecrlf true`: запрещается необратимое преобразование `lf<->crlf`. Полезно, когда существуют бинарные файлы, похожие на текстовые файлы.
        -   `core.safecrlf warn`: печать предупреждения, но коммиты с необратимым переходом принимаются.
    -   Установка параметра:
        ```shell
        git config --global core.safecrlf warn
        ```


### <span class="section-num">2.4</span> Создание ключа ssh {#создание-ключа-ssh}


#### <span class="section-num">2.4.1</span> Общая информация {#общая-информация}

<!--list-separator-->

1.  Алгоритмы шифрования ssh

    <!--list-separator-->

    1.  Аутентификация

        В SSH поддерживается четыре алгоритма аутентификации по открытым ключам:

        -   DSA:
            -   размер ключей DSA не может превышать 1024, его следует отключить;
        -   RSA:
            -   следует создавать ключ большого размера: 4096 бит;
        -   ECDSA:
            -   ECDSA завязан на технологиях NIST, его следует отключить;
        -   Ed25519:
            -   используется пока не везде.

    <!--list-separator-->

    2.  Симметричные шифры

        -   Из 15 поддерживаемых в SSH алгоритмов симметричного шифрования, безопасными можно считать:
            -   `chacha20-poly1305`;
            -   `aes*-ctr`;
            -   `aes*-gcm`.
        -   Шифры `3des-cbc` и `arcfour` потенциально уязвимы в силу использования DES и RC4.
        -   Шифр `cast128-cbc` применяет слишком короткий размер блока (64 бит).

    <!--list-separator-->

    3.  Обмен ключами

        -   Применяемые в SSH методы обмена ключей  DH (Diffie-Hellman) и ECDH (Elliptic Curve Diffie-Hellman) можно считать безопасными.
        -   Из 8 поддерживаемых в SSH протоколов обмена ключами вызывают подозрения три,  основанные на рекомендациях NIST:
            -   `ecdh-sha2-nistp256`;
            -   `ecdh-sha2-nistp384`;
            -   `ecdh-sha2-nistp521`.
        -   Не стоит использовать протоколы, основанные на _SHA1_.

<!--list-separator-->

2.  Файлы ssh-ключей

    -   По умолчанию пользовательские ssh-ключи сохраняются в каталоге `~/.ssh` в домашнем каталоге пользователя.
    -   Убедитесь, что у вас ещё нет ключа.
    -   Файлы закрытых ключей имеют названия типа `id_<алгоритм>` (например, `id_dsa`, `id_rsa`).
        -   По умолчанию закрытые ключи имеют имена:
            ```shell
            id_dsa
            id_ecdsa
            id_ed25519
            id_rsa
            ```

    -   Открытые ключи имеют дополнительные расширения `.pub`.
        -   По умолчанию публичные ключи имеют имена:
            ```shell
            id_dsa.pub
            id_ecdsa.pub
            id_ed25519.pub
            id_rsa.pub
            ```
    -   При создании ключа команда попросит ввести любую ключевую фразу для более надёжной защиты вашего пароля. Можно пропустить этот этап, нажав `Enter`.
    -   Сменить пароль на ключ можно с помощью команды:
        ```shell
        ssh-keygen -p
        ```


#### <span class="section-num">2.4.2</span> Создание ключа ssh {#создание-ключа-ssh}

-   Ключ ssh создаётся командой:
    ```shell
    ssh-keygen -t <алгоритм>
    ```
-   Создайте ключи:
    -   по алгоритму _rsa_ с ключём размером 4096 бит:
        ```shell
        ssh-keygen -t rsa -b 4096
        ```
    -   по алгоритму _ed25519_:
        ```shell
        ssh-keygen -t ed25519
        ```
-   При создании ключа команда попросит ввести любую ключевую фразу для более надёжной защиты вашего пароля. Можно пропустить этот этап, нажав `Enter`.
-   Сменить пароль на ключ можно с помощью команды:
    ```shell
    ssh-keygen -p
    ```


#### <span class="section-num">2.4.3</span> Добавление SSH-ключа в учётную запись GitHub {#добавление-ssh-ключа-в-учётную-запись-github}

-   Скопируйте созданный SSH-ключ в буфер обмена командой:
    ```conf-unix
    xclip -i < ~/.ssh/id_ed25519.pub
    ```
-   Откройте настройки своего аккаунта на GitHub и перейдем в раздел `SSH and GPC keys`.
-   Нажмите кнопку `ew SSH key`.
-   Добавьте в поле `Title` название этого ключа, например, `ed25519@hostname`.
-   Вставьте из буфера обмена в поле `Key` ключ.
-   Нажмите кнопку `Add SSH key`.


### <span class="section-num">2.5</span> Верификация коммитов с помощью _PGP_ {#верификация-коммитов-с-помощью-pgp}

-   Как настроить PGP-подпись коммитов с помощью `gpg`.


#### <span class="section-num">2.5.1</span> Общая информация {#общая-информация}

-   Коммиты имеют следующие свойства:
    -   author (автор) --- контрибьютор, выполнивший работу (указывается для справки);
    -   committer (коммитер) --- пользователь, который закоммитил изменения.
-   Эти свойства можно переопределить при совершении коммита.
-   Авторство коммита можно подделать.
-   В git есть функция подписи коммитов.
-   Для подписывания коммитов используется технология PGP (см. [Работа с PGP]({{< relref "2020-12-18-using-pgp" >}})).
-   Подпись коммита позволяет удостовериться в том, кто является коммитером. Авторство не проверяется.


#### <span class="section-num">2.5.2</span> Создание ключа {#создание-ключа}

-   Генерируем ключ
    ```shell
    gpg --full-generate-key
    ```

-   Из предложенных опций выбираем:
    -   тип _RSA and RSA_;
    -   размер 4096;
    -   выберите срок действия; значение по умолчанию --- 0 (срок действия не истекает никогда).
-   GPG запросит личную информацию, которая сохранится в ключе:
    -   Имя (не менее 5 символов).
    -   Адрес электронной почты.
        -   При вводе email убедитесь, что он соответствует адресу, используемому на GitHub.
    -   Комментарий. Можно ввести что угодно или нажать клавишу ввода, чтобы оставить это поле пустым.


#### <span class="section-num">2.5.3</span> Экспорт ключа {#экспорт-ключа}

-   Выводим список ключей и копируем отпечаток приватного ключа:
    ```shell
    gpg --list-secret-keys --keyid-format LONG
    ```
-   Отпечаток ключа --- это последовательность байтов, используемая для идентификации более длинного, по сравнению с самим отпечатком ключа.
-   Формат строки:
    ```text
    sec   Алгоритм/Отпечаток_ключа Дата_создания [Флаги] [Годен_до]
          ID_ключа
    ```

-   Экспортируем ключ в формате ASCII по его отпечатку:
    ```shell
    gpg --armor --export <PGP Fingerprint>
    ```


#### <span class="section-num">2.5.4</span> Добавление PGP ключа в GitHub {#добавление-pgp-ключа-в-github}

-   Копируем ключ и добавляем его в настройках профиля на GitHub (или GitLab).
-   Cкопируйте ваш сгенерированный PGP ключ в буфер обмена:
    ```shell
    gpg --armor --export <PGP Fingerprint> | xclip -sel clip
    ```
-   Перейдите в настройки GitHub (<https://github.com/settings/keys>), нажмите на кнопку _New GPG key_ и вставьте полученный ключ в поле ввода.


#### <span class="section-num">2.5.5</span> Подписывание коммитов git {#подписывание-коммитов-git}

-   Подпись коммитов при работе через терминал:
    ```shell
    git commit -a -S -m 'your commit message'
    ```
-   Флаг `-S` означает создание подписанного коммита. При этом может потребоваться ввод кодовой фразы, заданной при генерации GPG-ключа.


#### <span class="section-num">2.5.6</span> Настройка автоматических подписей коммитов git {#настройка-автоматических-подписей-коммитов-git}

-   Используя введёный email, укажите Git применять его при подписи коммитов:
    ```shell
    git config --global user.signingkey <PGP Fingerprint>
    git config --global commit.gpgsign true
    git config --global gpg.program $(which gpg2)
    ```


### <span class="section-num">2.6</span> Проверка коммитов в Git {#проверка-коммитов-в-git}

-   GitHub и GitLab будут показывать значок _Verified_ рядом с вашими новыми коммитами.


#### <span class="section-num">2.6.1</span> Режим бдительности (vigilant mode) {#режим-бдительности--vigilant-mode}

-   На GitHub есть настройка [vigilant mode](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/displaying-verification-statuses-for-all-of-your-commits).
-   Все неподписанные коммиты будут явно помечены как _Unverified_.
-   Включается это в настройках в разделе _SSH and GPG keys_. Установите метку на _Flag unsigned commits as unverified_.


## <span class="section-num">3</span> Задание {#задание}

-   Создать базовую конфигурацию для работы с git.
-   Создать ключ _SSH_.
-   Создать ключ _PGP_.
-   Настроить подписи git.
-   Зарегистрироваться на _Github_.
-   Создать локальный каталог для выполнения заданий по предмету.


## <span class="section-num">4</span> Последовательность выполнения работы {#последовательность-выполнения-работы}


### <span class="section-num">4.1</span> Установка программного обеспечения {#установка-программного-обеспечения}


#### <span class="section-num">4.1.1</span> Установка git {#установка-git}

-   Установим _git_:
    ```shell
    dnf install git
    ```


#### <span class="section-num">4.1.2</span> Установка gh {#установка-gh}

-   Fedora:
    ```shell
    dnf install gh
    ```


### <span class="section-num">4.2</span> Базовая настройка git {#базовая-настройка-git}

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
-   Параметр `autocrlf`:
    ```shell
    git config --global core.autocrlf input
    ```

-   Параметр `safecrlf`:
    ```shell
    git config --global core.safecrlf warn
    ```


### <span class="section-num">4.3</span> Создайте ключи _ssh_ {#создайте-ключи-ssh}

-   по алгоритму _rsa_ с ключём размером 4096 бит:
    ```shell
    ssh-keygen -t rsa -b 4096
    ```
-   по алгоритму _ed25519_:
    ```shell
    ssh-keygen -t ed25519
    ```


### <span class="section-num">4.4</span> Создайте ключи _pgp_ {#создайте-ключи-pgp}

-   Генерируем ключ
    ```shell
    gpg --full-generate-key
    ```
-   Из предложенных опций выбираем:
    -   тип _RSA and RSA_;
    -   размер 4096;
    -   выберите срок действия; значение по умолчанию --- 0 (срок действия не истекает никогда).
-   GPG запросит личную информацию, которая сохранится в ключе:
    -   Имя (не менее 5 символов).
    -   Адрес электронной почты.
        -   При вводе email убедитесь, что он соответствует адресу, используемому на GitHub.
    -   Комментарий. Можно ввести что угодно или нажать клавишу ввода, чтобы оставить это поле пустым.


### <span class="section-num">4.5</span> Настройка github {#настройка-github}

-   Создайте учётную запись на <https://github.com>.
-   Заполните основные данные на <https://github.com>.


### <span class="section-num">4.6</span> Добавление PGP ключа в GitHub {#добавление-pgp-ключа-в-github}

-   Выводим список ключей и копируем отпечаток приватного ключа:
    ```shell
    gpg --list-secret-keys --keyid-format LONG
    ```
-   Отпечаток ключа --- это последовательность байтов, используемая для идентификации более длинного, по сравнению с самим отпечатком ключа.
-   Формат строки:
    ```text
    sec   Алгоритм/Отпечаток_ключа Дата_создания [Флаги] [Годен_до]
          ID_ключа
    ```
-   Cкопируйте ваш сгенерированный PGP ключ в буфер обмена:
    ```shell
    gpg --armor --export <PGP Fingerprint> | xclip -sel clip
    ```
-   Перейдите в настройки GitHub (<https://github.com/settings/keys>), нажмите на кнопку _New GPG key_ и вставьте полученный ключ в поле ввода.


### <span class="section-num">4.7</span> Настройка автоматических подписей коммитов git {#настройка-автоматических-подписей-коммитов-git}

-   Используя введёный email, укажите Git применять его при подписи коммитов:
    ```shell
    git config --global user.signingkey <PGP Fingerprint>
    git config --global commit.gpgsign true
    git config --global gpg.program $(which gpg2)
    ```


### <span class="section-num">4.8</span> Настройка gh {#настройка-gh}

-   Для начала необходимо авторизоваться
    ```shell
    gh auth login
    ```
-   Утилита задаст несколько наводящих вопросов.
-   Авторизоваться можно через броузер.


### <span class="section-num">4.9</span> Шаблон для рабочего пространства {#шаблон-для-рабочего-пространства}

-   [Рабочее пространство для лабораторной работы]({{< relref "2021-01-16-workspace-laboratory-work" >}})
-   Репозиторий: <https://github.com/yamadharma/course-directory-student-template>.


#### <span class="section-num">4.9.1</span> Сознание репозитория курса на основе шаблона {#сознание-репозитория-курса-на-основе-шаблона}

-   Необходимо создать шаблон рабочего пространства (см. [Рабочее пространство для лабораторной работы]({{< relref "2021-01-16-workspace-laboratory-work" >}})).
-   Например, для 2022--2023 учебного года и предмета «Операционные системы» (код предмета `os-intro`) создание репозитория примет следующий вид:
    ```shell
    mkdir -p ~/work/study/2022-2023/"Операционные системы"
    cd ~/work/study/2022-2023/"Операционные системы"
    gh repo create study_2022-2023_os-intro --template=yamadharma/course-directory-student-template --public
    git clone --recursive git@github.com:<owner>/study_2022-2023_os-intro.git os-intro
    ```


#### <span class="section-num">4.9.2</span> Настройка каталога курса {#настройка-каталога-курса}

-   Перейдите в каталог курса:
    ```shell
    cd ~/work/study/2022-2023/"Операционные системы"/os-intro
    ```
-   Удалите лишние файлы:
    ```shell
    rm package.json
    ```
-   Создайте необходимые каталоги:
    ```shell
    echo os-intro > COURSE
    make
    ```
-   Отправьте файлы на сервер:
    ```shell
    git add .
    git commit -am 'feat(main): make course structure'
    git push
    ```


## <span class="section-num">5</span> Содержание отчёта {#содержание-отчёта}

1.  Титульный лист с указанием номера лабораторной работы и ФИО студента.
2.  Формулировка цели работы.
3.  Описание результатов выполнения задания:
    -   скриншоты (снимки экрана), фиксирующие выполнение лабораторной работы;
    -   листинги (исходный код) программ (если они есть);
    -   результаты выполнения программ (текст или снимок экрана в зависимости от задания).
4.  Выводы, согласованные с целью работы.
5.  Ответы на контрольные вопросы.


## <span class="section-num">6</span> Контрольные вопросы {#контрольные-вопросы}

1.  Что такое системы контроля версий (VCS) и для решения каких задач они предназначаются?
2.  Объясните следующие понятия VCS и их отношения: хранилище, commit, история, рабочая копия.
3.  Что представляют собой и чем отличаются централизованные и децентрализованные VCS? Приведите примеры VCS каждого вида.
4.  Опишите действия с VCS при единоличной работе с хранилищем.
5.  Опишите порядок работы с общим хранилищем VCS.
6.  Каковы основные задачи, решаемые инструментальным средством `git`?
7.  Назовите и дайте краткую характеристику командам `git`.
8.  Приведите примеры использования при работе с локальным и удалённым репозиториями.
9.  Что такое и зачем могут быть нужны ветви (branches)?
10. Как и зачем можно игнорировать некоторые файлы при commit?