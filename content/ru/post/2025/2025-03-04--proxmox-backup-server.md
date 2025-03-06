---
title: "Proxmox Backup Server"
author: ["Dmitry S. Kulyabov"]
date: 2025-03-04T14:02:00+03:00
lastmod: 2025-03-04T16:43:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "proxmox-backup-server"
---

Proxmox Backup Server.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://www.proxmox.com>


### <span class="section-num">1.1</span> Требования {#требования}

-   Минимальные требования к серверу (предназначены только для тестирования):
    -   CPU: 64bit (x86-64 или AMD64), 2+ Ядра
    -   ОЗУ: 2 ГБ
    -   Диск: от 8 ГБ
    -   Сеть: 1 интерфейс
-   Рекомендуемые требования к серверу:
    -   CPU: 64bit, 4 Ядра
    -   ОЗУ: 4 ГБ (+1 ГБ на каждый ТБ дискового пространства)
    -   Диск: от 32 ГБ + резервное хранилище
    -   Сеть: 1 интерфейс + резервирование


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Отдельный пакет {#отдельный-пакет}

-   Установие сервер PBS:
    ```shell
    apt-get install proxmox-backup-server
    ```
-   Запустите и добавьте в автозагрузку Proxmox Backup API Proxy Server:
    ```shell
    systemctl enable --now proxmox-backup-proxy.service
    ```
-   Служба `proxmox-backup-proxy` предоставляет API Proxmox Backup Server через TCP-порт 8007 с использованием HTTPS. Операции, требующие дополнительных разрешений, перенаправляются в локальную службу `proxmox-backup`.
-   Служба `proxmox-backup` предоставляет API управления Proxmox Backup Server по адресу 127.0.0.1:82. Она имеет разрешение на выполнение всех привилегированных операций.
-   Установите клиент PBS:
    ```shell
    apt-get install proxmox-backup-client
    ```


### <span class="section-num">2.2</span> Контейнер LXC {#контейнер-lxc}

-   Запустите в консоли Proxmox VE:
    ```shell
    bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/proxmox-backup-server.sh)"
    ```


### <span class="section-num">2.3</span> Виртуальная машина {#виртуальная-машина}

-   Создадим виртуальную машину:
    ```shell
    qm create 150 --name pbs --memory 16000 --cores 4 --sockets 1 --net0 virtio,bridge=vmbr1,firewall=1,mtu=1,tag=12
    ```

    -   `tag` задаёт используемый vlan.
-   Подключим QEMU Guest Agent (см. [KVM. QEMU Guest Agent]({{< relref "2024-09-05-kvm-qemu-guest-agent" >}})):
    ```shell
    qm set 150 --agent enabled=1,fstrim_cloned_disks=1
    ```
-   Создадим диск (80GB):
    ```shell
    pvesm alloc local-lvm 150 vm-150-disk-0 80G
    ```
-   Зададим драйвер диска:
    ```shell
    qm set 150 --scsihw virtio-scsi-single
    ```
-   Подключим диск:
    ```shell
    qm set 150 --virtio0 local-lvm:vm-150-disk-0
    ```
-   Подключим CDROM:
    ```shell
    qm set 150 --ide2 local:iso/proxmox-backup-server_3.3-1.iso,media=cdrom
    ```
-   Зададим порядок загрузки (CD-ROM, затем диск)
    ```shell
    qm set 150 --boot c --bootdisk virtio0
    qm set 150 --boot order='ide2;virtio0'
    ```
-   Зададим тип CPU:
    ```shell
    qm set 150 --cpu cputype=host
    ```
-   Подключим для мышки:
    ```shell
    qm set 150 --tablet 1
    ```
-   Запустите виртуальную машину и установите систему.


## <span class="section-num">3</span> Настройка после установки {#настройка-после-установки}


### <span class="section-num">3.1</span> Повышение комфорта работы {#повышение-комфорта-работы}

-   Обновите список програм:
    ```shell
    apt update
    ```
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
-   Установите qemu-guest-agent:
    ```shell
    apt -y install qemu-guest-agent
    ```
-   Запустите qemu-guest-agent:
    ```shell
    systemctl enable --now qemu-guest-agent
    ```


### <span class="section-num">3.2</span> Скрипты для тьюнинга (см. [Proxmox. Вспомогательные скрипты]({{< relref "2024-06-04-proxmox-helper-scripts" >}})) {#скрипты-для-тьюнинга--см-dot-proxmox-dot-вспомогательные-скрипты--dot-dot-notes-public-20240604133400-proxmox-вспомогательные-скрипты-dot-md}

-   Proxmox Backup Server Post Install
    ```shell
    bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/post-pbs-install.sh)"
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


## <span class="section-num">4</span> Подключение {#подключение}


### <span class="section-num">4.1</span> Веб-интерфейс {#веб-интерфейс}

-   PBS предлагает интегрированный веб-интерфейс для управления сервером.
-   Веб-интерфейс PBS доступен по адресу <https://<ip-адрес|имя>:8007>.
-   Потребуется пройти аутентификацию (логин по умолчанию: root, пароль указывается в процессе установки).


## <span class="section-num">5</span> Хранилище {#хранилище}


### <span class="section-num">5.1</span> Хранилище данных {#хранилище-данных}

-   Хранилище данных --- это место, где хранятся резервные копии.
-   Текущая реализация PBS использует каталог внутри стандартной файловой системы (ext4, xfs или zfs) для хранения данных резервного копирования.
-   Информация о конфигурации для хранилищ данных хранится в файле `/etc/proxmox-backup/datastore.cfg`.
-   Необходимо настроить как минимум одно хранилище данных.


#### <span class="section-num">5.1.1</span> Добавление диска {#добавление-диска}

-   Если установка выполнялась как виртуальная машина, добавим диск в Proxmox VE:
    ```shell
    pvesm alloc local-lvm 150 vm-150-disk-1 2000G
    ```
-   Подключим диск:
    ```shell
    qm set 150 --virtio1 local-lvm:vm-150-disk-1
    ```


#### <span class="section-num">5.1.2</span> Создание хранилища данных {#создание-хранилища-данных}

-   Увидеть диски, подключенные к системе, можно в веб-интерфейсе «Управление» → «Хранилище/Диски».
-   Просмотр списка дисков в командной строке:
    ```shell
    proxmox-backup-manager disk list
    ```
-   Для создания хранилища в веб-интерфейсе, необходимо нажать кнопку «Добавить хранилище данных» в боковом меню в разделе «Хранилище данных». В открывшемся окне необходимо указать:
    -   «Имя» — название хранилища данных;
    -   «Путь к каталогу хранилища» — путь к каталогу, в котором будет создано хранилище данных;
    -   «Расписание сборщика мусора» — частота, с которой запускается сборка мусора;
    -   «Расписание удаления» — частота, с которой происходит удаление ранее созданных резервных копий;
    -   «Параметры удаления» — количество резервных копий, которые необходимо хранить.

-   Создадим хранилище:
    ```bash
    proxmox-backup-manager disk fs create store1 --disk vdb --filesystem ext4 --add-datastore true
    ```
-   Хранилище данных будет создано по адресу `/mnt/datastore/store1`.

-   После создания хранилища данных по умолчанию появляется следующая структура каталогов:
    ```shell
    # ls -arilh /mnt/datastore/store1
    итого 1,1M
    665243 -rw-r--r-- 1 backup backup    0 мар 31 14:05 .lock
    665242 drwxr-x--- 1 backup backup 1,1M мар 31 14:05 .chunks
    665240 drwxr-xr-x 3 root   root   4,0K мар 31 13:56 ..
    665241 drwxr-xr-x 3 backup backup 4,0K мар 31 14:05
    ```

    -   `.lock` --- пустой файл, используемый для блокировки процесса;
    -   каталог `.chunks` содержит подкаталоги, с именами от 0000 до ffff. В этих каталогах будут храниться фрагментированные данные, после выполнения операции резервного копирования.


#### <span class="section-num">5.1.3</span> Управление хранилищами данных {#управление-хранилищами-данных}

-   Вывести список существующих хранилищ данных:
    ```shell
    proxmox-backup-manager datastore list
    ```
-   Изменить расписание сборки мусора и вывести свойства хранилища данных:
    ```shell
    proxmox-backup-manager datastore update store2 --gc-schedule 'Tue 04:27'
    ```
-   Просмотреть информацию:
    ```shell
    proxmox-backup-manager datastore show store1
    ```
-   Удалить хранилище данных:
    ```shell
    proxmox-backup-manager datastore remove store1
    ```
-   Данная команда удалит только конфигурацию хранилища данных, данные из базового каталога удалены не будут.
