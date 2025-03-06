---
title: "Linux. Установка Proxmox VE"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-04T11:23:00+03:00
lastmod: 2025-03-02T21:02:00+03:00
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


### <span class="section-num">2.3</span> Выбор файловой системы {#выбор-файловой-системы}

-   Если у вас железный RAID, то выбирайте ext4 или xfs (наверное, лучше, но может посыпаться без ИБП).
-   Поверх этих систем будет установлен LVM.
-   Если у вас несколько дисков и вы желаете сделать софтовый RAID, то выбирайте RAID на ZFS.
-   Построение RAID на основе mdadm дистрибутив не поддерживает.
-   Учтите, что при соединении в кластер машин с LVM и ZFS вам придётся переконфигурировать локальное хранилище `local-lvm` вручную.


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


### <span class="section-num">3.2</span> Скрипты для тьюнинга (см. [Proxmox. Вспомогательные скрипты]({{< relref "2024-06-04-proxmox-helper-scripts" >}})) {#скрипты-для-тьюнинга--см-dot-proxmox-dot-вспомогательные-скрипты--dot-dot-notes-public-20240604133400-proxmox-вспомогательные-скрипты-dot-md}

-   Proxmox VE Post Install
    ```shell
    bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/post-pve-install.sh)"
    ```

-   Proxmox VE Processor Microcode
    ```shell
    apt -y install iucode-tool
    bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/microcode.sh)"
    ```


### <span class="section-num">3.3</span> Обновление {#обновление}

-   Обновите систему:
    ```shell
    apt update
    apt -y upgrade
    ```


### <span class="section-num">3.4</span> Безопасность {#безопасность}

-   Установите и настройте fail2ban (см. [fail2ban. Основные настройки]({{< relref "2023-10-30-fail2ban-basic-settings" >}})):
    ```shell
    apt install fail2ban
    ```
-   После настройки запустите его:
    ```shell
    systemctl enable --now fail2ban
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


## <span class="section-num">5</span> Дисковая подсистема {#дисковая-подсистема}


### <span class="section-num">5.1</span> local-lvm {#local-lvm}

-   Установщик выделяет два логических раздела: `local` и `local-lvm`.
-   На разделе `local-lvm` можно выделить дополнительный раздел.


### <span class="section-num">5.2</span> Создание дополнительного раздел на lvm-thin {#создание-дополнительного-раздел-на-lvm-thin}

-   Смотрим уже существующие VG:
    ```shell
    vgs
    ```
-   Смотрим существующие LV:
    ```shell
    lvs
    ```
-   Видим, что раздел `data` является lvm-thin (атрибут `t`).
-   Создаём на нем раздел:
    ```shell
    lvcreate -V100G -T pve/data -n newdisk
    ```
-   Проверяем:
    ```shell
    lvs
    ```
-   Форматируем раздел:
    ```shell
    mkfs.ext4 /dev/pve/newdisk
    ```
-   Можно подмонтировать:
    ```shell
    mkdir /mnt/newdisk
    mount /dev/pve/newdisk /mnt/newdisk
    ```
-   Можно по необходимости удалить раздел:
    ```shell
    vlmremove /dev/pve/newdisk
    ```
