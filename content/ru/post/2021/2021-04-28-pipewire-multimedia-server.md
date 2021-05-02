---
title: "Мультимедиа сервер PipeWire"
date: 2021-04-28T16:28:00+03:00
lastmod: 2021-04-28T18:46:00+03:00
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
    emerge --ask media-video/pipewire
    ```


## <span class="section-num">3</span> Настройка пользовательской сессии {#настройка-пользовательской-сессии}

-   По умолчанию pipewire настроен на использование systemd.
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


## <span class="section-num">4</span> Использование с другими серверами {#использование-с-другими-серверами}


### <span class="section-num">4.1</span> Замена PulseAudio {#замена-pulseaudio}

-   Одновременно отключим PelseAudio и включим PipeWire для каждого пользователя:

    ```shell
    systemctl --user disable pulseaudio.socket pulseaudio.service
    systemctl --user enable pipewire.socket pipewire-pulse.socket
    ```
-   Можно замаскировать PulseAudio, чтобы он не стартовал автоматически:

    ```shell
    systemctl --user mask pulseaudio.socket pulseaudio.service
    ```
-   Кроме того, можно удалить файлы, оставшиеся от PulseAudio:

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


## <span class="section-num">5</span> Backlinks {#backlinks}

-   [Системное администрирование]({{< relref "2021-04-10-system-administration" >}})
