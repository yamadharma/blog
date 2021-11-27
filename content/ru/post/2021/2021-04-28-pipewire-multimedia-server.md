---
title: "Мультимедиа сервер PipeWire"
author: ["Dmitry S. Kulyabov"]
date: 2021-04-28T16:28:00+03:00
lastmod: 2021-11-25T16:50:00+03:00
tags: ["gentoo", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "pipewire-multimedia-server"
---

PipeWire - это новый аудио и видео сервер. В основном для Wayland. Должен заменить другие видео-серверы.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий проекта: <https://gitlab.freedesktop.org/pipewire/pipewire>
-   Wiki проекта: <https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/home>


## <span class="section-num">2</span> Установка {#установка}

-   Gentoo
    Установить само приложение:

    ```shell
    emerge media-video/pipewire
    emerge media-video/wireplumber
    ```


## <span class="section-num">3</span> Настройка пользовательской сессии {#настройка-пользовательской-сессии}

-   По умолчанию _PipeWire_ настроен на использование systemd.
-   Следует настроить его запуск для пользователя.
-   Флаг `--now` позволяет одновременно активировать и запускать сервис.
-   Для каждого пользователя можно установить активацию по обращению к сокету:

    ```shell
    systemctl --user enable --now pipewire.socket
    ```

    или запустить сразу необходимый процесс:

    ```shell
    systemctl --user enable --now pipewire.service
    ```
-   Кроме того, необходимо запустить демон сессии:

    ```shell
    systemctl --user enable --now pipewire-media-session.service
    ```
-   Начиная с версии PipeWire 0.3.39 необходимо запускать ещё и _wireplumber_:

    ```shell
    systemctl --user enable --now wireplumber.service
    ```


## <span class="section-num">4</span> Использование с другими серверами {#использование-с-другими-серверами}


### <span class="section-num">4.1</span> Замена PulseAudio {#замена-pulseaudio}

-   Если _PulseAudio_ настроено с поддержкой запуска как демона[^fn:1], то его необходимо отключить:
    -   запретить запуск `pulseaudio`;
    -   отключить запуск в файле конфигурации:
        -   отредактируйте файл `/etc/pulse/daemon.conf` и замените `daemonize` на `daemonize = no`.
-   Одновременно отключим _PulseAudio_ и включим _PipeWire_ для каждого пользователя:

    ```shell
    systemctl --user disable --now pulseaudio.socket pulseaudio.service
    systemctl --user enable --now pipewire.socket pipewire-pulse.socket wireplumber.service
    ```
-   Можно замаскировать PulseAudio (но он всё равно может стартовать автоматически):

    ```shell
    systemctl --user mask pulseaudio.socket pulseaudio.service
    ```
-   Кроме того, рекомендуется удалить файлы, оставшиеся от PulseAudio:

    ```shell
    rm -r ~/.config/pulse/
    ```


### <span class="section-num">4.2</span> Замена Jack {#замена-jack}

-   Для маршрутизации клиентов Jack через PipeWire в настоящее время
    предпочтительно запускать их через `pw-jack`, который использует
    `LD_PRELOAD` для использования библиотек PipeWire вместо Jack, например:

    ```shell
    pw-jack <application>
    ```
-   Можно задать собственный размер буфера, установив размер\_буфера/частота\_дискретизации:

    ```shell
    PIPEWIRE_LATENCY="128/48000" pw-jack <application>
    ```


## <span class="section-num">5</span> Проверка работы {#проверка-работы}

-   Для _PipeWire_ возможно посмотреть информацию по серверу `pipewire`:

    ```shell
    pactl info
    ```

    -   В результате должна присутствовать строчка типа такой:

        ```shell
        Server Name: PulseAudio (on PipeWire 0.3.40)
        ```


## <span class="section-num">6</span> Конфигурация {#конфигурация}


### <span class="section-num">6.1</span> Конфигурационные файлы {#конфигурационные-файлы}

-   Конфигурация, идущая в комплекте с дистрибутивом, находится в `/usr/share/pipewire`.
-   Для изменения параметров скопируйте файлы конфигурации в:
    -   `/etc/pipewire`: уровень системы;
    -   `~/.config/pipewire`: уровень пользователя.


### <span class="section-num">6.2</span> Профили устройств {#профили-устройств}

-   Профили устройств хранятся в каталоге `~/.local/state/pipewire/media-session.d/`.
-   При запуске в первый раз с подключёнными внешними устройствами (например, usb-устройствами), профили для них не создаются. Необходимо их переподключить в этом случае.


### <span class="section-num">6.3</span> Изменение частоты дискретизации {#изменение-частоты-дискретизации}

-   По умолчанию _PipeWire_ глобально устанавливает частоту дискретизации равную 48 КГц.
-   Для изменения нужно отредактировать строку `default.clock.rate = 48000` в файле конфигурации `/etc/pipewire/pipewire.conf` или `~/.config/pipewire/pipewire.conf`.
-   Например, если вы хотите частоту дискретизации в 192 КГц, раскомментируйте строку и поменяйте её на `default.clock.rate = 192000`.

[^fn:1]: В Gentoo это означает, что `pulseaudio` скомпилирован с флагом `daemon`.
