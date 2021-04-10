---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Переход на Sway"
subtitle: ""
slug: migration-sway
summary: ""
authors: []
tags: ["gentoo"]
categories: ["sysadmin"]
date: 2020-09-10T10:33:15+03:00
lastmod: 2020-09-10T10:33:15+03:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: ["misc-utils"]
---

## Переход на Sway

Решил попробовать [Wayland](https://wayland.freedesktop.org/). По этой
причине пришлось
[перейти](http://way-cooler.org/blog/2020/01/09/way-cooler-post-mortem.html)
с [awesome](https://awesomewm.org/) на [sway](https://swaywm.org/).

<!--more-->

Установка `sway`:

``` bash
emerge -v gui-wm/sway
```

### Репозитории `gentoo`

Программы для Wayland есть как в основном репозитории, так и
дополнительных. Хочу порекомендовать для просмотра следующие
репозитории:

- [wayland-desktop](https://github.com/epsilon-0/wayland-desktop)

``` bash
layman -a wayland-desktop
```

- [guru](https://wiki.gentoo.org/wiki/Project:GURU)

``` bash
layman -a guru
```

### Первоначальная конфигурация

При запуске без локальной конфигурации `sway` использует глобальную
конфигурацию `/etc/sway/config`. При желании внести изменение в
конфигурацию можно скопировать файл глобальной конфигурации в
локальную:

``` bash
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/
```

### Комбинации клавиш

Основные сочетания клавиш:

- `Mod` + `Enter` -- открыть новый терминал;
- `Mod` + `d` -- запустить программу;
- `Mod` + `0`..`9` -- переключение между workspace’ами;
- `Mod` + `Shift` + `0`..`9` -- перемещение окон в заданный workspace;
- `Mod` + `Shift` + `q` -- закрыть текущее окно;
- `Mod` + Стрелочки -- перемещение между окнами, вместо стрелочек также могут быть использованы клавиши «J» (влево), «K» (вниз), «L» (вверх) и «;» (вправо);
- `Mod` + `Shift` + Стрелочки -- перемещение окон в пределах workspace’а, вместо стрелочек также могут быть использованы буковки и точка с запятой;
- `Mod` + `v` -- использовать вертикальное разбиение;
- `Mod` + `h` -- использовать горизонтальное разбиение;
- `Mod` + `e` -- размещение окон по-умолчанию (default layout);
- `Mod` + `s` -- стековое размещение (stacking layout);
- `Mod` + `w` -- размещение с табами (tabbed layout);
- `Mod` + `f` -- раскрыть окно во весь экран или свернуть его обратно;
- `Mod` + `Shift` + `Space` -- разрешить свободное перемещение окна (floating mode) или вернуть его в мозаику;
- `Mod` + `Shift` + `c` -- перечитать конфигурацию `sway` (перестартовать);
- `Mod` + `Shift` + `e` -- выйти из `sway`.

Кроме того, часть сочетаний клавиш определяется в файлах, определяющих
конкретный функционал.

### Замена приложений

#### Снимки экрана

Исходно использовался `scrot`.

Для Wayland перешёл на связку
[`grim`](https://github.com/emersion/grim) (получение снимка
экрана) + [`slurp`](https://github.com/emersion/slurp) (выделение
области экрана):

``` bash
emerge -uv gui-apps/slurp gui-apps/grim
```

Настроим получение снимков экрана:

``` conf
# ~/.config/sway/config.d/80-screenshots.conf
# Screenshot active display
bindsym Print exec grim -t png "$(xdg-user-dir PICTURES)"/$(date +%Y-%m-%d_%H-%M-%S).png

# Screenshot current window
bindsym $mod+Print exec grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" "$(xdg-user-dir PICTURES)"/$(date +%Y-%m-%d_%H-%M-%S).png

# Screenshot selected region
bindsym $mod+Shift+Print exec grim -t png -g "$(slurp)" "$(xdg-user-dir PICTURES)"/$(date +%Y-%m-%d_%H-%M-%S).png
```

- При нажатии клавиши `PrtScr` делается снимок всего экрана.
- При нажатии `Mod4`+`PrtScr` делается снимок активного окна.
- При нажатии `Mod4`+`Shift`+`PrtScr` предлагается выбрать область экрана, снимок которой следует сделать.

#### Видеозапись экрана (скринкаст)

Ранее использовался [SimpleScreenRecorder](https://www.maartenbaert.be/simplescreenrecorder/).

##### Видеозапись экрана -- командная строка

Для записи из командной строки используем [`wf-recorder`](https://github.com/ammen99/wf-recorder):

``` bash
emerge -v gui-apps/wf-recorder
```

Варианты использования:

- Запись всего экрана в файл `recording.mkv` (только видео):

``` bash
wf-recorder -f recording$(date +%Y-%m-%d_%H-%M-%S).mkv
```

Если файл не указывать, запись будет в текущий каталог.

- Запись фрагмента экрана (тут имя файла задаётся по времени начала записи):

``` bash
wf-recorder -g "$(slurp)" -f $(date +%Y-%m-%d_%H-%M-%S).mkv
```

- Запись со звуком:

``` bash
wf-recorder --audio -f $(date +%Y-%m-%d_%H-%M-%S).mkv
```

- Запись с использование GPU (VAAPI интерфейс):

``` bash
wf-recorder --audio -f $(date +%Y-%m-%d_%H-%M-%S).mkv -c h264_vaapi -d /dev/dri/renderD128
```

##### Видеозапись экрана -- графическое приложение

Для захвата десктопа в Wayland используется плагин
[`wlrobs`](https://hg.sr.ht/~scoopta/wlrobs).

#### Строка состояний

Sway поддерживает свою строку состояний `sway-bar`. Удобное и
минималистическое приложение. Однако, удручает, что иконки в трее не активны.

Попробуем использовать более продвинутый вариант --
[`waybar`](https://github.com/Alexays/Waybar)

``` bash
emerge -v gui-apps/waybar
```
Конфигурация:

``` conf
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

#### Уведомления

Используется [`mako`](https://github.com/emersion/mako).

``` bash
emerge -v gui-apps/mako
```

Сконфигурировал следующим образом:

``` conf
# ~/.config/sway/config.d/80-mako.conf
# Light
exec_always mako --font 'Source Code Pro 10' --background-color '#fdf6e3' --text-color '#657b83' --default-timeout 5000 --width 400 --markup 1 --border-radius 5

# Dark
# exec_always mako --font 'Source Code Pro 10' --background-color '#002b36' --text-color '#839496' --default-timeout 5000 --width 400 --markup 1 --border-radius 5
```

#### Настройка вывода

В XWindow используется программа `xrandr` (с её помощью можно изменять
параметры вывода изображения RandR). В `sway` можно управлять с
помощью `swaymsg output` или с помощью утилиты
[`wlr-randr`](https://github.com/emersion/wlr-randr).

``` bash
emerge -v gui-apps/wlr-randr
```

#### Меню программ (launcher)

Для запуска программы используется `dmenu`. Если не нравится, можно заменить.

- [`wofi`](https://hg.sr.ht/~scoopta/wofi) --- аналог `rofi` для Wayland. Попроще, конечно.

``` bash
emerge -v gui-apps/wofi
```
В отличии от `dmenu` запоминает последние выбранные команды.

Общая конфигурация:

``` conf
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

#### Буфер обмена

Предлагается использовать
[`wl-clipboard`](https://github.com/bugaevc/wl-clipboard).

``` bash
emerge -v gui-apps/wl-clipboard
```

Пакет содержит две утилиты: `wl-copy` и `wl-paste`.

Пример использования:

``` bash
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
