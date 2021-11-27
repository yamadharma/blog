---
title: "Менеджер паролей pass. Интеграция с другими программами"
author: ["Dmitry S. Kulyabov"]
date: 2021-11-20T21:47:00+03:00
lastmod: 2021-11-20T21:52:00+03:00
draft: false
slug: "password-manager-pass-integration"
---

Интеграция менеджера паролей _pass_ с другими программами (см. [Менеджер паролей pass]({{< relref "2021-04-28-password-manager-pass" >}})).

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Launchers {#launchers}


### <span class="section-num">1.1</span> rofi-pass {#rofi-pass}

-   Интеграция _pass_ с _rofi_ (см. [Запуск приложений. Rofi]({{< relref "2021-11-19-launcher_rofi" >}})).


#### <span class="section-num">1.1.1</span> Описание {#описание}

-   Интеграция _pass_ с _rofi_
-   Репозиторий: <https://github.com/carnager/rofi-pass>


#### <span class="section-num">1.1.2</span> Установка {#установка}

-   Репозиторий:

    ```shell
    https://github.com/carnager/rofi-pass
    ```
-   Установка
    -   Gentoo

        ```shell
        emerge x11-misc/rofi-pass
        ```

        -   Находится в репозитории [winny](https://gpo.zugaina.org/Overlays/winny).
        -   Добавить репозиторий:

            ```shell
            layman -a winny
            ```
