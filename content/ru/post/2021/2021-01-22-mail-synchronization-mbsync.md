---
title: "Почта. Синхронизация. mbsync"
date: 2021-01-22T15:10:00+03:00
lastmod: 2021-01-22T16:06:00+03:00
categories: ["blog"]
draft: false
slug: "mail-synchronization-mbsync"
---

Настройка синхронизации IMAP с помощью _mbsync_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Описание {#описание}

isync/mbsync --- программа для синхронизации IMAP и локальных почтовых файлов. isync --- старое название (для совместимости).

Домашняя страница: <https://isync.sourceforge.io/>.


## <span class="section-num">2</span> Настройка синхронизации {#настройка-синхронизации}

-   Будем настраивать синхронизацию нескольких учётных записей.
-   Для хранения паролей будем использовать файл формата `.authinfo` (см. [Почта. Парольная аутентификация]({{< relref "2021-01-22-mail-password-authentication" >}})).


## <span class="section-num">3</span> Конфигурация учётных записей {#конфигурация-учётных-записей}

-   Создать необходимые каталоги:

    ```conf-unix
    mkdir -p ~/Maildir/account1
    ```
-   Делаем конфигурационный файл для _mbsync_. Файл называется `~/.mbsyncrc`:

    ```conf-unix
    # IMAPAccount (gmail)

    IMAPAccount account1
    Host imap.gmail.com
    User account1@gmail.com
    # Pass ***************
    # To store the password in an encrypted file use PassCmd instead of Pass
    PassCmd "gpg2 -q --for-your-eyes-only --no-tty -d ~/.authinfo.gpg | awk '/machine account1/ {print $6}'"
    Port 993
    SSLType IMAPS
    AuthMechs LOGIN

    IMAPStore account1-remote
    Account account1

    MaildirStore account1-local
    SubFolders Verbatim
    # The trailing "/" is important
    Path ~/Maildir/account1/
    Inbox ~/Maildir/account1/inbox

    Channel account1
    Master :account1-remote:
    Slave :account1-local:
    # Exclude everything under the internal [Gmail] folder, except the interesting folders
    Patterns * ![Gmail]* "[Gmail]/Sent Mail" "[Gmail]/Starred" "[Gmail]/All Mail"
    # Or include everything
    #Patterns *
    # Automatically create missing mailboxes, both locally and on the server
    Create Both
    Sync All
    Expunge Both
    # Save the synchronization state files in the relevant directory
    SyncState *
    ```


## <span class="section-num">4</span> Запуск синхронизации {#запуск-синхронизации}


### <span class="section-num">4.1</span> Запуск из командной строки {#запуск-из-командной-строки}

-   Синхронизация конкретной учётной записи:

    ```shell
    mbsync <chanel>
    ```
-   Синхронизация всех учётных записей:

    ```shell
    mbsync --all
    ```


## <span class="section-num">5</span> Backlinks {#backlinks}


### <span class="section-num">5.1</span> [Emacs. Почта. Mu4e]({{< relref "2020-12-24-emacs-mail-mu4e" >}}) {#emacs-dot-почта-dot-mu4e}

Для синхронизации будем использовать программу _mbsync_ (см. [Почта. Синхронизация. mbsync]({{< relref "2021-01-22-mail-synchronization-mbsync" >}})).
