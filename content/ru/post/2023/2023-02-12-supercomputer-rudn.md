---
title: "Суперкомпьютер РУДН"
author: ["Dmitry S. Kulyabov"]
date: 2023-02-12T18:35:00+03:00
lastmod: 2023-02-12T18:46:00+03:00
tags: ["rudn"]
categories: ["job", "computer-science"]
draft: false
slug: "supercomputer-rudn"
---

Суперкомпьютер РУДН

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Подключение {#подключение}


### <span class="section-num">1.1</span> VPN {#vpn}

-   Первоначально необходимо подключиться к сети суперкомпьютера через VPN (см. [VPN. L2TP+IPsec. Подключение клиента]({{< relref "2023-02-05-l2tp-ipsec-vpn-client-setup" >}})).
-   Сервера VPN:
    -   `rudn1.hpcg.ru`;
    -   `rudn2.hpcg.ru`.
-   Для подключения Вам необходимо получить:
    -   логин;
    -   пароль;
    -   общий пароль (preshared-key).


### <span class="section-num">1.2</span> SSH {#ssh}

-   Получите адрес клиентского компьютера.
-   Подключайте к нему через _ssh_.
-   Обратите внимание, что для ssh используется нестандартный порт.
