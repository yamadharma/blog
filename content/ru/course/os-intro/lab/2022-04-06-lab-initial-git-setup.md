---
title: "Лабораторная работа Первоначальна настройка git"
author: ["Dmitry S. Kulyabov"]
date: 2022-04-06T18:06:00+03:00
lastmod: 2022-12-27T14:14:00+03:00
tags: ["education"]
categories: ["computer-science"]
draft: false
weight: 205
toc: true
type: "book"
slug: "lab-initial-git-setup"
summary: "Первоначальна настройка git"
linktitle: "Первоначальна настройка"
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


## <span class="section-num">2</span> Предварительные сведения {#предварительные-сведения}


### <span class="section-num">2.1</span> Базовая настройка git {#базовая-настройка-git}


#### <span class="section-num">2.1.1</span> Первичная настройка параметров git {#первичная-настройка-параметров-git}

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


#### <span class="section-num">2.1.2</span> Дополнительные настройки {#дополнительные-настройки}

<!--list-separator-->

1.  Работа с переносами строк

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


### <span class="section-num">2.2</span> Создание ключа ssh {#создание-ключа-ssh}


#### <span class="section-num">2.2.1</span> Общая информация {#общая-информация}

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


#### <span class="section-num">2.2.2</span> Создание ключа ssh {#создание-ключа-ssh}

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


#### <span class="section-num">2.2.3</span> Добавление SSH-ключа в учётную запись GitHub {#добавление-ssh-ключа-в-учётную-запись-github}

-   Скопируйте созданный SSH-ключ в буфер обмена командой:
    ```conf-unix
    xclip -i < ~/.ssh/id_ed25519.pub
    ```
-   Откройте настройки своего аккаунта на GitHub и перейдем в раздел `SSH and GPC keys`.
-   Нажмите кнопку `ew SSH key`.
-   Добавьте в поле `Title` название этого ключа, например, `ed25519@hostname`.
-   Вставьте из буфера обмена в поле `Key` ключ.
-   Нажмите кнопку `Add SSH key`.


### <span class="section-num">2.3</span> Верификация коммитов с помощью _PGP_ {#верификация-коммитов-с-помощью-pgp}

-   Как настроить PGP-подпись коммитов с помощью `gpg`.


#### <span class="section-num">2.3.1</span> Общая информация {#общая-информация}

-   Коммиты имеют следующие свойства:
    -   author (автор) --- контрибьютор, выполнивший работу (указывается для справки);
    -   committer (коммитер) --- пользователь, который закоммитил изменения.
-   Эти свойства можно переопределить при совершении коммита.
-   Авторство коммита можно подделать.
-   В git есть функция подписи коммитов.
-   Для подписывания коммитов используется технология PGP (см. [Работа с PGP]({{< relref "2020-12-18-using-pgp" >}})).
-   Подпись коммита позволяет удостовериться в том, кто является коммитером. Авторство не проверяется.


#### <span class="section-num">2.3.2</span> Создание ключа {#создание-ключа}

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


#### <span class="section-num">2.3.3</span> Экспорт ключа {#экспорт-ключа}

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


#### <span class="section-num">2.3.4</span> Добавление PGP ключа в GitHub {#добавление-pgp-ключа-в-github}

-   Копируем ключ и добавляем его в настройках профиля на GitHub (или GitLab).
-   Cкопируйте ваш сгенерированный PGP ключ в буфер обмена:
    ```shell
    gpg --armor --export <PGP Fingerprint> | xclip -sel clip
    ```
-   Перейдите в настройки GitHub (<https://github.com/settings/keys>), нажмите на кнопку _New GPG key_ и вставьте полученный ключ в поле ввода.


#### <span class="section-num">2.3.5</span> Подписывание коммитов git {#подписывание-коммитов-git}

-   Подпись коммитов при работе через терминал:
    ```shell
    git commit -a -S -m 'your commit message'
    ```
-   Флаг `-S` означает создание подписанного коммита. При этом может потребоваться ввод кодовой фразы, заданной при генерации GPG-ключа.


#### <span class="section-num">2.3.6</span> Настройка автоматических подписей коммитов git {#настройка-автоматических-подписей-коммитов-git}

-   Используя введёный email, укажите Git применять его при подписи коммитов:
    ```shell
    git config --global user.signingkey <PGP Fingerprint>
    git config --global commit.gpgsign true
    git config --global gpg.program $(which gpg2)
    ```


### <span class="section-num">2.4</span> Проверка коммитов в Git {#проверка-коммитов-в-git}

-   GitHub и GitLab будут показывать значок _Verified_ рядом с вашими новыми коммитами.


#### <span class="section-num">2.4.1</span> Режим бдительности (vigilant mode) {#режим-бдительности--vigilant-mode}

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


#### <span class="section-num">4.1.1</span> Установка git-flow {#установка-git-flow}

-   Linux
    -   Fedora
        -   Это программное обеспечение удалено из репозитория.
        -   Необходимо устанавливать его вручную:
            ```shell
            cd /tmp
            wget --no-check-certificate -q https://raw.github.com/petervanderdoes/gitflow/develop/contrib/gitflow-installer.sh
            chmod +x gitflow-installer.sh
            sudo ./gitflow-installer.sh install stable
            ```


#### <span class="section-num">4.1.2</span> Установка gh {#установка-gh}

-   Fedora:
    ```shell
    sudo dnf install gh
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


### <span class="section-num">4.5</span> Добавление PGP ключа в GitHub {#добавление-pgp-ключа-в-github}

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


### <span class="section-num">4.6</span> Настройка автоматических подписей коммитов git {#настройка-автоматических-подписей-коммитов-git}

-   Используя введёный email, укажите Git применять его при подписи коммитов:
    ```shell
    git config --global user.signingkey <PGP Fingerprint>
    git config --global commit.gpgsign true
    git config --global gpg.program $(which gpg2)
    ```


### <span class="section-num">4.7</span> Шаблон для рабочего пространства {#шаблон-для-рабочего-пространства}

-   Репозиторий: <https://github.com/yamadharma/course-directory-student-template>.


#### <span class="section-num">4.7.1</span> Сознание репозитория курса на основе шаблона {#сознание-репозитория-курса-на-основе-шаблона}

-   Необходимо создать шаблон рабочего пространства (см. [Рабочее пространство для лабораторной работы]({{< relref "2021-01-16-workspace-laboratory-work" >}})).
-   Например, для 2022--2023 учебного года и предмета «Операционные системы» (код предмета `os-intro`) создание репозитория примет следующий вид:
    ```shell
    mkdir -p ~/work/study/2022-2023/"Операционные системы"
    cd ~/work/study/2021-2022/"Операционные системы"
    gh repo create study_2022-2023_os-intro --template=yamadharma/course-directory-student-template --public
    git clone --recursive git@github.com:<owner>/study_2022-2023_os-intro.git os-intro
    ```


#### <span class="section-num">4.7.2</span> Настройка каталога курса {#настройка-каталога-курса}

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
