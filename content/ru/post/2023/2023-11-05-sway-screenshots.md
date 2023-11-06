---
title: "Sway. Скриншоты"
author: ["Dmitry S. Kulyabov"]
date: 2023-11-05T15:33:00+03:00
lastmod: 2023-11-05T15:44:00+03:00
tags: ["wayland"]
categories: ["computer-science"]
draft: false
slug: "sway-screenshots"
---

Создание снимков экрана в Sway и Wayland.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> grim {#grim}

-   В X11 аналогом является `scrot`.
-   Для Wayland используется связка `grim` (получение снимка экрана) + [slurp](https://github.com/emersion/slurp) (выделение области экрана)
-   Grim:
    -   Репозиторий: <https://git.sr.ht/~emersion/grim/refs>
-   Slurp:
    -   Репозиторий: <https://github.com/emersion/slurp>


### <span class="section-num">1.1</span> Установка {#установка}

-   Gentoo:

<!--listend-->

```shell
emerge -uv gui-apps/slurp gui-apps/grim
```


### <span class="section-num">1.2</span> Настройка {#настройка}

-   Настроим получение снимков экрана:

<!--listend-->

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
-   При нажатии `Mod + PrtScr` делается снимок активного окна.
-   При нажатии `Mod + Shift + PrtScr` предлагается выбрать область экрана, снимок которой следует сделать.


## <span class="section-num">2</span> Swappy {#swappy}

-   Инструмент для создания и редактирования снимков экрана в Wayland.
-   Вдохновлён Snappy для macOS (<http://snappy-app.com/>).
-   Репозиторий: <https://github.com/jtheoof/swappy>
