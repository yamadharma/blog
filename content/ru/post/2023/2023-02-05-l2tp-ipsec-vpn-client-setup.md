---
title: "VPN. L2TP over IPsec. Подключение клиента"
author: ["Dmitry S. Kulyabov"]
date: 2023-02-05T13:35:00+03:00
lastmod: 2023-02-17T20:23:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "l2tp-ipsec-vpn-client-setup"
---

Подключение клиента L2TP/IPsec VPN.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Linux {#linux}


### <span class="section-num">1.1</span> Gentoo {#gentoo}


#### <span class="section-num">1.1.1</span> NetworkManager {#networkmanager}

-   Откройте пользовательский интерфейс NetworkManager, затем:
    -   Перейдите в Сеть &gt; VPN. Нажмите _+_.
    -   Выберите _Протокол туннелирования уровня 2 (L2TP)_.
    -   Вы можете выбрать имя для VPN.
    -   Введите IP-адрес вашего VPN-сервера для шлюза.
    -   Введите имя пользователя VPN для имени пользователя.
    -   Щелкните правой кнопкой мыши _?_ в поле _Пароль_ и выберите _Сохранить пароль только для этого пользователя_.
        -   Можете использовать _Сохранить пароль для всех пользователей_.
    -   Введите свой пароль VPN для пароля.
    -   Оставьте поле Домен NT пустым.
    -   Нажмите кнопку _Настройки IPsec..._.
    -   Установите флажок Включить туннель IPsec для хоста L2TP.
    -   Оставьте поле ID шлюза пустым.
    -   Введите свой _VPN IPsec PSK_ для общего ключа (preshared-key).
    -   Затем нажмите _Add_, чтобы сохранить информацию о VPN-подключении.

<!--list-separator-->

1.  Взаимодействие с Strongswan

    -   По умолчанию strongswan собирается с поддержкой capabilities и возможностью запуска под непривилегированным пользователем.
    -   Однако в NetworkManager поддержка capabilities не настроена.
    -   В результате соединение не устанавливается.
    -   Решить проблему можно следующим образом:
        -   либо установить strongswan без поддержки capabilities и возможности запуска под непривилегированным пользователем:
            ```shell
            USE="-caps -non-root" emerge strongswan
            ```
        -   либо собрать NetworkManager с поддержкой capabilities (см. <https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1053>).
