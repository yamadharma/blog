---
title: "Linux. Установка Proxmox VE"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-04T11:23:00+03:00
lastmod: 2024-06-16T20:07:00+03:00
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


### <span class="section-num">2.3</span> После установки {#после-установки}

-   Здесь даны общие шаги для большей части серверов.


#### <span class="section-num">2.3.1</span> Обновления {#обновления}

-   Обновить все пакеты
    ```shell
    dnf -y update
    ```


#### <span class="section-num">2.3.2</span> Установка локализации {#установка-локализации}

-   Проверьте текущую локализацию:
    ```shell
    localectl status
    ```
-   Посмотрите доступные локализации:
    ```shell
    localectl list-locales
    ```
-   Если нет необходимой, установите её:
    ```shell
    dnf -y install glibc-langpack-ru
    ```
-   Установите нужную локализацию:
    ```shell
    localectl set-locale ru_RU.UTF-8
    ```
-   Проверьте текущую локализацию:
    ```shell
    localectl status
    ```


#### <span class="section-num">2.3.3</span> Дополнительные репозитории {#дополнительные-репозитории}

-   Установим _EPEL_:
    ```shell
    dnf config-manager --set-enabled crb
    dnf -y install epel-release
    ```


#### <span class="section-num">2.3.4</span> Установка часового пояса {#установка-часового-пояса}

-   Просмотрите список всех часовых поясов:
    ```shell
    timedatectl list-timezones
    ```
-   Установите часовой пояс (например, UTC):
    ```shell
    timedatectl set-timezone Etc/UTC
    ```


#### <span class="section-num">2.3.5</span> Синхронизация времени {#синхронизация-времени}

-   Запустите демон:
    ```shell
    systemctl enable --now chronyd
    ```
-   Проверьте работу демона `chronyd`:
    ```shell
    chronyc -a tracking
    ```
-   Включите сетевую синхронизацию времени:
    ```shell
    timedatectl set-ntp true
    ```
-   Проверьте, работает ли он:
    ```shell
    timedatectl status
    ```


#### <span class="section-num">2.3.6</span> Разрешение имён {#разрешение-имён}

<!--list-separator-->

1.  systemd-resolved

    -   Можно установить кеширующий локальный name-server `systemd-resolved`:
        ```shell
        dnf -y install systemd-resolved
        ```
    -   Файл настройки: `/etc/systemd/resolved.conf`.
    -   Можно в нём ничего не менять.
    -   Запустим службу:
        ```shell
        systemctl enable --now systemd-resolved.service
        ```
    -   Установите резольвер:
        ```shell
        ln -snf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
        ```
    -   Проверить работу можно командой:
        ```shell
        resolvectl
        ```


#### <span class="section-num">2.3.7</span> Повышение комфорта работы {#повышение-комфорта-работы}

-   Программы для удобства работы в консоли:
    ```shell
    dnf -y install tmux mc
    ```
-   Программы мониторинга:
    ```shell
    dnf -y install htop lsof
    ```
-   Утилита для ssh:
    ```shell
    dnf -y install mosh
    ```
-   Удобство работы с bash:
    ```shell
    dnf -y install bash-completion bash-color-prompt
    ```
-   Разные утилиты:
    ```shell
    dnf -y install wget tar zstd p7zip
    ```


#### <span class="section-num">2.3.8</span> Отключение графического интерфейса {#отключение-графического-интерфейса}

-   Посмотрите, в каком режиме загружается сервер:
    ```shell
    systemctl get-default
    ```
-   Если результатом является `graphical.target`, то отключите загрузку графического интерфейса.
-   Переключите на загрузку в терминальном многопользовательском режиме:
    ```shell
    systemctl set-default multi-user.target
    ```


#### <span class="section-num">2.3.9</span> Безопасность {#безопасность}

<!--list-separator-->

1.  Fail2ban

    -   Защита от атак:
        ```shell
        dnf -y install fail2ban
        ```

    -   Следует сконфигурировать (см. [fail2ban. Основные настройки]({{< relref "2023-10-30-fail2ban-basic-settings" >}})) и запустить:
        ```shell
        systemctl enable --now fail2ban.service
        ```
    -   Проверьте работу:
        ```shell
        tail -f /var/log/fail2ban.log
        ```


#### <span class="section-num">2.3.10</span> Администрирование {#администрирование}

<!--list-separator-->

1.  Автоматическое обновление

    -   При необходимости можно использовать автоматическое обновление (см. [Автообновление систем на базе деривативов RedHat]({{< relref "2022-09-25-redhat-based-systems-auto-update" >}})).
    -   Установка программного обеспечения:
        ```shell
        dnf -y install dnf-automatic
        ```
    -   Задаёте необходимую конфигурацию в файле `/etc/dnf/automatic.conf`.
    -   Запустите таймер:
        ```shell
        systemctl enable --now dnf-automatic.timer
        ```


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

-   Proxmox VE CPU Scaling Governor
    ```shell
    bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/scaling-governor.sh)"
    ```
