---
title: "Sway. Сочетания клавиш"
author: ["Dmitry S. Kulyabov"]
date: 2024-08-24T20:35:00+03:00
lastmod: 2024-08-24T21:15:00+03:00
tags: ["wayland", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "sway-keybindings"
---

Sway. Сочетания клавиш.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Источники вдохновения {#источники-вдохновения}

-   Примеры раскладки клавиатуры были взяты из следующих источников:
    -   <https://regolith-desktop.com/docs/reference/keybindings/>
        -   Настройка сочетаний клавиш для Regolith Linux/
    -   <https://mark.stosberg.com/sway-keybindings/>
        -   Просто описание используемых сочетаний клавиш, инспирированных дистрибутивом Regolith Linux.


## <span class="section-num">2</span> Семантические комментарии {#семантические-комментарии}

-   Для обозначения раскладки клавиш в файле конфигурации используется семантические комментарии.
-   Категория (category) используется для группировки типов действий, действие (action) используется для обозначения конкретного действия, сочетание клавиш (keybinding) используется для указания конкретных клавиш.
-   Формат разработан таким образом, чтобы его можно было легко анализировать скриптом и можно было читать в его исходной форме людьми:
    ```conf-unix
    ## <category> // <action> // <keybinding> ## <reserved for user notes>
    ```
-   Текст внутри `<category>`, `<action>`, `<keybinding>` не должен содержать последовательности `##`, `//` или перевод строки.
-   Например:
    ```conf-unix
    ## Navigate // Relative Window // <Super> ↑ ↓ ← → ##
    bindsym $mod+Left focus left
    ```


## <span class="section-num">3</span> Сочетания клавиш {#сочетания-клавиш}

<div class="table-caption">
  <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1:</span>
  Сочетания клаыиш для Sway
</div>

| Действие                                   | Сочетание клавиш                  | Описание           |
|--------------------------------------------|-----------------------------------|--------------------|
| Launch - Application                       | `◆ Super`  Space                  |                    |
| Launch - Browser                           | `◆ Super` `Shift`  Enter          |                    |
| Launch - Command                           | `◆ Super` `Shift`  Space          |                    |
| Launch - File Browser                      | `◆ Super` `Shift`  n              |                    |
| Launch - File Search                       | `◆ Super` `Alt`  Space            |                    |
| Launch - Notification Viewer               | `◆ Super`  n                      |                    |
| Launch - Terminal                          | `◆ Super` `Enter`                 | Запустить терминал |
| Launch - This Dialog                       | `◆ Super` `Shift`  ?              |                    |
| Modify - Bluetooth Settings                | `◆ Super`  b                      |                    |
| Modify - Carry Window to Workspace 1 - 10  | `◆ Super` `Alt`  0..9             |                    |
| Modify - Carry Window to Workspace 11 - 19 | `◆ Super` `Alt` `Ctrl`  1..9      |                    |
| Modify - Containing Workspace              | `◆ Super` `Ctrl` `Shift`  ↑ ↓ ← → |                    |
| Modify - Display Settings                  | `◆ Super`  d                      |                    |
| Modify - Load Window Layout                | `◆ Super`  .                      |                    |
| Modify - Move Window to Workspace 1 - 10   | `◆ Super` `Shift`  0..9           |                    |
| Modify - Move Window to Workspace 11 - 19  | `◆ Super` `Ctrl` `Shift`  1..9    |                    |
| Modify - Move to Scratchpad                | `◆ Super` `Ctrl`  m               |                    |
| Modify - Next Window Orientation           | `◆ Super`  Backspace              |                    |
| Modify - Save Window Layout                | `◆ Super`  ,                      |                    |
| Modify - Settings                          | `◆ Super`  c                      |                    |
| Modify - Tile/Float Focus Toggle           | `◆ Super` `Shift`  t              |                    |
| Modify - Toggle Bar                        | `◆ Super`  i                      |                    |
| Modify - Wifi Settings                     | `◆ Super`  w                      |                    |
| Modify - Window Floating Toggle            | `◆ Super` `Shift`  f              |                    |
| Modify - Window Fullscreen Toggle          | `◆ Super`  f                      |                    |
| Modify - Window Layout Mode                | `◆ Super`  t                      |                    |
| Modify - Window Position                   | `◆ Super` `Shift`  k j h l        |                    |
| Modify - Window Position                   | `◆ Super` `Shift`  ↑ ↓ ← →        |                    |
| Navigate - Next Workspace                  | `◆ Super`  Tab                    |                    |
| Navigate - Next Workspace                  | `◆ Super` `Alt`  →                |                    |
| Navigate - Previous Workspace              | `◆ Super` `Alt`  ←                |                    |
| Navigate - Previous Workspace              | `◆ Super` `Shift`  Tab            |                    |
| Navigate - Relative Window                 | `◆ Super`  k j h l                |                    |
| Navigate - Relative Window                 | `◆ Super`  ↑ ↓ ← →                |                    |
| Navigate - Scratchpad                      | `◆ Super` `Ctrl`  a               |                    |
| Navigate - Window by Name                  | `◆ Super` `Ctrl`  Space           |                    |
| Navigate - Workspace 11-19                 | `◆ Super` `Ctrl`  1..9            |                    |
| Navigate - Workspaces 1-10                 | `◆ Super`  0..9                   |                    |
| Resize - Enter Resize Mode                 | `◆ Super`  r                      |                    |
| Session - Exit App                         | `◆ Super` `Shift`  q              |                    |
| Session - Lock Screen                      | `◆ Super`  Escape                 |                    |
| Session - Logout                           | `◆ Super` `Shift`  e              |                    |
| Session - Power Down                       | `◆ Super` `Shift`  p              |                    |
| Session - Reboot                           | `◆ Super` `Shift`  b              |                    |
| Session - Refresh Session                  | `◆ Super` `Shift`  r              |                    |
| Session - Reload Config                    | `◆ Super` `Shift`  c              |                    |
| Session - Restart                          | `◆ Super` `Ctrl`  r               |                    |
| Session - Sleep                            | `◆ Super` `Shift`  s              |                    |
| Session - Terminate App                    | `◆ Super` `Alt`  q                |                    |
