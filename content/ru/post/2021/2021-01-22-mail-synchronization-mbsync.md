---
title: "Почта. Синхронизация. mbsync"
date: 2021-01-22T15:10:00+03:00
lastmod: 2021-05-12T14:35:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "mail-synchronization-mbsync"
---

Настройка синхронизации IMAP с помощью _mbsync_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Описание {#описание}

isync/mbsync --- программа для синхронизации IMAP и локальных почтовых файлов. isync --- старое название (для совместимости).

Домашняя страница: <https://isync.sourceforge.io/>.


## <span class="section-num">2</span> Установка {#установка}

-   Gentoo

    ```shell
    emerge isync
    ```


## <span class="section-num">3</span> Настройка синхронизации {#настройка-синхронизации}

-   Будем настраивать синхронизацию нескольких учётных записей.
-   Для хранения паролей будем использовать файл формата `.authinfo` (см. [Почта. Парольная аутентификация]({{< relref "2021-01-22-mail-password-authentication" >}})).


## <span class="section-num">4</span> Конфигурация учётных записей {#конфигурация-учётных-записей}

-   Учётные записи делаем по полному наименованию почты. Я это делаю потому, что у меня есть почтовые ящики с одинаковыми именами в разных почтовых доменах.
-   Создать необходимые каталоги:

    ```conf-unix
    mkdir -p ~/Maildir/account@domain
    ```
-   Делаем конфигурационный файл для _mbsync_. Файл называется `~/.mbsyncrc`.
-   Чтобы не хранить пароли в конфигурационном файле будем использовать хранение пароля в файле `~/.authinfo.gpg` (см. [Почта. Парольная аутентификация]({{< relref "2021-01-22-mail-password-authentication" >}})).
-   Начиная с версии _mbsync-1.4.1_ операторы `Master` и `Slave` заменены на `Far` и `Near`.


### <span class="section-num">4.1</span> Общие параметры {#общие-параметры}

-   Установка параметра `CopyArrivalDate`:

    ```conf-unix
    # By default (CopyArrivalDate no), if you copy an old email from inbox to
    # Archive (e.g.) it will get the date of the copy assigned, instead of just
    # keeping its original date of arrival! Also see:
    # https://rakhim.org/fastmail-setup-with-emacs-mu4e-and-mbsync-on-macos/
    # https://wiki.archlinux.org/index.php/Isync#Emails_on_remote_server_have_the_wrong_date
    CopyArrivalDate yes
    ```


### <span class="section-num">4.2</span> Примеры конфигурации для разных провайдеров {#примеры-конфигурации-для-разных-провайдеров}


#### <span class="section-num">4.2.1</span> Gmail {#gmail}

-   <https://www.google.com/intl/ru/gmail/about/>
-   Из-за структуры тегов Gmail необходимо явно задавать названия почтовых ящиков в директивах `Far` и `Near`.
-   Папка "Отправленные" не синхронизируется потому, что Google сохраняет всю электронную почту в папке "Все сообщения", и в результате мы получим локально дубликаты.

    ```conf-unix
    # IMAPAccount (gmail)

    IMAPAccount account1@gmail.com
    Host imap.gmail.com
    User account1@gmail.com
    # Pass ***************
    # To store the password in an encrypted file use PassCmd instead of Pass
    PassCmd "gpg -q --for-your-eyes-only --no-tty -d ~/.authinfo.gpg | awk '/machine account1@gmail.com/ {print $6}'"
    Port 993
    SSLType IMAPS
    AuthMechs LOGIN
    SSLVersions TLSv1.2

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

    ```conf-unix
    # IMAPAccount (gmail)

    IMAPAccount account@gmail.com
    Host imap.gmail.com
    User account@gmail.com
    # Pass ***************
    # To store the password in an encrypted file use PassCmd instead of Pass
    PassCmd "gpg -q --for-your-eyes-only --no-tty -d ~/.authinfo.gpg | awk '/machine account@gmail.com/ {print $6}'"
    AuthMechs LOGIN
    SSLType IMAPS
    SSLVersions TLSv1.2
    Port 993

    MaildirStore account@gmail.com-local
    Path ~/Maildir/account@gmail.com/
    Inbox ~/Maildir/account@gmail.com/Inbox
    SubFolders Verbatim

    IMAPStore account@gmail.com-remote
    Account account@gmail.com

    Channel account@gmail.com-inbox
    Far :account@gmail.com-remote:"INBOX"
    Near :account@gmail.com-local:"INBOX"
    CopyArrivalDate yes
    # Automatically create missing mailboxes, both locally and on the server
    Create Both
    Expunge Both
    # Save the synchronization state files in the relevant directory
    SyncState *

    Channel account@gmail.com-trash
    Far :account@gmail.com-remote:"[Gmail]/Trash"
    Near :account@gmail.com-local:"Trash"
    CopyArrivalDate yes
    # Automatically create missing mailboxes, both locally and on the server
    Create Both
    Expunge Both
    # Save the synchronization state files in the relevant directory
    SyncState *

    Channel account@gmail.com-spam
    Far :account@gmail.com-remote:"[Gmail]/Spam"
    Near :account@gmail.com-local:"Spam"
    CopyArrivalDate yes
    # Automatically create missing mailboxes, both locally and on the server
    Create Both
    Expunge Both
    # Save the synchronization state files in the relevant directory
    SyncState *

    Channel account@gmail.com-all
    Far :account@gmail.com-remote:"[Gmail]/All Mail"
    Near :account@gmail.com-local:"Archive"
    CopyArrivalDate yes
    # Automatically create missing mailboxes, both locally and on the server
    Create Both
    Expunge Both
    # Save the synchronization state files in the relevant directory
    SyncState *

    Channel account@gmail.com-drafts
    Far :account@gmail.com-remote:"[Gmail]/Drafts"
    Near :account@gmail.com-local:"Drafts"
    CopyArrivalDate yes
    # Automatically create missing mailboxes, both locally and on the server
    Create Both
    Expunge Both
    # Save the synchronization state files in the relevant directory
    SyncState *

    Group account@gmail.com
    Channel account@gmail.com-inbox
    Channel account@gmail.com-trash
    Channel account@gmail.com-all
    Channel account@gmail.com-spam
    Channel account@gmail.com-drafts
    ```


#### <span class="section-num">4.2.2</span> Apple {#apple}

-   <https://www.icloud.com/mail>

    ```conf-unix
    # IMAPAccount (Apple)

    IMAPAccount account@icloud.com
    Host imap.mail.me.com
    PORT 993
    User account@icloud.com
    PassCmd "gpg -q --for-your-eyes-only --no-tty -d ~/.authinfo.gpg | awk '/machine account@icloud.com/ {print $6}'"
    AuthMechs LOGIN
    SSLType IMAPS
    SSLVersion TLSv1.2

    MaildirStore account@icloud.com-local
    Path ~/Maildir/account@icloud.com/
    Inbox ~/Maildir/account@icloud.com/Inbox
    SubFolders Verbatim

    IMAPStore account@icloud.com-remote
    Account account@icloud.com

    Channel account@icloud.com-all
    Far :account@icloud.com-remote:
    Near :account@icloud.com-local:
    # Included mailboxes
    Patterns "INBOX" "Archive" "Trash" "Spam" "Drafts"
    CopyArrivalDate yes
    Create Both
    Expunge Both
    SyncState *

    Channel account@icloud.com-sent
    Far :account@icloud.com-remote:"Sent Messages"
    Near :account@icloud.com-local:"Sent"
    CopyArrivalDate yes
    Create Both
    Expunge Both
    SyncState *

    Group account@icloud.com
    Channel account@icloud.com-sent
    Channel account@icloud.com-all
    ```


#### <span class="section-num">4.2.3</span> GMX {#gmx}

-   <https://www.gmx.com/>
-   <https://www.gmx.net/>

    ```conf-unix
    # IMAPAccount (GMX)

    IMAPAccount account@gmx.com
    Host imap.gmx.com
    User account@gmx.com
    PassCmd "gpg -q --for-your-eyes-only --no-tty -d ~/.authinfo.gpg | awk '/machine account@gmx.com/ {print $6}'"
    AuthMechs LOGIN
    SSLType IMAPS
    SSLVersion TLSv1.2

    MaildirStore account@gmx.com-local
    Path ~/Maildir/account@gmx.com/
    Inbox ~/Maildir/account@gmx.com/Inbox
    SubFolders Verbatim

    IMAPStore account@gmx.com-remote
    Account account@gmx.com

    Channel account@gmx.com
    Far :account@gmx.com-remote:
    Near :account@gmx.com-local:
    Patterns "INBOX" "Archive" "Trash" "Spam" "Drafts" "Sent"
    CopyArrivalDate yes
    Create Both
    Expunge Both
    SyncState *
    ```


#### <span class="section-num">4.2.4</span> Proton {#proton}

-   <https://protonmail.com/>
-   Заблокирован в России.
-   Для работы необходимо установить локальное приложение <https://protonmail.com/bridge/>.

    ```conf-unix
    # IMAPAccount (Proton)

    IMAPAccount account@protonmail.com
    Host 127.0.0.1
    PORT 1111
    User account@protonmail.com
    PassCmd "gpg -q --for-your-eyes-only --no-tty -d ~/.authinfo.gpg | awk '/machine account@protonmail.com/ {print $6}'"
    AuthMechs LOGIN
    SSLType STARTTLS
    SSLVersion TLSv1.2

    MaildirStore account@protonmail.com-local
    Path ~/Maildir/account@protonmail.com/
    Inbox ~/Maildir/account@protonmail.com/Inbox
    SubFolders Verbatim

    IMAPStore account@protonmail.com-remote
    Account account@protonmail.com

    Channel account@protonmail.com
    Far :account@protonmail.com-remote:
    Near :account@protonmail.com-local:
    Patterns "INBOX" "Archive" "Trash" "Spam" "Drafts" "Sent"
    CopyArrivalDate yes
    Create Both
    Expunge Both
    SyncState *
    ```


## <span class="section-num">5</span> Синхронизация {#синхронизация}


### <span class="section-num">5.1</span> Запуск из командной строки {#запуск-из-командной-строки}

-   Синхронизация конкретной учётной записи:

    ```shell
    mbsync <chanel>
    ```
-   Синхронизация всех учётных записей:

    ```shell
    mbsync --all
    ```


### <span class="section-num">5.2</span> Запуск по таймеру {#запуск-по-таймеру}

-   Для синхронизации с помощью `systemd` надо добавить сервис и таймер.
-   После создания этих файлов добавьте `mbsync.timer` в `systemctl`:

    ```shell
    systemctl --user --now enable mbsync.timer
    ```
-   `~/.config/systemd/user/mbsync.service`. После синхронизации запускаем индексирование для `mu`.

    ```conf-unix
    # ~/.config/systemd/user/mbsync.service

    [Unit]
    Description=Mailbox synchronization service

    [Service]
    Type=oneshot
    ExecStart=/usr/bin/mbsync -a
    ExecStartPost=/usr/bin/mu index
    ```
-   `~/.config/systemd/user/mbsync.timer`. Настраиваем запуск `mbsync` через 2 минуты после загрузки, а затем запускаем каждые 5 минут.

    ```conf-unix
    # ~/.config/systemd/user/mbsync.timer

    [Unit]
    Description=Mailbox synchronization timer

    [Timer]
    OnBootSec=2m
    OnUnitActiveSec=5m
    Unit=mbsync.service

    [Install]
    WantedBy=timers.target
    ```


## <span class="section-num">6</span> Backlinks {#backlinks}

-   [Emacs. Почта. Mu4e]({{< relref "2020-12-24-emacs-mail-mu4e" >}})
