---
title: "Sway. Конфигурация"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-12T20:02:00+03:00
lastmod: 2024-12-01T19:46:00+03:00
tags: ["configuration", "linux"]
categories: ["computer-science"]
draft: false
slug: "sway-configuration"
---

Конфигурация Sway.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}


### <span class="section-num">1.1</span> Расположение {#расположение}

-   Конфигурация находится в:
    -   `/usr/share/sway/`;
    -   `/etc/sway/`;
    -   `~/.config/sway`.


### <span class="section-num">1.2</span> Переменные среды {#переменные-среды}

-   Переменные среды задаются в:
    -   `/etc/sway/environment`;
    -   `~/.config/sway/environment`.


### <span class="section-num">1.3</span> Разделы {#разделы}

-   Файлы конфигурации сгруппированы в разделы.
-   50-59 ( `50-rules-*.conf` )
    -   Оконные правила( `for_window`, `assign`  и соответствующую конфигурацию).
-   60-69 ( `60-bindings-*.conf`, `65-mode-.conf`)
    -   Привязки клавиш и режимы привязки
-   90-94 ( `90-*.conf` )
    -   Системные приложения: панели, демоны простоя и другие компоненты.
-   95-99 ( `95-*.conf` )
    -   Автозапуск приложений


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Gentoo {#gentoo}

-   Пакет идёт в основном репозитории:

<!--listend-->

```shell
emerge -v gui-apps/waybar
```


## <span class="section-num">3</span> Конфигурация Sway {#конфигурация-sway}


### <span class="section-num">3.1</span> Сочетания клавиш {#сочетания-клавиш}

-   [Sway. Сочетания клавиш]({{< relref "2024-08-24-sway-keybindings" >}})


### <span class="section-num">3.2</span> Статусные панели {#статусные-панели}

```conf-unix
## Status Bar
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 1:</span>
  config.d/80-bar.conf
</div>


#### <span class="section-num">3.2.1</span> Sway-bar {#sway-bar}

-   Sway-bar идёт в составе Sway.

<!--listend-->

```conf-unix
### sway-bar
## Read `man 5 sway-bar` for more information about this section.

# bar {
#    font pango:Iosevka Nerd Font Propo, Font Awesome 6 Free, Font Awesome 6 Brands, sans-serif 12
#    position top

# When the status_command prints a new line to stdout, swaybar updates.
# The default just shows the current date and time.
# status_command while date +'%Y-%m-%d %H:%M:%S'; do sleep 1; done
# status_command i3status
#    status_command i3blocks

#      colors {
#      	    statusline #ffffff
#             background #323232
# 	    inactive_workspace #32323200 #32323200 #5c5c5c
# 	}
# }
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 2:</span>
  config.d/80-bar.conf
</div>


#### <span class="section-num">3.2.2</span> Waybar {#waybar}

-   [Wayland. Панель Waybar]({{< relref "2024-11-21-wayland-waybar" >}})

<!--listend-->

```conf-unix
### Waybar
## https://github.com/Alexays/Waybar

## Waybar Tooltips don't steel focus

# no_focus [app_id="waybar"]
# for_window [app_id="waybar" floating] {
# 	   move position cursor
# 	   move down 60px # adjust if some menus still don't fit
# }
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 3:</span>
  config.d/80-bar.conf
</div>

-   Запускать можно разными способами.
-   Запуск скриптом. Скрипт убивает waybar и запускает заново:
    ```shell
    exec_always ~/.config/waybar/waybar.sh
    ```
-   Запуск через `waybar.service`:
    ```conf-unix
    # exec_always systemctl --user restart waybar.service
    ```
-   Запуск через инфраструктуру _Swaybar_:
    ```conf-unix
    # bar {
    #     position top
    #     # Execute Waybar; Waybar restarts when Sway reloads.
    #     status_command waybar
    #     # Hide Sway's builtin status bar.
    #     mode invisible
    # }
    ```

    -   При этом после перезапуска _Sway_ waybar не перезапускается, а запускает новый экземпляр.


#### <span class="section-num">3.2.3</span> Nwg-panel {#nwg-panel}

```conf-unix
### nwg-panel
## GTK3-based panel for sway and Hyprland Wayland compositors
## https://nwg-piotr.github.io/nwg-shell/nwg-panel
## https://github.com/nwg-piotr/nwg-panel

# exec_always nwg-panel -c preset-1 -s preset-1.css
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 4:</span>
  config.d/80-bar.conf
</div>


#### <span class="section-num">3.2.4</span> Yambar {#yambar}

-   <https://codeberg.org/dnkl/yambar>

<!--listend-->

```conf-unix
### yambar
## https://codeberg.org/dnkl/yambar

# exec_always yambar
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 5:</span>
  config.d/80-bar.conf
</div>


### <span class="section-num">3.3</span> Менеджер паролей {#менеджер-паролей}


#### <span class="section-num">3.3.1</span> Tessen {#tessen}

-   [Менеджер паролей pass. Tessen]({{< relref "2024-12-01-password-manager-pass-tessen" >}})

<!--listend-->

```conf-unix
## A bash script to handle Simple Password Store in a convenient way using rofi
## https://github.com/ayushnix/tessen

## Dmenu // Password Manager // ◆ Super ⎈ Ctrl p ##
$bindsym $mod+Ctrl+p exec "tessen"
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 6:</span>
  config.d/80-pass.conf
</div>
