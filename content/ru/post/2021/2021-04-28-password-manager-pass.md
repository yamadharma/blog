---
title: "Менеджер паролей pass"
date: 2021-04-28T18:50:00+03:00
lastmod: 2021-05-02T21:34:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "password-manager-pass"
---

Менеджер паролей pass --- программа, сделанная в рамках идеологии Unix.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Основные свойства {#основные-свойства}

-   Данные хранятся в файловой системе в виде каталогов и файлов.
-   Файлы шифруются с помощью GPG-ключа.


## <span class="section-num">2</span> Структура базы паролей {#структура-базы-паролей}


## <span class="section-num">3</span> Реализации {#реализации}

-   Утилиты командной строки:
    -   На данный момент существует 2 основных реализации:

        -   `pass` --- классическая реализация в виде shell-скриптов (<https://www.passwordstore.org/>);
        -   `gopass` --- реализация на go с дополнительными интегрированными функциями (<https://www.gopass.pw/>).

        Дальше в тексте будет использоваться программа `pass`, но всё то же самое можно сделать с помощью программы `gopass`.
-   Графические интерфейсы:
    -   `qtpass` --- может работать как графический интерфейс к `pass`, так и как самостоятельная программа. В настройках можно переключаться между использованием `pass` и `gnupg`.
    -   `gopass-ui` --- интерфейс к `gopass`.


## <span class="section-num">4</span> Установка {#установка}

-   Linux
    -   Gentoo
        -   `pass`

            ```shell
            emerge app-admin/pass
            ```
        -   `gopass`

            ```shell
            emerge app-admin/gopass
            ```
        -   `qtpass`

            ```shell
            emerge app-admin/qtpass
            ```
        -   Gopass UI
            -   Находится в оверлее awesome (<https://gitlab.awesome-it.de/overlays/awesome/>).
            -   Установка:

                ```shell
                emerge app-admin/gopass-ui
                ```

-   Macintosh

    ```shell
    brew install pass
    ```
-   Windows
    -   `pass`

        ```shell
        choco install pass4win
        ```
    -   `gopass`

        ```shell
        choco install gopass
        ```


## <span class="section-num">5</span> Настройка {#настройка}


### <span class="section-num">5.1</span> Ключи GPG {#ключи-gpg}

-   Просмотр списка ключей:

    ```shell
    gpg --list-secret-keys
    ```
-   Если ключа нет, нужно создать новый:

    ```shell
    gpg --full-generate-key
    ```


### <span class="section-num">5.2</span> Инициализация хранилища {#инициализация-хранилища}


#### <span class="section-num">5.2.1</span> pass {#pass}

-   Инициализируем хранилище:

    ```shell
    pass init <gpg-id or email>
    ```


#### <span class="section-num">5.2.2</span> gopass {#gopass}

-   Для `gopass` можно просто ввести:

    ```shell
    gopass init
    ```

    -   Программа запросит ключ и почту для git.
    -   Будет инициализирована сразу структура git в каталоге `~/.password-store`.


#### <span class="section-num">5.2.3</span> qtpass {#qtpass}

-   Также можно инициализировать с помощью графического инструмента `qtpass`:

    ```shell
    qtpass
    ```


### <span class="section-num">5.3</span> Синхронизация с git {#синхронизация-с-git}


#### <span class="section-num">5.3.1</span> gopass {#gopass}

-   При инициализации `gopass` инициализирует также структуру git.
-   При необходимости это можно сделать отдельно:

    ```shell
    gopass git init
    ```
-   Также можно задать адрес репозитория на хостинге (репозиторий необходимо предварительно создать):

    ```shell
    gopass git remote add origin git@github.com:<git_username>/<git_repo>.git
    ```
-   Для синхронизации выполняется следующая команда:

    ```shell
    gopass sync
    ```


### <span class="section-num">5.4</span> Настройка интерфейса с броузером {#настройка-интерфейса-с-броузером}

-   Для взаимодействия с броузером используется интерфейс native messaging.


#### <span class="section-num">5.4.1</span> gopass {#gopass}

-   Плагин для браузера называется [gopass bridge](https://github.com/gopasspw/gopassbridge)
    -   Firefox: <https://addons.mozilla.org/en-US/firefox/addon/gopass-bridge/>
    -   Chrome/Chromium: <https://chrome.google.com/webstore/detail/gopass-bridge/kkhfnlkhiapbiehimabddjbimfaijdhk>
-   Устанавливаем интерфейс для взаимодействия с броузером (native messaging):
    -   Gentoo

        ```shell
        emerge app-admin/gopass-jsonapi
        ```
-   Для связки плагина с `gopass` необходимо создать вспомогательный скрипт и манифест:

    ```shell
    gopass-jsonapi configure
    ```


#### <span class="section-num">5.4.2</span> pass {#pass}

-   Плагин для браузера называется [browserpass](https://github.com/browserpass/browserpass-extension).
    -   Firefox: <https://addons.mozilla.org/en-US/firefox/addon/browserpass-ce/>.
    -   Chrome/Chromium: <https://chrome.google.com/webstore/detail/browserpass-ce/naepdomgkenhinolocfifgehidddafch>.
-   Интерфейс для взаимодействия с броузером (native messaging) (<https://github.com/browserpass/browserpass-native>):
    -   Gentoo:

        ```shell
        emerge www-plugins/browserpass
        ```


### <span class="section-num">5.5</span> Тонкие настройки {#тонкие-настройки}

-   По умолчанию каталог с паролями называется `~/.password-store`. Но его можно задать также с помощью переменной окружения `PASSWORD_STORE_DIR`.


## <span class="section-num">6</span> Работа с паролями {#работа-с-паролями}


### <span class="section-num">6.1</span> Создание нового пароля {#создание-нового-пароля}


## <span class="section-num">7</span> Миграция баз паролей из других программ {#миграция-баз-паролей-из-других-программ}


### <span class="section-num">7.1</span> Скрипты для миграции {#скрипты-для-миграции}


#### <span class="section-num">7.1.1</span> pass-import {#pass-import}

-   <https://github.com/roddhjav/pass-import>
-   Расширение для `pass`.
-   Можно использовать для разных менеджеров паролей:

    | Целевой менеджер паролей | Формат |
    |--------------------------|--------|
    | csv                      | csv    |
    | gopass                   | gopass |
    | keepass                  | kdbx   |
    | keepassx2                | kdbx   |
    | keepassxc                | kdbx   |
    | pass                     | pass   |

<!--list-separator-->

1.  Установка

    -   Gentoo
        -   Находится в оверлее `wjn-overlay` (<https://data.gpo.zugaina.org/wjn-overlay/>).
        -   Установка:

            ```shell
            emerge app-admin/pass-import
            ```

<!--list-separator-->

2.  Использование

    -   Для `pass`:
        -   Автоопределение формата источника:

            ```shell
            pass import path/to/passwords
            ```
        -   Если автоопределение не сработало:

            ```shell
            pass import <password_manager> path/to/passwords
            ```
        -   Если конвертация не для `pass`:

            ```shell
            pimport <new_pm> <former_pm> path/to/passwords --out path/to/destination/pm
            ```


#### <span class="section-num">7.1.2</span> Отдельные скрипты {#отдельные-скрипты}

-   На странице <https://www.passwordstore.org/> приведён список отдельных скриптов для миграции из разных служб.
-   Используйте в целях эксперимента.


### <span class="section-num">7.2</span> Конкретные рецепты {#конкретные-рецепты}


#### <span class="section-num">7.2.1</span> LastPass {#lastpass}

-   В меню выберите _Account options > Advanced > Export > LastPass CVS File_.
-   Сохраняем результат в файл `lastpass_export.csv`.
-   Конвертация с помощью `pass-import`:

    ```shell
    pass import lastpass lastpass_export.csv
    ```
-   Альтернативный вариант. Не используйте его. Результат не соответствует структуре именования `pass`.
    -   Скачайте скрипт:

        ```shell
        wget https://git.zx2c4.com/password-store/plain/contrib/importers/lastpass2pass.rb
        ```
    -   Сделайте скрипт исполняемым:

        ```shell
        chmod +x lastpass2pass.rb
        ```
    -   Импортируйте пароли:

        ```shell
        ./lastpass2pass.rb lastpass_export.csv
        ```


## <span class="section-num">8</span> Backlinks {#backlinks}

-   [Личные базы данных]({{< relref "2021-04-27-personal-databases" >}})

<!--listend-->

-   [Менеджеры паролей]({{< relref "2021-04-29-password-managers" >}})
