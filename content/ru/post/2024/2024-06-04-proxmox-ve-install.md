---
title: "Linux. Установка Proxmox VE"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-04T11:23:00+03:00
lastmod: 2024-06-18T07:59:00+03:00
tags: ["sysadmin", "linux"]
categories: ["computer-science"]
draft: false
slug: "proxmox-ve-install"
---

Установка Proxmox VE.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://www.proxmox.com/en/proxmox-virtual-environment>


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Стандартная установка {#стандартная-установка}

-   Если Вы используете железный RAID-контроллер, не используйте с ним файловую систему ZFS.
-   После завершения установки, сервер нужно перезагрузить с помощью кнопки `Reboot`.


### <span class="section-num">2.2</span> Web-интерфейс {#web-интерфейс}

-   Веб-интерфейс управления станет доступен по адресу:

    <div class="verse">

    <https://ip_адрес_сервера:8006><br />

    </div>


## <span class="section-num">3</span> Настройка после установки {#настройка-после-установки}


### <span class="section-num">3.1</span> Повышение комфорта работы {#повышение-комфорта-работы}

-   Программы для удобства работы в консоли:
    ```shell
    apt -y install tmux mc
    ```
-   Программы мониторинга:
    ```shell
    apt -y install htop lsof
    ```
-   Утилита для ssh:
    ```shell
    apt -y install mosh
    ```
-   Удобство работы с bash:
    ```shell
    apt -y install bash-completion
    ```
-   Разные утилиты:
    ```shell
    apt -y install p7zip-full git
    ```
-   Для удалённой работы с kitty:
    ```shell
    apt -y install kitty-terminfo kitty-shell-integration
    ```


### <span class="section-num">3.2</span> Скрипты для тьюнинга (см. [Proxmox. Вспомогательные скрипты]({{< relref "2024-06-04-proxmox-helper-scripts" >}})) {#скрипты-для-тьюнинга--см-dot-proxmox-dot-вспомогательные-скрипты-20240604133400-proxmox-вспомогательные-скрипты-dot-md}

-   Proxmox VE Post Install
    ```shell
    bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
    ```

-   Proxmox VE Processor Microcode
    ```shell
    bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/microcode.sh)"
    ```


## <span class="section-num">4</span> Настройка сети с VLAN {#настройка-сети-с-vlan}

-   Будем делать сеть на основе Open vSwitch.
-   Установим Open vSwitch:
    ```shell
    apt-get install openvswitch-switch
    ```
-   Создадим _OVS Bridge_ c поддержкой VLAN из графического интерфейса и прикрепим его к сетевому интерфейсу.
-   Например, установим мост `vmbr1` на интерфейс `eno2`:
    ```conf-unix
    auto eno2
    iface eno2 inet manual
          ovs_type OVSPort
          ovs_bridge vmbr1

    auto vmbr1
    iface vmbr1 inet manual
          ovs_type OVSBridge
          ovs_ports eno2
    ```
-   Для создания VLAN для самого сервера создаём _OVSIntPort_.
-   После настроек нажимаем _Apply Configuration_ в графическом интерфейсе.
-   Виртуальные машины прикрепляем на созданный мост, настройках сети устанавливаем нужный _VLAN Tag_.
