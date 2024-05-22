---
title: "Pdf. Просмотр. Sioyek"
author: ["Dmitry S. Kulyabov"]
date: 2024-04-24T12:41:00+03:00
lastmod: 2024-05-17T19:58:00+03:00
categories: ["computer-science"]
draft: false
slug: "pdf-viewer-sioyek"
---

Просмотрщик pdf Sioyek.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://sioyek.info/>
-   Репозиторий: <https://github.com/ahrm/sioyek>
-   Документация: <https://sioyek-documentation.readthedocs.io/>
-   Поддерживаемые форматы: pdf, epub.
-   Управляется с помощью клавиатурных комбинаций, аналогично Zathura (см. [Pdf. Просмотр. Zathura]({{< relref "2023-09-20-pdf-viewer-zathura" >}})).
-   Использует стиль Vim для клавиатурных сочетаний.
-   Основан на MuPDF (<https://mupdf.com/>).


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Gentoo {#gentoo}

-   Используйте репозиторий `guru` (см. [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})):
    ```shell
    eselect repository enable guru
    emaint sync -r guru
    ```
-   Установите пакет:
    ```shell
    emerge sioyek
    ```


## <span class="section-num">3</span> Конфигурацию {#конфигурацию}


### <span class="section-num">3.1</span> Конфигурационный файл {#конфигурационный-файл}

-   Системная настройка клавиатуры: `/etc/sioyek/keys.config`.
-   Системные общие настройки: `/etc/sioyek/prefs.config`.


### <span class="section-num">3.2</span> Установка как приложения по умолчанию {#установка-как-приложения-по-умолчанию}

-   Приложение по умолчанию устанавливается с помощью _xdg-utils_ (см. [XDG. Приложения MIME]({{< relref "2023-04-02-xdg-mime-applications" >}})):
    ```shell
    xdg-mime default sioyek.desktop application/pdf
    ```


## <span class="section-num">4</span> Привязка клавиш по умолчанию {#привязка-клавиш-по-умолчанию}

-   В своих привязках я ориентировался на просмотрщик Zathura (см. [Pdf. Просмотр. Zathura]({{< relref "2023-09-20-pdf-viewer-zathura" >}})) и раскладку Emacs (см. [Emacs. Клавиатура]({{< relref "2023-08-19-emacs-keyboard" >}})).


### <span class="section-num">4.1</span> Открытие файлов {#открытие-файлов}

-   `o` : открыть меню выбора файла (`open_document`);
-   `Shift-o` : открыть список недавно открытых файлов (`open_prev_doc`);
-   `Ctrl-o` : открыть встроенный броузер файловой системы (`open_document_embedded`);
-   `Ctrl-Shift-o` : открыть встроенный броузер файловой системы в папке текущего документа (`open_document_embedded_from_current_path`);
-   `delete` : удалить файл из списка (не удаляет файл в файловой системе);
-   `Ctrl-t` : открыть файл в новом окне;
-   параметр командной строки `--new-window` открывает новое окно изнутри;
-   команда `goto_window` позволяет переключаться между открытыми окнами.


### <span class="section-num">4.2</span> Перемещение {#перемещение}

-   Можно перемещаться с помощью клавиш со стрелками (команды: `move_down`, `move_up`, `move_left`, `move_right`);
-   можно использовать колесо мыши для прокрутки экрана;
-   `gg` : переход на первую страницу (`goto_begining`);
-   `G` : перехода на последнюю страницу (`goto_end`);
-   номер страницы и затем `gg` : перейти на нужную страницу (например, чтобы перейти на страницу 42, необходимо ввести `42gg`);
-   нажать `HOME`, откроется меню, в котором вы можете ввести номер страницы : перейти на нужную страницу (`goto_page_with_page_number`);
-   `space` : переместиться на экран вниз (`screen_down`);
-   `Shift-space` : переместиться на экран вверх (`screen_up`);
-   `Ctrl-PageDown`, `Ctrl-PageUp` : переход к следующей или предыдущей странице (`next_page`, `previous_page`);
-   `t` : открыть оглавление с возможностью поиска (`goto_toc`);
-   `gc` : переход к следующей главе (`next_chapter`);
-   `gC` : переход к предыдущей главе (`prev_chapter`);
-   команда `toggle_scrollbar` переключает полосу прокрутки.


### <span class="section-num">4.3</span> Масштабирование {#масштабирование}


#### <span class="section-num">4.3.1</span> Системные настройки {#системные-настройки}

-   `+` : увеличить масштаб (`zoom_in`);
-   `-` : уменьшить масштаб (`zoom_out`);
-   можно использовать колесо мыши, удерживая `Cntrl`, для увеличения или уменьшения масштаба;
-   `f9`, `=` : подогнать страницу по ширине окна (`fit_to_page_width`);
-   `f10` : подогнать страницу по ширине окна, игнорируя поля страницы (`fit_to_page_width_smart`).


#### <span class="section-num">4.3.2</span> Мои настройки {#мои-настройки}

-   `a`: подогнать по высоте страницы:
    ```conf-unix
    ## Similar to fit_to_page_width, but for height
    fit_to_page_height  a
    ```
-   `Sift-a`: подогнать по высоте страницы:
    ```conf-unix
    ## Similar to fit_to_page_width_smart but for height
    fit_to_page_height_smart  S-a
    ```
-   `s`: подогнать страницу по ширине окна (`fit_to_page_width`):
    ```conf-unix
    ## Fill the screen width
    fit_to_page_width  s
    ```


### <span class="section-num">4.4</span> Навигация по истории {#навигация-по-истории}

-   Хранится полная история местоположений.
-   `backspace` или `Ctrl-LeftArrow` : вернуться назад по истории (`prev_state`);
-   `Shift-backspace` или `Ctrl-RightArrow` : вернуться вперёд по истории (`next_state`).


### <span class="section-num">4.5</span> Обзор {#обзор}

-   Можно щёлкнуть правой кнопкой мыши ссылку, чтобы открыть краткий обзор места назначения ссылки; перемещаться по этому обзору можно с помощью колесика мыши;
-   если в PDF-документе нет ссылок, можно щёлкнуть правой кнопкой мыши по элементам, и просмотрщик попытается открыть обзор места назначения элемента;
-   щёлкнуть средней кнопкой мыши по элементам, чтобы напрямую перейти к их местоположению, вместо того, чтобы открывать обзор.


### <span class="section-num">4.6</span> Визуальная метка {#визуальная-метка}

-   Если вы щёлкнете _правой_ кнопкой мыши по строке текста в PDF-файле, sioyek отобразит визуальную подсветку под этой строкой (визуальная метка).
-   Вы всегда можете вернуться к последнему местоположению визуальной метки, нажав `` ` `` и затем щелкнуть правой кнопкой мыши или нажать `` ` `` ещё раз.
-   Можно использовать для слежения за строкой.
-   Можно переместить визуальный знак на следующую или предыдущую строку, нажав `j` или `k` (`move_visual_mark_down`, `move_visual_mark_up`).
-   Вы можете переключить режим визуальной прокрутки, нажав `F7` (`toggle_visual_scroll`). В этом режиме колесо мыши перемещает визуальную метку вверх и вниз.
-   Если установлено в `prefs_user.config` команда `ruler_mode 0`, строка просто подчёркивается.
-   Если установлено в `prefs_user.config` команда `ruler_mode 1`, рисуется прямоугольник вокруг текущей строки.
-   Пока строка выделена, вы можете нажать `l` (`overview_definition`), чтобы создать обзор ссылки в текущей строке.

= Аналогичным образом вы можете нажать `]` (`portal_to_definition`) и `Ctrl+]` (`goto_definition`), чтобы создать портал или перейти к определению.


### <span class="section-num">4.7</span> Поиск {#поиск}

-   `/` или `Ctrl-f` : открыть меню поиска (`search`);
-   после начала поиска можно нажать `n` для перехода к следующему совпадению или `N` для перехода к предыдущему совпадению (`next_item` и `previous_item`);
-   `c/` : поиск только в текущей главе (`chapter_search`);
-   `<begin,end>что искать` : ограничить диапазон поиска определённым диапазоном страниц;
-   команды `overview_next_item` и `overview_prev_item` могут открыть обзор результатов поиска, а не переходить к ним.


### <span class="section-num">4.8</span> Метки {#метки}

-   Иногда при чтении документа необходимо бросить взгляд на содержимое предыдущих страниц и быстро вернуться в исходное место.
-   С помощью меток вы можете отметить своё местоположение, прежде, чем просмотреть предыдущий контент, а затем быстро вернуться к местоположению метки.
-   Чтобы создать метку, сначала нажмите `m` (`set_mark`), а затем символ алфавита (этот символ будет названием метки, вы можете иметь несколько меток с разными именами).
-   Например, чтобы создать отметку с именем `a` вашего текущего местоположения, введите `ma`.
-   Вы можете перейти к метке, нажав `` ` `` и указав название метки.
-   Отметки постоянные (сохраняются даже при закрытии приложения).
-   Знаки нижнего регистра являются локальными для текущего документа, а знаки верхнего регистра являются глобальными для всех файлов приложения.


### <span class="section-num">4.9</span> Закладки {#закладки}

-   Закладки аналогичны меткам, за исключением того, что вместо буквы алфавита в них используется текстовое описание.
-   Добавить закладку можно, нажав `b` (`add_bookmark`) и затем введя текстовое описание закладки в открывшемся меню.
-   Вы можете открыть список закладок текущего документа с возможностью поиска, введя `gb` (`goto_bookmark`).
-   Вы можете открыть список всех закладок во всех документах с возможностью поиска, введя `gB` (`goto_bookmark_g`).
-   Вы можете удалить ближайшую к текущему местоположению закладку, введя команду `db` (`delete_bookmark`).
-   Вы также можете удалить закладки непосредственно из списка закладок, выбрав закладку и затем нажав клавишу `delete` на клавиатуре.


### <span class="section-num">4.10</span> Выделения {#выделения}

-   Вы можете выделить текст. Подобно меткам, вы можете назначить тип каждому выделению, используя строчную букву алфавита. Каждому типу присваивается свой цвет.
-   Выделите фрагмент текста, а затем нажмите, `h`, а затем букву, чтобы задать тип. Например, чтобы создать выделение с типом `a`, введите `ha` (`add_highlight`).
-   Если вы не хотите каждый раз указывать тип выделения, вы можете выполнить команду `add_highlight_with_current_type`, которая использует текущее имя выделения для выделенного текста.
-   Вы можете изменить текущий тип выделения, выполнив команду `set_select_highlight_type`.
-   Вы можете переключить режим выделения, выполнив команду `toggle_select_highlight`. В этом режиме весь выделенный текст будет выделен как выбранный тип выделения.
-   Нажмите `gh`, чтобы открыть список выделений в текущем документе с возможностью поиска (`goto_highlight`).
-   Нажмите `gH`, чтобы открыть список выделений во всех документах с возможностью поиска (`goto_highlight_g`).
-   Вы можете выполнить `goto_next_highlight` и `goto_prev_highlight`, чтобы перемещаться по выделенным моментам в текущем документе.
-   Если вы хотите перемещаться по выделенным объектам выбранного типа (имени), вы можете использовать команды `goto_next_highlight_of_type` и `goto_prev_highlight_of_type`.
-   Чтобы удалить выделение, сначала щёлкните его левой кнопкой мыши, а затем введите `dh` (`delete_highlight`).
-   Также вы можете нажать клавишу `delete` на клавиатуре в списке выделения.


### <span class="section-num">4.11</span> Порталы {#порталы}

-   Иногда абзац полностью посвящен предыдущей части документа. Например, возможно, этот абзац объясняет данные предыдущей таблицы, описывает предыдущий рисунок или отвечает на предыдущее упражнение.
-   В таких ситуациях обычно очень раздражает постоянное переключение между абзацем и материалом, на который есть ссылка.
-   Используя порталы, вы можете связать расположение абзаца с местоположением ссылочного материала, и всякий раз, когда вы прокручиваете абзац до абзаца, содержимое ссылки автоматически отображается во вторичном окне.
-   Для того, чтобы создать портал, нажмите `p` (`portal`). Это создаёт неполный портал с текущим местоположением в качестве источника.
-   Теперь перейдите к местоположению указанного материала и нажмите `p` ещё раз. На этом портал завершается со вторым местом назначения.
-   Кроме того, вы можете создавать порталы, нажав `p`, а затем щёлкнув ссылку PDF. При этом автоматически создаётся портал от места ссылки до места назначения ссылки.
-   Также вы можете щелкнуть средней кнопкой мыши после нажатия `p`, что использует _Smart Jump_ для определения пункта назначения.
-   Для просмотра портала необходимо открыть окно-помощник. Вы можете открыть или закрыть окно-помощник, нажав `F12` (`toggle_window_configuration`).
-   В этом окне автоматически отображается пункт назначения портала с ближайшим к текущему местоположению источником.
-   Вы можете удалить ближайший портал, введя `dp` (`delete_portal`).
-   Вы можете перейти к месту назначения ближайшей ссылки, выполнив команду `goto_portal`.
-   Чтобы отредактировать назначение текущей ссылки, нажмите `Shift-p` (`edit_portalbackspace`). Это автоматически перенаправит вас к месту назначения ссылки. Теперь вы можете настроить экран или уровень масштабирования. Когда вы закончите, вернитесь в исходное местоположение, вернувшись в историю.
-   Вы также можете отредактировать место назначения ссылки, непосредственно перемещая окно помощника с помощью мыши или прокручивая колесо мыши.
-   Вы также можете настроить уровень масштабирования, используя колесо мыши, удерживая нажатой кнопку `Ctrl`.


### <span class="section-num">4.12</span> Командное меню {#командное-меню}


#### <span class="section-num">4.12.1</span> Системные настройки {#системные-настройки}

-   Меню команд можно открыть, нажав `:` (`command`).
-   Это доступный для поиска список всех команд, а также их текущие сочетания клавиш.


#### <span class="section-num">4.12.2</span> Мои настройки {#мои-настройки}

-   `M-x`: вызвать меню команд:
    ```conf-unix
    ## Open command line
    command  <A-x>
    ```


### <span class="section-num">4.13</span> Внешний поиск {#внешний-поиск}

-   Выделите фрагмент текста и введите `ss` или `sl` (команда `external_search`, за которой следует буква `a-z`), чтобы выполнить поиск в _Google Scholar_ или _Library Genesis_.
-   Вы также можете щелкнуть средней кнопкой мыши или щелкнуть средней кнопкой мыши по названию статей или книг (не нужно выделять текст), чтобы быстро найти их в _Google Scholar_ или других поисковых системах.
-   Вы можете настроить поисковые системы, используя конфигурации `search_url_*` в файлах `prefs_user.config`.
-   Вы можете настроить, какие поисковые системы использовать для поиска средним щелчком или сдвигом-средним щелчком, используя конфигурации `middle_click_search_engine` и `shift_middle_click_search_engine` в `prefs_user.config`.
-   Значением этих конфигураций должна быть буква, соответствующая конфигурациям `search_url_*`.


### <span class="section-num">4.14</span> SyncTeX {#synctex}

-   Нажмите `F4`, чтобы переключить режим синхронизации (`toggle_synctex`).
-   В этом режиме щелчок правой кнопкой мыши по любому тексту открывает соответствующий tex-файл в соответствующем месте.
-   Вы можете настроить команду обратного поиска _synctex_, используя конфигурация `inverse_search_command` в `prefs.config`.


### <span class="section-num">4.15</span> Данные и синхронизация {#данные-и-синхронизация}

-   Данные хранятся в двух файлах баз данных с именами `local.db` и `shared.db`.
-   `local.db` хранит специфичные для системы данные (например, расположение PDF-файлов в вашей файловой системе).
-   `shared.db` хранит все остальные данные, включая метки, закладки, порталы и т. д.
-   `shared.db` можно использовать на разных компьютерах.
-   Путь до разделяемой базы задаётся в конфигурации `shared_database_path` в файле `prefs_user.config`.
-   Можете экспортировать и импортировать данные из json-файла, выполнив команду `export` или `import`.


### <span class="section-num">4.16</span> Конфигурация окна {#конфигурация-окна}

-   Переключите полноэкранный режим с помощью `F12` (`toggle_window_configuration`).
-   Вы можете сохранить текущую конфигурацию окна командой `copy_window_size_config`.


### <span class="section-num">4.17</span> Разное {#разное}

-   `Ctrl-c` : копировать выделенный текст (`copy`).
-   Вы можете открыть ссылки в файлах PDF с клавиатуры, нажав `f` и введя номер рядом с нужной ссылкой (`open_link`).
-   Нажмите `F8`, чтобы переключить на тёмный режим (`toggle_dark_mode`).
-   Нажмите `F5`, чтобы переключить на режим презентации (`toggle_presentation_mode`).
-   Команда `toggle_horizontal_scroll_lock` запрещает горизонтальную прокрутку документа.
-   Команда `toggle_custom_color` переключает пользовательскую цветовую схему.
-   Команда `execute` открывает командную строку, в которой вы можете выполнять команды оболочки.
    -   В этой командной строке `%1` задаёт полный путь к текущему файлу, `%2` --- имя текущего файла, `%3`  --- текущий выделенный текст.
    -   Вы также можете заранее определить команды и быстро выполнять их, используя `execute_predefined_command`.
-   Вы можете экспортировать версию текущего PDF-файла со всеми встроенными в него закладками/выделениями (чтобы она была доступна для другого программного обеспечения PDF), выполнив команду `embed_annotations`.
-   Вы можете повернуть страницу, выполнив команды `rotate_clockwise` и `rotate_counterclockwise`.


## <span class="section-num">5</span> Конфигурационные файлы {#конфигурационные-файлы}


### <span class="section-num">5.1</span> Общесистемный файл привязки клавиш {#общесистемный-файл-привязки-клавиш}

-   Файл `/etc/sioyek/keys.config`:
    ```conf-unix
    # you can edit this file to change keybindings lines that start with '#' are comments
    # the syntax is pretty simple. Some examples:
    #command        k             (command is executed when k is pressed)
    #command        <C-k>         (command is executed when k is pressed while holding control)
    #command        K             (command is executed when K is entered, which is shift+k)
    #command        <A-k>         (command is executed when k is pressed while holding alt)
    #command        +             (command is executed when = is pressed while holding shift)
    #command        <C-S-k>       (command is executed when k is pressed while holding control and shift)
    #command        gg            (command is executed when g is pressed twice)
    #command        gt            (command is executed when g is pressed and then t is pressed)
    #command        g<C-n>Dt  (command is executed when g is pressed and then n is pressed while holding\
    #                               control and then d is pressed while holding shift and then t is pressed)
    # you can execute multiple commands using the following syntax:
    #command1;command2;command3        <keybinding>
    # for more information see the documentation at https://sioyek-documentation.readthedocs.io/


    # ---------- NAVIGATION AND ZOOM ----------

    # Goto the beginning of document. If prefixed with a number, it will go to that page.
    # for example 150gg goes to page 150.
    goto_beginning gg
    goto_beginning <C-<home>>

    # Goto the end of the document
    goto_end <end>
    goto_end G

    # Opens a prompt to enter page number and jump to that page
    goto_page_with_page_number <home>

    ## Goto left/right/bottom/top side of the page
    #goto_left <unbound>
    #goto_right <unbound>
    #goto_top_of_page <unbound>
    #goto_bottom_of_page <unbound>

    # Goto left/right side of the page ignoring white margins
    goto_left_smart ^
    goto_right_smart $

    # Goto the top-right side of page. Useful for two column documents
    goto_top_of_page;goto_right_smart zz

    # Movement (can be prefixed with a number)
    # move_down           <down>
    # move_up             <up>
    move_left           <right>
    move_right          <left>

    # Goto forward for one page width. (can be prefixed with a number)
    # (note that going forward for one page width is not usually what you want because if
    # the page is larger than the screen you will miss some content. What you usually want is screen_down)
    next_page <C-<pagedown>>
    previous_page <C-<pageup>>

    # Go down one screen width (can be prefixed with a number which tells how many screen widths should we go down)
    screen_down <space>
    screen_up <S-<space>>
    screen_down <pagedown>
    screen_up <pageup>

    # Goto the next/prev chapter
    next_chapter gc
    prev_chapter gC

    # Goto previous viewing state and delete the current (and future) state(s).
    # pop_state w

    # Goto the previous history point
    prev_state <backspace>
    prev_state <C-<left>>

    # Create a new sioyek window
    new_window <C-t>

    # Close the current sioyek window
    close_window <C-w>

    ## Search and switch between sioyek windows
    #goto_window <unbound>

    # If we are not at the end of viewing history, goto the next history point
    next_state <S-<backspace>>
    next_state <C-<right>>

    # Open table of contents.
    goto_toc t

    # Zoom
    zoom_in  +
    fit_to_page_width =
    zoom_out -

    ## Zoom in/out on the mouse cursor (instead of center of screen)
    # zoom_in_cursor <unbound>
    # zoom_out_cursor <unbound>

    # Rotate document
    rotate_clockwise r
    rotate_counterclockwise R

    # Automatically set the zoom level and horizontal offset such that the current page is centered horizontally and
    # it fills the screen width
    fit_to_page_width <f9>
    # Same as fit_to_page_with but ignores page margins
    fit_to_page_width_smart <f10>

    ## Similar to fit_to_page_width, but for height
    #fit_to_page_height   <unbound>

    ## Similar to fit_to_page_width_smart but for height
    #fit_to_page_height_smart   <unbound>

    ## Same as fit_to_page_width, but instead of filling the screen width, it fills the ratio of screen that is
    ## configured in `prefs_user.config` using `fit_to_page_width_ratio` config. See https://github.com/ahrm/sioyek/issues/162#issuecomment-1059738730.
    #fit_to_page_width_ratio <unbound>

    # Open a file dialog to select a document.
    open_document o
    # Open an embedded file dialog in sioyek
    open_document_embedded <C-o>
    # Open an embedded file dialog in sioyek rooted in the directory of current opened file
    open_document_embedded_from_current_path <C-S-o>

    # Open a searchable list of previously opened documents.
    open_prev_doc O

    ## Opens the last document opened is sioyek. It is useful when you want to quickly toggle between two documents
    #open_last_document <unbound>

    ## Keyboard shortcut to enter visual mark mode (instead of right clicking)
    #enter_visual_mark_mode <unbound>

    # Command the move the visual mark to the next/previous line
    # these keys only work when a visual mark is set (by right clicking or using `visual_mark_under_cursor` command)
    move_visual_mark_up k
    move_visual_mark_down j
    move_visual_mark_up <up>
    move_visual_mark_down <down>

    ## lock horizontal scroll, useful when using laptop touchpads
    # toggle_horizontal_scroll_lock <unbound>

    # ---------- SEARCH ----------

    # Search the document.
    # example: /something                   (searches the document for 'something')
    # you can also specify a page range to search:
    # example: /<110,135>something          (searches pages 110 to 135 (inclusive) for 'something')
    search <C-f>
    search /

    # Searches the current chapter. This is essentially the same as search but the range prefix is autofilled
    # with the range of the current lowest level subchapter.
    chapter_search c<C-f>
    chapter_search c/

    # Goto the next search item. Can be prefixed with a number which is the same as performing the command n times
    # for example if we are on the 10th search result and we input 15n, we go to the 25th search result.
    next_item n
    # Goto the previous search result. Can be prefixed with a number with similar rules as next_item.
    previous_item N

    # ---------- BOOKMARKS ----------
    # Add a bookmark in the current location (opens a text input where you can specify the bookmark text)
    add_bookmark b
    delete_bookmark db

    # Open bookmarks menu of the current document.
    goto_bookmark gb

    # Open bookmarks menu of all documents.
    goto_bookmark_g gB

    # ---------- HIGHLIGHTS ----------
    # You can select a piece of text and press the `add_highlight` shortcut followed by a symbol (a character from a-z) to highlight
    # the text
    add_highlight h
    # Goto highlights of current document
    goto_highlight gh
    # Goto highlights of all documents
    goto_highlight_g gH
    # Left click on a highlight and then press the `delete_highlight` shortcut to delete it.
    delete_highlight dh

    # Sets the highlight type to be used for other operations (the default highlight type is 'a')
    #set_select_highlight_type

    ## Same as `add_highlight` but uses the current selected highlight type as the type of highlight
    #add_highlight_with_current_type <unbound>

    ## Toggle select highlight mode. In select highlight mode, all text selected using mouse will automatically be highlighted
    ## with highlight type set using `set_select_highlight_type`
    #toggle_select_highlight <unbound>

    # Goto next/previous highlight in current document
    goto_next_highlight gnh
    goto_prev_highlight gNh

    ## Goto next/previous highlight of the current selected highlight type
    #goto_next_highlight_of_type <unbound>
    #goto_prev_highlight_of_type <unbound>

    # ---------- MARKS ----------

    # Mark the current location. After pressing the mark button, you must enter a symbol (a letter from a-z or A-Z).
    # this marks the current location in the file with the entered symbol. Afterwards you will be able to return to
    # the locations of the marks using goto_mark command.
    # example:  mm      (marks the current location in the file with a mark named 'm')
    set_mark m
    # Goto a previously set mark. After pressing goto_mark you must enter a symbol associated with a previously set mark.
    # example:  `m      (goes to the location of the mark named m)
    goto_mark `

    # ---------- PORTALS ----------
    # If we are in default state, goto portal state with the current location in document as the portal source
    # if we are already in the portal state, create the portal with the current location as destination.
    portal p

    # Delete the portal with the closest source to current location
    delete_portal dp

    # Goto the position of the portal with the closest source to current location
    goto_portal gp
    goto_portal <tab>

    # Similar to goto_portal, except when prev_state is called, the destination of the portal is update to be the state
    # on which prev_state is called
    edit_portal P
    edit_portal <S-<tab>>

    # Open/Close the helper window for portals
    toggle_window_configuration <f12>

    ## open/close helper window
    #toggle_one_window <unbound>

    # ---------- MISC ----------

    # Copy selected text
    copy <C-c>

    toggle_fullscreen <f11>

    # Toggles whether we highlight pdf links or not
    toggle_highlight <f1>

    # open command line
    command :

    # Search the selected text using one of the search engines defined using search_url_* settings in prefs.config (* can be any letter between 'a' and 'z')
    # see https://sioyek-documentation.readthedocs.io/en/latest/usage.html#external-search
    external_search s

    # opens the selected text as a url in the default browser
    # open_selected_url Q

    # Toggle dark mode (inverted colors)
    toggle_dark_mode <f8>

    ## Toggle custom color mode. You can specify the text background color in your `prefs_user.config` file
    ## see https://sioyek-documentation.readthedocs.io/en/latest/configuration.html#custom-background-color-and-custom-text-color
    #toggle_custom_color <f8>

    # Toggle synctex mode. When in synctex mode, right clicking on a pdf launches the corresponding latex page.
    toggle_synctex <f4>

    ## Perform a synctex search under the mouse cursor
    #synctex_under_cursor <unbound>

    # While in mouse drag mode, instead of selecting text you can pan the screen using mouse
    toggle_mouse_drag_mode <f6>

    # In visual scroll mode, mouse wheel performs `move_visual_mark_up` and `move_visual_mark_down` commands
    toggle_visual_scroll <f7>

    # In visual scroll mode, create an overview to/go to/portal to the definition in highlighted line
    overview_definition l
    goto_definition <C-]>
    portal_to_definition ]

    # In presentation mode, we fit the pages to screen and movement keys move entire pages
    toggle_presentation_mode <f5>

    ## Quit sioyek
    quit q

    # Open PDF links using keyboard
    open_link f

    # Select text using keyboard
    keyboard_select v

    # Smart jump using keyboard
    keyboard_smart_jump F

    ## Open overview window using keyboard
    #keyboard_overview <unbound>

    ## If the preview is not correct, jump to the next preview
    #next_preview <C-n>

    ## If the preview is not correct, jump to the previous preview
    #previous_preview <C-N>

    ## Jump to the location of the current overview
    #goto_overview <unbound>

    ## Create a portal to the location of the current overview
    #portal_to_overview <unbound>

    ## Center the window on selected text
    #goto_selected_text <unbound>

    ## Focus the visual mark on the text matching the given string (useful when extensions want to focus on a text)
    #focus_text <unbound>

    ## Smart jump to the location under mouse cursor
    #smart_jump_under_cursor <unbound>
    ## Open overview window to the location under mouse cursor
    #overview_under_cursor <unbound>
    ## Set a visual mark under mouse cursor
    #visual_mark_under_cursor <unbound>
    ## Close the overview window
    #close_overview <unbound>
    ## Exit visual mark mode
    #close_visual_mark <unbound>

    ## Import sioyek data from an exported file
    #import <unbound>

    ## Export sioyek data into a json file
    #export <unbound>

    ## Execute shell commands. For example:
    ## sioyek --new-instance %1
    ## in the command %1 expands to the path of the current file and %2 expand to the file name of the current file
    #execute <unbound>

    ## (deprecated see bottom of the page) Execute a predefined command. these commands are defined in `prefs_user.config` file using the following syntax:
    ## --------prefs_user.config-----------
    ## execute_command_a	some_command %1 %2
    ## execute_command_x	another_command %2
    ## ------------------------------------
    ## now in order to execute the second command you can first execute `execute_predefined_command` and then press 'x'
    #execute_predefined_command <unbound>

    ## Embed the annotations (highlights and bookmarks) into a new PDF file so they are visible to other PDF readers
    #embed_annotations <unbound>

    ## Copy the current window configuration to clipboard so they can be used in `prefs_user.config`
    #copy_window_size_config <unbound>

    ## Opens the default preference file
    #prefs <unbound>
    ## Opens the user preference file with highest priority
    #prefs_user <unbound>
    ## Opens a list of all user preference files
    #prefs_user_all <unbound>

    ## Opens the default kwys file
    #keys <unbound>
    ## Opens the user keys file with highest priority
    #keys_user <unbound>
    ## Opens a list of all user keys files
    #keys_user_all <unbound>

    ## Enter password for password protected documents
    #enter_password <unbound>

    ## Toggle fastread mode. this is an experiental feature
    #toggle_fastread <unbound>

    ## Toggle statusbar display
    #toggle_statusbar <unbound>

    ## Reload sioyek window
    #reload <unbound>

    ## Set the status string to be displayed in sioyek's statusbar (it is useful for extensions)
    #set_status_string <unbound>

    ## Clears the status string set by `set_status_string`
    #clear_status_string <unbound>

    ## Toggles the window titlebar
    #toggle_titlebar <unbound>

    ## You can bind custom commands defined in `prefs_user.config` using the same syntax as the built-in commands
    ## --------prefs_user.config-----------
    ## new_command	_my_command_name python /path/to/script.py %{file_name} %{paper_name}
    ## ------------------------------------
    ## now you can bind _my_command_name to a keybind here:
    #_my_command_name <unbound>
    ```


### <span class="section-num">5.2</span> Пользовательский файл привязки клавиш {#пользовательский-файл-привязки-клавиш}

-   Файл `~/.config/sioyek/keys_user.config`.
