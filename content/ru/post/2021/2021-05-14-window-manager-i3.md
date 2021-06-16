---
title: "Window manager i3"
date: 2021-05-14T11:32:00+03:00
lastmod: 2021-06-16T20:27:00+03:00
tags: ["sysadmin", "gentoo"]
categories: ["computer-science"]
draft: false
slug: "window-manager-i3"
---

Менеджер окон _i3_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Тайловый менеджер окон.
-   <https://i3wm.org/>


## <span class="section-num">2</span> Навигация {#навигация}


### <span class="section-num">2.1</span> Basics {#basics}

-   `Mod` + Enter	open new terminal
-   `Mod` + j	focus left
-   `Mod` + k	focus down
-   `Mod` + l	focus up
-   `Mod` + ;	focus right
-   `Mod` + a	focus parent
-   `Mod` + Space	toggle focus mode


### <span class="section-num">2.2</span> Moving windows {#moving-windows}

-   `Mod` + Shift + j	move window left
-   `Mod` + Shift + k	move window down
-   `Mod` + Shift + l	move window up
-   `Mod` + Shift + ;	move window right


### <span class="section-num">2.3</span> Modifying windows {#modifying-windows}

-   `Mod` + f	toggle fullscreen
-   `Mod` + v	split a window vertically
-   `Mod` + h	split a window horizontally
-   `Mod` + r	resize mode


### <span class="section-num">2.4</span> Changing the container layout {#changing-the-container-layout}

-   `Mod` + e	default
-   `Mod` + s	stacking
-   `Mod` + w	tabbed


### <span class="section-num">2.5</span> Floating {#floating}

-   `Mod` + Shift + Space	toggle floating
-   `Mod` + Left click	drag floating


### <span class="section-num">2.6</span> Using workspaces {#using-workspaces}

-   `Mod` + 0-9	switch to another workspace
-   `Mod` + Shift + 0-9	move a window to another workspace


### <span class="section-num">2.7</span> Opening applications / Closing windows {#opening-applications-closing-windows}

-   `Mod` + d	open application launcher (dmenu)
-   `Mod` + Shift + q	kill a window


### <span class="section-num">2.8</span> Выход/Перезапуск {#выход-перезапуск}

-   `Mod` + `Shift` + `c`: перечитать конфигурационный файл.

    ```conf-unix
    ## ~/.config/i3/config

    ## reload the configuration file
    bindsym $mod+Shift+c reload
    ```
-   `Mod` + `Shift` + `r`: перестартовать _i3_, сохранив сессию.

    ```conf-unix
    ## ~/.config/i3/config

    ## restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
    bindsym $mod+Shift+r restart
    ```
-   `Mod` + `Shift` + `e`: выход из _i3_.

    ```conf-unix
    ## ~/.config/i3/config

    ## exit i3 (logs you out of your X session)
    bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
    ```


## <span class="section-num">3</span> Настройка {#настройка}


### <span class="section-num">3.1</span> Строка статуса {#строка-статуса}


#### <span class="section-num">3.1.1</span> i3bar {#i3bar}

-   Отрисовку панели осуществляет утилита `i3bar`.
-   Отображается вверху или внизу экрана.
-   Содержит:
    -   область с кнопками переключения рабочих областей _i3_;
    -   системную строку, генерируемую при помощи `i3status` или аналогов;
    -   системный трей с иконками программ.
-   В конфигурационном файле задаётся следующим образом (<https://i3wm.org/docs/userguide.html#%5Fconfiguring%5Fi3bar>):

    ```conf-unix
    # ~/.config/i3/config -*- mode: conf-unix; -*-
    ## Start i3bar to display a workspace bar
    bar {
        status_command	i3status
        position		top
    }
    ```

<!--list-separator-->

1.  Поддержка иконок в i3bar

    -   В `i3bar` можно использовать шрифты иконок (см. [Моноширинные шрифты]({{< relref "2021-05-21-monospace-fonts" >}})).
    -   Наиболее распространённым является шрифт [Font Awesome](https://fontawesome.com/).
    -   Установка:
        -   Gentoo

            ```shell
            emerge media-fonts/fontawesome
            ```
    -   Для вставки шрифта в файл можно использовать список кодов для иконок <https://fontawesome.com/cheatsheet>.
    -   Шрифт лучше явно обозначить в конфигурации:

        ```conf-unix
        ## ~/.config/i3/config
        bar {
            …
            font pango:Source Sans Pro, FontAwesome 5 Free 10
            …
        }
        ```
    -   Для набора символа по его коду следует использовать конфигурации клавиш. Например, для набора символа с кодом `0xf004`, требуется набрать:
        -   приложения на основе GTK: `Ctrl` + `Shift` + `u`, `f004`, `Enter`;
        -   emacs: `Ctrl` + `x`, `8`, `Enter`, `f004`, `Enter`;
        -   vim: `Ctrl` + `v`, `uf004`;
        -   urxvt: удерживая `Ctrl` + `Shift`, наберите `f004`.

<!--list-separator-->

2.  i3status

    -   Использовано <https://igancev.ru/2020-05-11-configuring-i3status-in-i3wm>.
    -   `i3status` генерирует строку состояния для `i3bar`.
    -   Содержит встроенные модули:
        -   IPv6 --- получает и выводит IPv6 адрес.
        -   Disk --- отображает информацию о занятом и свободном месте в файловой системе.
        -   Run-watch --- мониторинг определённого процесса в системе.
        -   Path-exists --- проверяет на существование путь в файловой системе.
        -   Wireless --- позволяет выводить подключения к WIFI сети, уровень сигнала, имя точки доступа.
        -   Ethernet --- предоставляет IP адрес и скорость соединения сетевого интерфейса.
        -   Battery --- показ уровня заряда батареи.
        -   CPU-Temperature --- показ температуры процессора.
        -   CPU Usage --- использование процессора в процентах.
        -   Memory --- использование оперативной памяти.
        -   Load --- среднее значение загрузки системы за 1, 5 и 15 минут (Load Overage).
        -   Time --- время в текущей временной зоне.
        -   TzTime --- время в заданной временной зоне.
        -   DDate --- дата.
        -   Volume --- управление громкостью звука.
        -   File Contents --- вывод содержимого указанного файла.
    -   Модули в строке можно переиспользовать по нескольку раз, управляя порядком вывода.
    -   Конфигурацию условно можно разделить на 3 части:
        -   блок `general` --- содержит общие параметры;
        -   переменная `order` --- в неё записывается порядок вывода интересующих модулей;
        -   блоки конфигурации модулей --- непосредственно настройки самих блоков с метриками.
    -   В конфигурации i3bar задаётся конфигурационный файл для i3status:

        ```conf-unix
        # ~/.config/i3/config -*- mode: conf-unix; -*-
        ## Start i3bar to display a workspace bar
        bar {
            font pango:Source Sans Pro, FontAwesome 5 Free 10
            status_command	i3status --config ~/.config/i3/i3status/config
            position		top
        }
        ```
    -   Структура информационной панели задаётся в конфигурационном файле:

        ```conf-unix
        ### -*- mode: conf-unix; -*-
        ## ~/.config/i3/i3status/config

        general {
            colors = true # включение/выключение поддержки цветов true/false
            interval = 1 # интервал обновления строки статуса, в секундах
            output_format = "i3bar" # формат вывода, устанавливаем i3bar (JSON)
        }

        # порядок вывода модулей
        order += "run_watch openvpn"
        order += "run_watch openconnect"
        order += "volume master"
        order += "wireless _first_"
        order += "battery all"
        order += "disk /"
        order += "memory"
        order += "cpu_usage"
        order += "cpu_temperature 0"
        order += "tztime local"

        # отслеживание процесса openvpn
        # служит как индикатор работы openvpn клиента
        # при запуске openvpn необходимо
        # указывать параметр --writepid /var/run/openvpn.pid
        run_watch openvpn {
            pidfile = "/var/run/openvpn.pid"
            format = " openvpn"
            # если пареметр format_down оставить пустым,
            # то при неактивном процессе блок будет отсутствовать
            format_down=""
        }

        # аналогичный блок индикатор openconnect vpn клиента
        # требуется запуск клиента с параметром --pid-file=/var/run/openconnect.pid
        run_watch openconnect {
            pidfile = "/var/run/openconnect.pid"
            format = " openconnect vpn"
            format_down=""
        }

        # управление громкостью звука
        volume master {
            format = " %volume" # шаблон громкости в активном состоянии
            format_muted = " %volume" # шаблон громкости в состоянии muted (без звука)
            device = "default"
            mixer = "Master"
            mixer_idx = 0
        }

        # индикатор WIFI
        wireless _first_ {
            # шаблон вывода, можно дополнить
            # наименованием подключения %essid
            # и ip адресом %ip
            format_up = "%quality %frequency"
            format_down = ""
        }

        # состояние заряда батареи
        battery all {
            # шаблон вывода, можно дополнить
            # оставшимся временем работы %emptytime
            # энергопотреблением %consumption в ваттах
            format = "%status %percentage"

            # true - показ процента заряда от 0 до 100
            # false - показ процента заряда от 0 до n, с учетом
            # изношенности аккумулятора
            last_full_capacity = true
            format_down = ""
            status_chr = "" # статус подзарядки
            status_bat = "" # статус в режиме работы от батареи
            status_unk = "? UNK" # неизвестный статус
            status_full = "" # статус полного заряда
            path = "/sys/class/power_supply/BAT%d/uevent"

            # нижний порог заряда, после которого блок
            # будет окрашен в "color_bad" (по умолчанию красный)
            # подробнее в man i3status
            low_threshold = 10
        }

        # отслеживаемый накопитель
        disk "/" {
            # доступные переменные:
            # %used, %percentage_used - занятое пространство
            # %free, %percentage_free - свободное пространство
            # %avail, %percentage_avail - доступное пространство
            # %total - всего
            format = " %avail"

            # будет окрашен в "color_bad" (по умолчанию красный)
            # при достижении нижнего порога менее 10GB доступного пространства
            low_threshold = "10"
            threshold_type = "gbytes_avail"
            format_below_threshold = " Warning: %avail"
        }

        # миниторинг оперативной памяти
        memory {
            # доступные переменные:
            # %total, percentage_total
            # %used, percentage_used
            # %free, percentage_free
            # %available, percentage_available
            # %shared, percentage_shared
            format = " %used"

            # порог, при котором вывод окрасится в
            # желтый (degraded) или красный (critical)
            # а формат вывода изменится на format_degraded
            threshold_degraded = "1G"
            threshold_critical = "200M"
            format_degraded = "MEMORY < %available"
        }

        # температура процессора
        cpu_temperature 0 {
            format = " %degrees"

            # верхний порог температуры, при достижении которого
            # вывод окрасится красным,
            # и формат изменится на format_above_threshold
            max_threshold = "80"
            format_above_threshold = " %degrees"
            path = "/sys/class/thermal/thermal_zone0/temp"
        }

        # использование центрального процессора
        cpu_usage {
            # %usage - процентное использование ЦП
            # %cpu<N> - начиная с %cpu0 и далее показывает использование ядер
            format = " %usage"

            # доступны параметры:
            # degraded_threshold, окрас в желтый, по умолчанию 90
            # max_threshold, окрас в красный, по умолчанию 95
            # и кастомные форматы для них
            # format_above_degraded_threshold и format_above_threshold
        }

        # вывод даты и времени по заданному формату
        tztime local {
            format = " %d %b %Y  %H:%M:%S"
        }
        ```


#### <span class="section-num">3.1.2</span> polybar {#polybar}

-   Отдельное приложение для строки статуса.
-   Применяется для замены _i3bar_.
-   <https://polybar.github.io/>
-   <https://github.com/polybar/polybar>
-   Темы для _polybar_: <https://github.com/adi1090x/polybar-themes>
-   Одним из побудительных мотивов установки _polybar_ может быть то, что здесь можно без проблем настроить индикатор раскладки клавиатуры.
-   Установка
    -   Gentoo:

        ```shell
        USE="i3wm" emerge x11-misc/polybar
        ```
-   Конфигурационный файл:
    -   стандартное расположение:  `~/.config/polybar/config` (`$XDG_CONFIG_HOME/polybar/config`);
    -   использую для локальных настроек только для _i3_: `~/.config/i3/polybar/config`.

<!--list-separator-->

1.  Скрипт запуска

    -   Создадим скрипт запуска `polybar`.

        ```shell
        #!/bin/bash
        # ~/.config/i3/polybar/launch.sh

        # Terminate already running bar instances
        killall -q polybar
        # If all your bars have ipc enabled, you can also use
        # polybar-msg cmd quit

        # Wait until the processes have been shut down
        while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

        # Launch Polybar, using config location ~/.config/i3/polybar/config
        polybar --config=~/.config/i3/polybar/config i3 &

        echo "Polybar launched..."
        ```
    -   Установим права на исполнение:

        ```shell
        chmod +x ~/.config/i3/polybar/launch.sh
        ```
    -   Добавим вызов `polybar` в файл конфигурации _i3_. Конфигурацию для _i3bar_ следует закомментировать.

        ```conf-unix
        ## ~/.config/i3/config

        ## Start i3bar to display a workspace bar
        # bar {
        #     font pango:Source Sans Pro, FontAwesome 5 Free 10
        #     status_command	i3status --config ~/.config/i3/i3status/config
        #     position		top
        # }

        ## Start polybar
        exec_always --no-startup-id ~/.config/i3/polybar/launch.sh
        ```


### <span class="section-num">3.2</span> Строка состояний {#строка-состояний}

-   По умолчанию используется `dmenu`.
-   Можно заменить на `rofi`.


#### <span class="section-num">3.2.1</span> rofi {#rofi}

-   Используется для запуска приложений, переключения окон.
-   <https://github.com/davatorium/rofi>
-   Конфигурация по умолчанию находится в `~/.config/rofi/config`.
-   Для выбора темы можно использовать команду:

    ```shell
    rofi-theme-selector
    ```
-   Для запуска программ используется несколько мод:
    -   `run`: запускать приложения из пути (`$PATH`) с возможностью запуска в терминале.
    -   `drun`: запускать приложения на основе desctop-файлов (по стандарту XDG).
    -   `window`: переключение между окнами в оконном менеджере, совместимом со спецификацией EWMH.
    -   `ssh`: подключение к удаленному хосту через `ssh`.
    -   `file-browser`: базовый файловый броузер для открытия файлов.
    -   `keys`: список внутренних привязок клавиш.
    -   `script`: использование простых скриптов.
    -   `combi`: объединяет несколько мод в одну.
-   Использование запятых в файле настроек _i3_ может привести к проблемам. Лучше использовать файл настроек _rofi_ или замените запятые символом `#`, например, заменить строку

    ```conf-unix
    rofi -combi-modi window,drun,ssh
    ```

    на

    ```conf-unix
    rofi -combi-modi window#drun#ssh
    ```
-   Возможная конфигурация в командной строке команды `rofi`:

    ```conf-unix
    ## ~/.config/i3/config
    set $menu rofi -combi-modi window#drun -show combi -modi combi -show-icons
    ```
-   Конфигурация с помощью конфигурационного файла (поместим его в `~/.config/i3/rofi/config`).


## <span class="section-num">4</span> Приложения {#приложения}


### <span class="section-num">4.1</span> Снимки экрана {#снимки-экрана}

-   Для скриншотов можно использовать [scrot](https://github.com/resurrecting-open-source-projects/scrot).
    -   Gentoo

        ```shell
        emerge media-gfx/scrot
        ```
-   Добавим в конфигурационный файл:

    ```conf-unix
    ### Screenshots
    bindsym --release Print exec --no-startup-id scrot -e 'mv $f `xdg-user-dir PICTURES` 2>/dev/null'
    bindsym --release Shift+Print exec --no-startup-id scrot -s -e 'mv $f `xdg-user-dir PICTURES` 2>/dev/null'
    ```

    -   По клавише `PtrScr` делается скриншот.
    -   По клавише `Shift` + `PtrScr` предлагается выделить область экрана, скриншот которой следует сделать.
    -   Скриншоты переносятся в каталог $XDG\_PICTURES\_DIR (обычно `~/Изображения`).
