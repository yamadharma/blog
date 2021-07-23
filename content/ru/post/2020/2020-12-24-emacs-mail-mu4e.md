---
title: "Emacs. Почта. Mu4e"
author: ["Dmitry S. Kulyabov"]
date: 2020-12-24T15:32:00+03:00
lastmod: 2021-07-17T15:52:00+03:00
categories: ["blog"]
draft: false
slug: "emacs-mail-mu4e"
---

Mu4e --- режим для чтения почты в Emacs.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Установка {#установка}

-   Клиент mu4e является интерфейсом к программе индексирования почты mu (URL: <https://www.djcbsoftware.nl/code/mu/>).
-   Поэтому вначале нужно установить эту программу.


### <span class="section-num">1.1</span> Gentoo {#gentoo}

```shell
USE="emacs" emerge -v mu
```


## <span class="section-num">2</span> Структура каталогов {#структура-каталогов}

Почтовые ящики будут находиться в каталоге `~/Maildir`.


## <span class="section-num">3</span> Получение почты {#получение-почты}

Для почты _mu_ поддерживает формат _maildir_[^fn:1].
Для скачивания почты можно использовать разные программы.

-   Для внешнего сервера IMAP или POP можно использовать такие инструменты, как _getmail_, _fetchmail_, _offlineimap_, _isync_, чтобы загрузить свои сообщения в формате _maildir_.
-   При использовании локального почтового сервера (_postfix_, _qmail_) настраивается сохранение сообщений в формате _maildir_.


### <span class="section-num">3.1</span> Синхронизация mbsync {#синхронизация-mbsync}

Для синхронизации будем использовать программу _mbsync_ (см. [Почта. Синхронизация. mbsync]({{< relref "2021-01-22-mail-synchronization-mbsync" >}})).


### <span class="section-num">3.2</span> Инициализация {#инициализация}

-   Перед использованием необходимо инициализировать базу данных писем:

    ```shell
    mu init --maildir=~/Maildir \
       --my-address=account1@domain1 \
       --my-address=account2@domain2
    ```
-   Можно это выполнить скриптом:

    ```shell
    #!/bin/sh

    list_imap=$(grep -e "^IMAPAccount" ~/.mbsyncrc | cut -d" " -f2 | xargs -I {} -n 1 echo "--my-address="{})
    mu init --maildir=~/Maildir $list_imap
    ```
-   Я использую скрипт, поскольку у меня кэш находится на временной файловой системе, и не сохраняется при перезагрузке.


### <span class="section-num">3.3</span> Индексирование почты {#индексирование-почты}

После загрузки писем необходимо инициализировать базу данных `mu` и про индексировать электрические письма:

```shell
mu index
```


## <span class="section-num">4</span> Дополнительные пакеты {#дополнительные-пакеты}


### <span class="section-num">4.1</span> Чтение писем {#чтение-писем}


#### <span class="section-num">4.1.1</span> mu4e-views {#mu4e-views}

-   Пакет позволяет пользователю выбирать вариант просмотра электронных писем.
-   Основной вариант использования --- просмотр электронные письма с использованием окна `xwidgets`.

<!--list-separator-->

1.  Общая информация

    -   Репозиторий: <https://github.com/lordpretzel/mu4e-views>
    -   Пакет: <https://melpa.org/#/mu4e-views>


### <span class="section-num">4.2</span> Написание писем {#написание-писем}


#### <span class="section-num">4.2.1</span> org-mime {#org-mime}

-   Репозиторий: <https://github.com/org-mime/org-mime>
-   Отправка электропочты в формате HTML с помощью экспорта HTML из _org-mode_.


#### <span class="section-num">4.2.2</span> org-msg {#org-msg}

-   Для редактирования сообщения с использованием `org-mode`.
-   Заменяет встроенную в _mu4e_ поддержку `org-mode`.

<!--list-separator-->

1.  Общая информация

    -   Репозиторий: <https://github.com/jeremy-compostella/org-msg>
    -   Пакет: <https://melpa.org/#/org-msg>
    -   Поддерживаемые режимы:
        -   Message mode;
        -   mu4e mode;
        -   notmuch mode.

<!--list-separator-->

2.  Зависимости

    -   Необходим пакет [emacs-htmlize](https://github.com/hniksic/emacs-htmlize).

<!--list-separator-->

3.  Использование

    -   `C-c` `C-e` --- генерирует и отображает экспортированную версию электронной почты (`org-msg-preview`).
    -   `C-c` `C-k` --- закрывает буфер (`message-kill-buffer`).
    -   `C-c` `C-s` --- переход к теме сообщения (как и в режиме сообщения) (`message-goto-subject`).
    -   `C-c` `C-b` --- переход к телу сообщения (аналогично `message-goto-body` в режиме сообщения) (`org-msg-goto-body`).
    -   `C-c` `C-a` --- добавить (или удалить) вложение (похоже на функцию `org-attach`) (`org-msg-attach`). Список вложений хранится в свойстве `attachment:`.
    -   `C-c` `C-c` --- генерирует сообщение MIME и отправляет его (`org-ctrl-c-ctrl-c`).

<!--list-separator-->

4.  Настройка

    -   Необходимо задать `mail-user-agent` до загрузки `org-msg`:

        ```elisp
        (setq mail-user-agent 'mu4e-user-agent)
        ```

[^fn:1]: URL: <https://ru.wikipedia.org/wiki/Maildir>
