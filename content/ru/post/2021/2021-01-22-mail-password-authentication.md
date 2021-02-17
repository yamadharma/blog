---
title: "Почта. Парольная аутентификация"
date: 2021-01-22T15:20:00+03:00
lastmod: 2021-01-22T15:30:00+03:00
categories: ["blog"]
draft: false
slug: "mail-password-authentication"
---

Конфигурационные файлы для настройки парольной аутентификации для почтовых программ (в частности для Emacs).

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Парольная аутентификация {#парольная-аутентификация}


### <span class="section-num">1.1</span> Конфигурационные файлы {#конфигурационные-файлы}

-   `~/.authinfo.gpg` - зашифрованный;
-   `~/.authinfo` - не зашифрованный;
-   `~/.netrc` - устаревший вариант.


### <span class="section-num">1.2</span> Разрешения {#разрешения}

Установите права только на чтение и запись для пользователя:

```shell
chmod 600 ~/.authinfo.gpg
```


### <span class="section-num">1.3</span> Формат файла паролей {#формат-файла-паролей}

Файл имеет следующий формат:

```config
machine HOST login NAME password VALUE port NUMBER
```

Если имеется несколько учётных записей на одном сервере (например, на gmail), вместо имени хоста можно использовать имя профиля:

```config
machine PROFILE login NAME password VALUE port NUMBER
```


### <span class="section-num">1.4</span> Шифрование файла паролей {#шифрование-файла-паролей}

Для безопасности следует зашифровать файл паролей (см. [Работа с PGP]({{< relref "2020-12-18-using-pgp" >}})).

-   Зашифровать файл:

<!--listend-->

```shell
gpg -c .authinfo
```

или

```shell
gpg --symmetric .authinfo
```

-   Расшифровать файл:

    ```shell
    gpg --decrypt-files .authinfo.gpg
    ```


### <span class="section-num">1.5</span> Настройка подключения к Google {#настройка-подключения-к-google}

[Почта. Подключение к Google]({{< relref "2020-12-25-mail-google-connect" >}})


## <span class="section-num">2</span> Backlinks {#backlinks}


### <span class="section-num">2.1</span> [Emacs. Почта. GNUS]({{< relref "2020-12-21-emacs-mail-gnus" >}}) {#emacs-dot-почта-dot-gnus}

Для аутентификации будем использовать файл формата `.authinfo` (см. [Почта. Парольная аутентификация]({{< relref "2021-01-22-mail-password-authentication" >}})).


### <span class="section-num">2.2</span> [Почта. Синхронизация. mbsync]({{< relref "2021-01-22-mail-synchronization-mbsync" >}}) {#почта-dot-синхронизация-dot-mbsync}

Для хранения паролей будем использовать файл формата `.authinfo` (см. [Почта. Парольная аутентификация]({{< relref "2021-01-22-mail-password-authentication" >}})).
