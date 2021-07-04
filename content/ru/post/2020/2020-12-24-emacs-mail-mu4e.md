---
title: "Emacs. Почта. Mu4e"
date: 2020-12-24T15:32:00+03:00
lastmod: 2021-07-04T21:05:00+03:00
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

Перед использованием необходимо инициализировать базу данных писем:

```shell
mu init --maildir=~/Maildir \
   --my-address=account1@domain1 \
   --my-address=account2@domain2
```


### <span class="section-num">3.3</span> Индексирование почты {#индексирование-почты}

После загрузки писем необходимо инициализировать базу данных `mu` и про индексировать электрические письма:

```shell
mu index
```

[^fn:1]: URL: <https://ru.wikipedia.org/wiki/Maildir>
