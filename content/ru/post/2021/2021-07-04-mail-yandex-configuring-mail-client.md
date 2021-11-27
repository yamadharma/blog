---
title: "Почта. Yandex. Настройка почтового клиента"
author: ["Dmitry S. Kulyabov"]
date: 2021-07-04T12:16:00+03:00
lastmod: 2021-11-01T21:34:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "mail-yandex-configuring-mail-client"
---

Настройка клиента для работы с почтой _Yandex_.

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

-   login --- почтовый адрес `name@domain.ru` на Яндексе (где `name` --- это имя почтового ящика, а `domain.ru` --- имя домена);
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


## <span class="section-num">3</span> Усиленная аутентификация {#усиленная-аутентификация}

-   Возможна настройка аутентификации для приложений (см. [Почта. Yandex. Пароли приложений]({{< relref "2021-11-01-mail-yandex-application-passwords" >}})).
