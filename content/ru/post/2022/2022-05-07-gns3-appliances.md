---
title: "GNS3. Образы оборудования"
author: ["Dmitry S. Kulyabov"]
date: 2022-05-07T15:47:00+03:00
lastmod: 2022-06-03T12:26:00+03:00
tags: ["network", "education"]
categories: ["computer-science"]
draft: false
slug: "gns3-appliances"
---

Сам по себе GNS3 является интерфейсом к виртуальным машинам. Для моделирования сетей необходимо иметь ещё и образы операционных систем для разного оборудования.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Образы эмулируемых систем доступны в магазине: <https://gns3.com/marketplace>.


## <span class="section-num">2</span> Сетевые сервисы {#сетевые-сервисы}


### <span class="section-num">2.1</span> Networkers' Toolkit {#networkers-toolkit}

-   Название: Toolkit.
-   Магазин: <https://gns3.com/marketplace/appliances/networkers-toolkit>.
-   Виртуализация: docker.
-   Предоставляет услуги:
    -   www (nginx);
    -   ftp (vsftpd);
    -   tftp (tftpd);
    -   syslog (rsyslog);
    -   dhcp (isc-dhcpd);
    -   snmp server (snmpd + snmptrapd).


## <span class="section-num">3</span> Клиенты {#клиенты}


### <span class="section-num">3.1</span> Webterm {#webterm}

-   Магазин: <https://www.gns3.com/marketplace/appliances/webterm>.
-   Виртуализация: docker.
-   ОС: Debian Linux.
-   Набор сетевых инструментов:
    -   веб-броузер Firefox;
    -   утилиты: net-tools, iproute2, ping, traceroute, curl, host, iperf3, mtr, socat, ssh client, tcpdump;
    -   инструменты тестирования многоадресной рассылки msend/mreceive.


## <span class="section-num">4</span> Коммутаторы {#коммутаторы}


## <span class="section-num">5</span> Маршрутизаторы {#маршрутизаторы}


### <span class="section-num">5.1</span> FreeRTR {#freertr}

-   Сайт: <http://www.freertr.org/>.
-   Репозиторий: <https://github.com/rare-freertr/freeRtr>.
-   Виртуализация: qemu.
-   Необходимо RAM: 2048 MB.
-   Реализован на Java.
-   Система команд похожа на Cisco.


### <span class="section-num">5.2</span> FRRouting {#frrouting}

-   [Маршрутизация. FRRouting]({{< relref "2022-06-02-routing-frrouting" >}})
-   Магазин: <https://www.gns3.com/marketplace/appliances/frr>.
-   Сайт: <https://frrouting.org/>.
-   Репозиторий: <https://github.com/FRRouting/frr>
-   Виртуализация: qemu.
-   Необходимо RAM: 256 MB.
-   Система команд похожа на Cisco.
-   Неофициальные образы делаются для GNS3: <https://sourceforge.net/projects/gns-3/files/Qemu%20Appliances/>.


### <span class="section-num">5.3</span> VyOS {#vyos}

-   [Маршрутизация. VyOS]({{< relref "2022-06-03-routing-vyos" >}})
-   Магазин: <https://www.gns3.com/marketplace/appliances/vyos>.
-   Сайт: <https://vyos.net/>.
-   Коммерческий сайт: <https://vyos.io/>.
-   Репозиторий: <https://github.com/vyos/vyos-1x>
-   Виртуализация: qemu.
-   Необходимо RAM: 512 MB.
-   Система команд похожа на Juniper.
-   Неофициальные образы для vyos-1.1: <https://sourceforge.net/projects/gns-3/files/Qemu%20Appliances/>.
