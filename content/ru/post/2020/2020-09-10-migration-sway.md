---
title: "Переход на Sway"
author: ["Dmitry S. Kulyabov"]
date: 2020-09-10T10:33:15+03:00
lastmod: 2023-06-21T18:40:00+03:00
tags: ["gentoo", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "migration-sway"
project: ["misc-utils"]
---

Решил попробовать [Wayland](https://wayland.freedesktop.org/). По этой причине пришлось [перейти](http://way-cooler.org/blog/2020/01/09/way-cooler-post-mortem.html) с [awesome](https://awesomewm.org/) на [swlay](https://swaywm.org/).

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   <https://swaywm.org/>
-   Создавался для замены i3 (см. [Window manager i3]({{< relref "2021-05-14-window-manager-i3" >}})) под Wayland.


## <span class="section-num">2</span> Установка `sway` {#установка-sway}

```shell
emerge -v gui-wm/sway
```


### <span class="section-num">2.1</span> Репозитории `gentoo` {#репозитории-gentoo}

Программы для Wayland есть как в основном репозитории, так и
дополнительных. Хочу порекомендовать для просмотра следующие
репозитории:

-   [wayland-desktop](https://github.com/epsilon-0/wayland-desktop)

<!--listend-->

```shell
layman -a wayland-desktop
```

-   [guru](https://wiki.gentoo.org/wiki/Project:GURU)

<!--listend-->

```shell
layman -a guru
```


## <span class="section-num">3</span> Первоначальная конфигурация {#первоначальная-конфигурация}

-   Файл конфигурации ищется в следующем порядке:
    -   `~/.sway/config`;
    -   `$XDG_CONFIG_HOME/sway/config`;
    -   `~/.i3/config`;
    -   `$XDG_CONFIG_HOME/i3/config`;
    -   `/etc/sway/config`;
    -   `/etc/i3/config`.
    -   Переменная окружения `$XDG_CONFIG_HOME` по умолчанию установлена в `~/.config/`.
-   Пакет устанавливает глобальную конфигурацию в `/etc/sway/config`.
-   При желании внести изменение в конфигурацию можно скопировать файл глобальной конфигурации в локальную:
    ```shell
    mkdir -p ~/.config/sway
    cp /etc/sway/config ~/.config/sway/
    ```


## <span class="section-num">4</span> Комбинации клавиш {#комбинации-клавиш}

Основные сочетания клавиш:

-   `Mod` + `Enter` -- открыть новый терминал;
-   `Mod` + `d` -- запустить программу;
-   `Mod` + `0`.. `9` -- переключение между workspace'ами;
-   `Mod` + `Shift` + `0` .. `9` -- перемещение окон в заданный workspace;
-   `Mod` + `Shift` + `q` -- закрыть текущее окно;
-   `Mod` + стрелки -- перемещение между окнами, вместо стрелочек также   могут быть использованы клавиши «J» (влево), «K» (вниз), «L» (вверх) и  «;» (вправо);
-   `Mod` + `Shift` + стрелки -- перемещение окон в пределах workspace'а, вместо стрелок также могут быть использованы буквы и точка с запятой;
-   `Mod` + `v` -- использовать вертикальное разбиение;
-   `Mod` + `h` -- использовать горизонтальное разбиение;
-   `Mod` + `e` -- размещение окон по-умолчанию (default layout);
-   `Mod` + `s` -- стековое размещение (stacking layout);
-   `Mod` + `w` -- размещение с табами (tabbed layout);
-   `Mod` + `f` -- раскрыть окно во весь экран или свернуть его обратно;
-   `Mod` + `Shift` + `Space` -- разрешить свободное перемещение окна (floating mode) или вернуть его в мозаику;
-   `Mod` + `Shift` + `c` -- перечитать конфигурацию `sway` (перестартовать);
-   `Mod` + `Shift` + `e` -- выйти из `sway`.

Кроме того, часть сочетаний клавиш определяется в файлах, определяющих конкретный функционал.


## <span class="section-num">5</span> Замена приложений {#замена-приложений}


### <span class="section-num">5.1</span> Ресурсы по миграции с X Window {#ресурсы-по-миграции-с-x-window}

-   <https://github.com/swaywm/sway/wiki/i3-Migration-Guide>
-   <https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway>
-   <https://wiki.gentoo.org/wiki/List_of_software_for_Wayland>
-   <https://github.com/natpen/awesome-wayland>
-   <https://arewewaylandyet.com/>


### <span class="section-num">5.2</span> Снимки экрана {#снимки-экрана}

Исходно использовался `scrot`.

Для Wayland перешёл на связку [grim](https://github.com/emersion/grim) (получение снимка экрана) + [slurp](https://github.com/emersion/slurp) (выделение области экрана):

```shell
emerge -uv gui-apps/slurp gui-apps/grim
```

Настроим получение снимков экрана:

```conf-unix
# ~/.config/sway/config.d/80-screenshots.conf
# Screenshot active display
bindsym Print exec grim -t png "$(xdg-user-dir PICTURES)"/$(date +%Y-%m-%d_%H-%M-%S).png

# Screenshot current window
bindsym $mod+Print exec grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" "$(xdg-user-dir PICTURES)"/$(date +%Y-%m-%d_%H-%M-%S).png

# Screenshot selected region
bindsym $mod+Shift+Print exec grim -t png -g "$(slurp)" "$(xdg-user-dir PICTURES)"/$(date +%Y-%m-%d_%H-%M-%S).png
```

-   При нажатии клавиши `PrtScr` делается снимок всего экрана.
-   При нажатии `Mod4` + `PrtScr` делается снимок активного окна.
-   При нажатии `Mod4` + `Shift` + `PrtScr` предлагается выбрать область экрана, снимок которой следует сделать.


### <span class="section-num">5.3</span> Видеозапись экрана (скринкаст) {#видеозапись-экрана--скринкаст}

Ранее использовался [SimpleScreenRecorder](https://www.maartenbaert.be/simplescreenrecorder/).


#### <span class="section-num">5.3.1</span> Видеозапись экрана -- командная строка {#видеозапись-экрана-командная-строка}

Для записи из командной строки используем [wf-recorder](https://github.com/ammen99/wf-recorder):

```shell
emerge -v gui-apps/wf-recorder
```

Варианты использования:

-   Запись всего экрана в файл `recording.mkv` (только видео):

<!--listend-->

```shell
wf-recorder -f recording$(date +%Y-%m-%d_%H-%M-%S).mkv
```

Если файл не указывать, запись будет в текущий каталог.

-   Запись фрагмента экрана (тут имя файла задаётся по времени начала
    записи):

<!--listend-->

```shell
wf-recorder -g "$(slurp)" -f $(date +%Y-%m-%d_%H-%M-%S).mkv
```

-   Запись со звуком:

<!--listend-->

```shell
wf-recorder --audio -f $(date +%Y-%m-%d_%H-%M-%S).mkv
```

-   Запись с использование GPU (VAAPI интерфейс):

<!--listend-->

```shell
wf-recorder --audio -f $(date +%Y-%m-%d_%H-%M-%S).mkv -c h264_vaapi -d /dev/dri/renderD128
```


#### <span class="section-num">5.3.2</span> Видеозапись экрана -- графическое приложение {#видеозапись-экрана-графическое-приложение}

Для захвата десктопа в Wayland используется плагин [wlrobs](https://hg.sr.ht/~scoopta/wlrobs).


### <span class="section-num">5.4</span> Строка состояний {#строка-состояний}

Sway поддерживает свою строку состояний `sway-bar`. Удобное и минималистическое приложение. Однако, удручает, что иконки в трее не активны.

Попробуем использовать более продвинутый вариант -- [waybar](https://github.com/Alexays/Waybar)

```shell
emerge -v gui-apps/waybar
```

Конфигурация:

```conf-unix
## sway-bar
# Read `man 5 sway-bar` for more information about this section.

# bar {
#     position top

#     # When the status_command prints a new line to stdout, swaybar updates.
#     # The default just shows the current date and time.
#     status_command while date +'%Y-%m-%d %H:%M:%S'; do sleep 1; done

#     colors {
#         statusline #ffffff
#         background #323232
#         inactive_workspace #32323200 #32323200 #5c5c5c
#     }
# }

## Waybar
# <https://github.com/Alexays/Waybar>

exec_always ~/.config/sway/scripts/waybar.sh

# Waybar Tooltips don't steel focus

no_focus [app_id="waybar"]
for_window [app_id="waybar" floating] {
    move position cursor
    move down 60px # adjust if some menus still don't fit
}
```

Конфигурацию `waybar` поместил в `~/.config/sway/other/waybar`.


### <span class="section-num">5.5</span> Уведомления {#уведомления}

Используется [mako](https://github.com/emersion/mako).

```shell
emerge -v gui-apps/mako
```

Сконфигурировал следующим образом:

```conf-unix
# ~/.config/sway/config.d/80-mako.conf
# Light
exec_always mako --font 'Source Code Pro 10' --background-color '#fdf6e3' --text-color '#657b83' --default-timeout 5000 --width 400 --markup 1 --border-radius 5

# Dark
# exec_always mako --font 'Source Code Pro 10' --background-color '#002b36' --text-color '#839496' --default-timeout 5000 --width 400 --markup 1 --border-radius 5
```


### <span class="section-num">5.6</span> Настройка вывода {#настройка-вывода}

В XWindow используется программа `xrandr` (с её помощью можно изменять параметры вывода изображения RandR). В `sway` можно управлять с помощью `swaymsg output` или с помощью утилиты [wlr-randr](https://github.com/emersion/wlr-randr).

```shell
emerge -v gui-apps/wlr-randr
```


### <span class="section-num">5.7</span> Меню программ (launcher) {#меню-программ--launcher}

Для запуска программы используется `dmenu`. Если не нравится, можно заменить.

-   [wofi](https://hg.sr.ht/~scoopta/wofi) --- аналог `rofi` для Wayland. Попроще, конечно.

<!--listend-->

```shell
emerge -v gui-apps/wofi
```

В отличии от `dmenu` запоминает последние выбранные команды.

Общая конфигурация:

```conf-unix
# ~/.config/sway/config.d/80-launcher.conf

# dmenu

set $menu dmenu_path | dmenu | xargs swaymsg exec --

# wofi
# --show <mode>
# <mode>:
# - `run` - searches $PATH for executables and allows them to be run by selecting them.
# - `drun` - searches $XDG_DATA_HOME/applications and $XDG_DATA_DIRS/applications for desktop files and allows them to be run by selecting them.
# - `dmenu` - reads from stdin and displays options which when selected will be output to stdout.

# set $menu dmenu_path | wofi -c ~/.config/sway/other/wofi/config -s ~/.config/sway/other/wofi/style.css --show dmenu | xargs swaymsg exec --

# rofi

# set $menu rofi -combi-modi window#drun -show combi -modi combi -show-icons
# set $menu rofi -m $(swaymsg -t get_outputs | jq 'map(select(.active) | .focused) | index(true)') -show combi -modi combi -combi-modi window#drun -show-icons -run-command 'swaymsg exec -- {cmd}'

# gmenu

# set $menu gtkmenu --width 500 --height 260 -no-generic
# set $menu nwggrid

# bemenu

# set $menu j4-dmenu-desktop --dmenu="bemenu-run.sh -l 30" --term="alacritty" --no-generic

# Start your launcher

bindsym $mod+d exec $menu
```


### <span class="section-num">5.8</span> Буфер обмена {#буфер-обмена}

Предлагается использовать [wl-clipboard](https://github.com/bugaevc/wl-clipboard).

```shell
emerge -v gui-apps/wl-clipboard
```

Пакет содержит две утилиты: `wl-copy` и `wl-paste`.

Пример использования:

```shell
# copy a simple text message
$ wl-copy Hello world!

# copy the list of files in Downloads
$ ls ~/Downloads | wl-copy

# copy an image file
$ wl-copy < ~/Pictures/photo.png

# paste to a file
$ wl-paste > clipboard.txt

# grep each pasted word in file source.c
$ for word in $(wl-paste); do grep $word source.c; done

# copy the previous command
$ wl-copy "!!"

# replace the current selection with the list of types it's offered in
$ wl-paste --list-types | wl-copy
```


### <span class="section-num">5.9</span> Блокировка экрана {#блокировка-экрана}


#### <span class="section-num">5.9.1</span> swaylock {#swaylock}

<!--list-separator-->

1.  Общая информация

    -   Официальное приложение для блокировки экрана для _Sway_ --- _swaylock_.
    -   Репозиторий: <https://github.com/swaywm/swaylock>
    -   Установка:
        -   Gentoo:
            ```shell
            emerge gui-apps/swaylock
            ```
    -   В информационной панеле _waybar_ есть опция для отключения блокировки при простое (например, для демонстрации слайдов).

<!--list-separator-->

2.  Блокировка при простое

    -   Заблокировать экран после 300 секунд бездействия.
    -   Затем выключить дисплей ещё через 300 секунд.
    -   Включить экран при возобновлении работы.
    -   Также заблокировать экран перед тем, как компьютер перейдет в спящий режим.
    -   Конфигурационный файл:
        ```conf-unix
        ### ~/.config/sway/config.d/80-lock.conf

        ### Idle lock
        ## - Lock your screen after 300 seconds of inactivity
        ## - Then turn off your displays after another 300 seconds
        ## - Turn your screens back on when resumed
        ## - Also lock your screen before your computer goes to sleep

        exec swayidle -w \
                 timeout 300 'swaylock -f -c 000000 -k' \
                 timeout 600 'swaymsg "output * dpms off"' \
                 resume 'swaymsg "output * dpms on"' \
                 before-sleep 'swaylock -f -c 000000 -k'
        ```

<!--list-separator-->

3.  Ручная блокировка

    -   `Mod` + `Ctrl` + `l` для немедленной блокировки экрана.
    -   Через 10 секунд выключить экран.
    -   Конфигурационный файл:
        ```conf-unix
        ### ~/.config/sway/config.d/80-lock.conf

        ### Manual lock
        ## - Mod + Ctrl + l to lock the screen immediately
        ## - In 10 sec also switch the screen off

        set $lockman exec bash ~/.config/sway/scripts/lockman.sh
        bindsym $mod+Ctrl+l exec $lockman
        ```
    -   Скрипт блокировки:
        ```shell
        #!/bin/bash
        # ~/.config/sway/scripts/lockman.sh

        # Times the screen off and puts it to background
        swayidle \
            timeout 10 'swaymsg "output * dpms off"' \
            resume 'swaymsg "output * dpms on"' &
        # Locks the screen immediately
        swaylock -c 550000 -k
        # Kills last background task so idle timer doesn't keep running
        kill %%
        ```


#### <span class="section-num">5.9.2</span> swaylock-effects {#swaylock-effects}

-   _swaylock-effects_ является форком _swaylock_:
    -   Репозиторий: <https://github.com/mortie/swaylock-effects>
    -   Добавляет встроенные скриншоты и эффекты манипулирования изображениями, такие как размытие.


## <span class="section-num">6</span> Совместимость приложений {#совместимость-приложений}


### <span class="section-num">6.1</span> Java {#java}


#### <span class="section-num">6.1.1</span> Серое окно, приложения не меняют размер с помощью WM, меню сразу закрываются {#серое-окно-приложения-не-меняют-размер-с-помощью-wm-меню-сразу-закрываются}

-   В стандартных тулкитах для Java жестко зашит список оконных менеджеров.
-   Следует установить переменную окружения:
    ```shell
    export _JAVA_AWT_WM_NONREPARENTING=1
    ```


#### <span class="section-num">6.1.2</span> Меню в приложениях плавает отдельно, им невозможно пользоваться {#меню-в-приложениях-плавает-отдельно-им-невозможно-пользоваться}

-   В выпусках Java до версии 9 GTK интерфейс ориентирован на GTK2, в последующих версиях на GTK3.
-   GTK LookAndFeel может работать с GTK версий 2, 2.2 и 3.
-   По умолчанию используется GTK3.
-   Следует явно задать более старую версию:
    ```shell
    export JAVA_TOOL_OPTIONS='-Djdk.gtk.version=2.2'
    ```
-   Например, в файле `~/.profile`:
    ```shell
    if [ "$XDG_SESSION_DESKTOP" = "sway" ] || [ "$XDG_SESSION_DESKTOP" = "i3" ]
    then
        # https://github.com/swaywm/sway/issues/595
        export _JAVA_AWT_WM_NONREPARENTING=1
        export JAVA_TOOL_OPTIONS='-Djdk.gtk.version=2.2'
    fi
    ```


### <span class="section-num">6.2</span> Приложения GTK+ запускаются с задержкой {#приложения-gtk-plus-запускаются-с-задержкой}

-   Приложения GTK+ ожидают запуск `xdg-desktop-portal` через D-Bus.
-   Ожидание прекращается по таймауту потому, что активированная служба D-Bus не знает, к какому `WAYLAND_DISPLAY` подключиться.
-   Это можно исправить, добавив в файл конфигурации следующее:
    ```shell
    exec systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK
    exec hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK
    ```


### <span class="section-num">6.3</span> Qt приложения {#qt-приложения}

-   Qt по умолчанию использует бэкэнд X11 вместо собственного бэкэнда Wayland. Чтобы использовать бэкэнд Wayland, установите `QT_QPA_PLATFORM=wayland`.
-   Qt прорисовает оформление окон на стороне клиента. Чтобы отключить это, установите `QT_WAYLAND_DISABLE_WINDOWDECORATION="1"`.
