---
title: "Emacs. Почта. Mu4e"
date: 2020-12-24T15:32:00+03:00
lastmod: 2021-01-10T20:06:00+03:00
categories: ["blog"]
draft: false
slug: "emacs-mail-mu4e"
---

Mu4e --- режим для чтения почты в Emacs.

<!--more-->

{{< toc >}}


## Установка {#установка}

Клиент mu4e является интерфейсом к программе индексирования почты mu (URL: <https://www.djcbsoftware.nl/code/mu/>).
Поэтому вначале нужно установить эту программу.


### Gentoo {#gentoo}

```shell
USE="emacs" emerge -v mu
```


## Получение почты {#получение-почты}

Для почты _mu_ поддерживает формат _maildir_[^fn:1].
Для скачивания почты можно использовать разные программы.

-   Для внешнего сервера IMAP или POP можно использовать такие инструменты, как _getmail_, _fetchmail_, _offlineimap_, _isync_, чтобы загрузить свои сообщения в формате _maildir_.
-   При использовании локального почтового сервера (_postfix_, _qmail_) настраивается сохранение сообщений в формате _maildir_.


## Backlinks {#backlinks}


### [Emacs. Почта]({{< relref "2020-12-23-emacs-mail" >}}) {#emacs-dot-почта}

[Emacs. Почта. Mu4e]({{< relref "2020-12-24-emacs-mail-mu4e" >}})

[^fn:1]: URL: <https://ru.wikipedia.org/wiki/Maildir>
