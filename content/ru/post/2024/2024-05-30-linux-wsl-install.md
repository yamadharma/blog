---
title: "Установка Linux в WSL"
author: ["Dmitry S. Kulyabov"]
date: 2024-05-30T16:16:00+03:00
lastmod: 2024-05-31T14:23:00+03:00
tags: ["windows", "linux", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "linux-wsl-install"
---

Установка Linux в WSL.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}


### <span class="section-num">1.1</span> Ссылки {#ссылки}


#### <span class="section-num">1.1.1</span> Документация {#документация}

-   <https://learn.microsoft.com/ru-ru/windows/wsl/install>
-   <https://learn.microsoft.com/ru-ru/windows/wsl/setup/environment>
-   <https://learn.microsoft.com/en-us/windows/wsl/systemd>
-   <https://learn.microsoft.com/en-us/windows/wsl/wsl-config>
-   <https://github.com/mikeroyal/WSL-Guide>


## <span class="section-num">2</span> Установка дистрибутивов {#установка-дистрибутивов}


### <span class="section-num">2.1</span> WSL + Ubuntu {#wsl-plus-ubuntu}

-   Установите wsl:
    ```shell
    wsl --install
    ```

    -   включает дополнительные компоненты WSL и платформы виртуальных машин;
    -   скачивает и устанавливает последнюю версию ядра Linux;
    -   задаёт WSL 2 в качестве среды по умолчанию;
    -   скачивает и устанавливает дистрибутив Ubuntu Linux.
-   Во время установки потребуется перезапустить компьютер.


### <span class="section-num">2.2</span> Fedora {#fedora}

-   Репозиторий: <https://github.com/VSWSL/Fedora-WSL>
-   Misrosoft Store: <https://www.microsoft.com/store/apps/9NPCP8DRCHSN>
-   Установите из Misrosoft Store.
-   Во время установки потребуется перезапустить компьютер.


### <span class="section-num">2.3</span> Arch {#arch}

-   Репозиторий: <https://github.com/VSWSL/Arch-WSL>
-   Misrosoft Store: <https://www.microsoft.com/store/apps/9MZNMNKSM73X>
-   Установите из Misrosoft Store.
-   Во время установки потребуется перезапустить компьютер.


## <span class="section-num">3</span> Первичная настройка {#первичная-настройка}

-   После завершения установки будет предложено создать имя пользователя и пароль для дистрибутива Linux.
-   Для каждого дистрибутива Linux используются свои имя пользователя и пароль, и они не связаны с именем пользователя Windows.


## <span class="section-num">4</span> Поддержка systemd {#поддержка-systemd}

-   Убедитесь, что версия WSL: 0.67.6 или более поздняя:
    ```shell
    wsl --version
    ```
-   В консоли Linux перейдите под суперпользователя:
    ```shell
    sudo -i
    ```
-   Откройте для редактирования файл `/etc/wsl.conf`:
    ```shell
    vi /etc/wsl.conf
    ```
-   Активируйте systemd:
    ```toml
    [boot]
    systemd=true
    ```
-   Из консоли Windows остановите выполнение WSL:
    ```shell
    wsl.exe --shutdown
    ```
-   После повторного запуска WSL проверьте работу systemd:
    ```shell
    systemctl list-unit-files --type=service
    ```


## <span class="section-num">5</span> Установка базового программного обеспечения {#установка-базового-программного-обеспечения}

-   В консоли Linux перейдите под суперпользователя:
    ```shell
    sudo -i
    ```


### <span class="section-num">5.1</span> Fedora {#fedora}

-   Обновите систему:
    ```shell
    dnf -y update
    ```
-   Установка системных библиотек:
    ```shell
    dnf -y install vulkan
    ```
-   Устанавливаем утилиту для удобства работы _tmux_:
    ```shell
    dnf -y install tmux
    ```
-   Устанавливаем утилиту для удобства работы _mc_:
    ```shell
    dnf -y install mc
    ```
-   Автодополнение для bash:
    ```shell
    dnf -y install bash-completion
    ```
-   Просмотр pdf:
    ```shell
    dnf -y install evince
    ```
-   Терминал kitty:
    ```shell
    dnf -y install kitty
    ```
-   Установите libreoffice:
    ```shell
    dnf -y install libreoffice
    ```


### <span class="section-num">5.2</span> Arch {#arch}

-   Используется пакетный менеджер _pacman_ (<https://wiki.archlinux.org/title/Pacman_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)>).
-   Обновите систему:
    ```shell
    pacman -Suy
    ```
-   Устанавливаем утилиту для удобства работы _tmux_:
    ```shell
    pacman -S tmux
    ```
-   Устанавливаем утилиту для удобства работы _mc_:
    ```shell
    pacman -S mc
    ```
-   Автодополнение для bash:
    ```shell
    pacman -S bash-completion
    ```
-   Просмотр pdf:
    ```shell
    pacman -S evince
    ```
-   Терминал kitty:
    ```shell
    pacman -S kitty
    ```
-   Установите libreoffice:
    ```shell
    pacman -S libreoffice-fresh
    ```


## <span class="section-num">6</span> Emacs {#emacs}


### <span class="section-num">6.1</span> Fedora {#fedora}

-   Установите emacs:
    ```shell
    dnf -y install emacs
    ```


### <span class="section-num">6.2</span> Arch {#arch}

-   Установите emacs:
    ```shell
    pacman -S emacs
    ```
