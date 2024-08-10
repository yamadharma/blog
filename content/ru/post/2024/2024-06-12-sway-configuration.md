---
title: "Sway. Конфигурация"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-12T20:02:00+03:00
lastmod: 2024-07-26T18:45:00+03:00
tags: ["configuration", "linux"]
categories: ["computer-science"]
draft: false
slug: "sway-configuration"
---

Конфигурация Sway.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}


### <span class="section-num">1.1</span> Расположение {#расположение}

-   Конфигурация находится в:
    -   `/usr/share/sway/`;
    -   `/etc/sway/`;
    -   `~/.config/sway`.


### <span class="section-num">1.2</span> Переменные среды {#переменные-среды}

-   Переменные среды задаются в:
    -   `/etc/sway/environment`;
    -   `~/.config/sway/environment`.


### <span class="section-num">1.3</span> Разделы {#разделы}

-   Файлы конфигурации сгруппированы в разделы.
-   50-59 ( `50-rules-*.conf` )
    -   Оконные правила( `for_window`, `assign`  и соответствующую конфигурацию).
-   60-69 ( `60-bindings-*.conf`, `65-mode-.conf`)
    -   Привязки клавиш и режимы привязки
-   90-94 ( `90-*.conf` )
    -   Системные приложения: панели, демоны простоя и другие компоненты.
-   95-99 ( `95-*.conf` )
    -   Автозапуск приложений


## <span class="section-num">2</span> Конфигурация Sway {#конфигурация-sway}
