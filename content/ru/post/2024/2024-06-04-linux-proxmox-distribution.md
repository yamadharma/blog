---
title: "Linux. Дистрибутив Proxmox"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-04T10:45:00+03:00
lastmod: 2024-06-04T13:51:00+03:00
tags: ["sysadmin", "linux"]
categories: ["computer-science"]
draft: false
slug: "linux-proxmox-distribution"
---

Дистрибутив Proxmox.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Набор дистрибутивов Linux.
-   Основаны на Debian GNU/Linux.
-   Разрабатывается австрийской фирмой Proxmox Server Solutions GmbH, спонсируемой Internet Foundation Austria.
-   Сайт: <https://www.proxmox.com/>


### <span class="section-num">1.1</span> Proxmox Virtual Environment (Proxmox VE) {#proxmox-virtual-environment--proxmox-ve}

-   Основной дистрибутив набора.
-   Система виртуализации.
-   В качестве гипервизоров использует KVM и LXC (начиная с версии 4.0, в версиях до 3.4 включительно вместо него использовался OpenVZ).
-   Управление виртуальными машинами и администрирование самого сервера производятся через веб-интерфейс либо через интерфейс командной строки.


## <span class="section-num">2</span> Установка и настройка {#установка-и-настройка}

-   [Linux. Установка Proxmox VE]({{< relref "2024-06-04-proxmox-ve-install" >}})
-   [Proxmox. Вспомогательные скрипты]({{< relref "2024-06-04-proxmox-helper-scripts" >}})
