---
title: "Почта. Yandex. Настройка почтового клиента"
date: 2021-07-04T12:16:00+03:00
lastmod: 2021-07-04T17:57:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "mail-yandex-configuring-mail-client"
---

Настройка клиента для работы с почтой Yandex.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://yandex.ru/>
-   Используются стандартные названия для папок IMAP.
-   Папки почты по умолчанию:
    -   `INBOX`;
    -   `Archive`;
    -   `Trash`;
    -   `Spam`;
    -   `Drafts`;
    -   `Sent`.


## <span class="section-num">2</span> Настройка клиента {#настройка-клиента}


### <span class="section-num">2.1</span> SMTP {#smtp}

-   login --- почтовый адрес `name@domain.ru` на Яндексе (где `name` --- это имя почтового ящика, а `domain.ru` --- имя домена);
-   password --- пароль от почтового ящика домена на Яндексе;
-   адрес почтового сервера --- `smtp.yandex.ru`;
-   защита соединения --- SSL;
-   порт --- 465.


### <span class="section-num">2.2</span> IMAP {#imap}

-   login --- почтовый адрес `name@domain.ru` на Яндексе (где `name` --- это имя почтового ящика, а `domain.ru` --- имя вашего домена);
-   password --- пароль от вашего почтового ящика домена на Яндексе;
-   адрес почтового сервера --- `imap.yandex.ru`;
-   защита соединения --- SSL;
-   порт --- 993.


### <span class="section-num">2.3</span> POP3 {#pop3}

-   login --- почтовый адрес `name@domain.ru` на Яндексе (где `name` --- это имя почтового ящика, а `domain.ru` --- имя домена);
-   password --- пароль от вашего почтового ящика домена на Яндексе;
-   адрес почтового сервера --- `pop.yandex.ru`;
-   защита соединения --- SSL;
-   порт --- 995.