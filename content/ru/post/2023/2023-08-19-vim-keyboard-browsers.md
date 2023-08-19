---
title: "Vim. Клавиатура. Броузеры"
author: ["Dmitry S. Kulyabov"]
date: 2023-08-19T18:47:00+03:00
lastmod: 2023-08-19T19:56:00+03:00
tags: ["vim"]
categories: ["computer-science"]
draft: false
slug: "vim-keyboard-browsers"
---

Расширения для броузеров с поддержкой раскладки Vi.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Режимы ввода {#режимы-ввода}

-   Зачастую расширения работают в двух режимах: в режиме команд или в режиме ввода.
-   В первом все нажимаемые на клавиатуре клавиши воспринимаются как команды для расширения.
-   Во втором режиме нажатиями клавиш, например, можно печатать текст на странице.
-   Для перехода в режим команд необходимо нажать кнопку `Esc`, а чтобы оказаться в режиме ввода можно нажать `i`.


## <span class="section-num">2</span> Общая раскладка клавиатуры {#общая-раскладка-клавиатуры}

-   Все расширения придерживаются базовых соглашений по привязке клавиатуры.


### <span class="section-num">2.1</span> Навигация по текущей странице {#навигация-по-текущей-странице}

-   `?`: показать диалог справки для получения списка всех доступных клавиш
-   `h`: прокрутка влево
-   `j`, `C-e`: прокрутка вниз
-   `k`, `C-y`: прокрутка вверх
-   `l`: прокрутка вправо
-   `gg`: прокрутка к верхней части страницы
-   `G`: прокрутка к нижней части страницы
-   `d`: прокрутка вниз на полстраницы
-   `u`: прокрутка на полстраницы вверх
-   `f`: открыть ссылку на текущей вкладке
-   `F`: открыть ссылку в новой вкладке
-   `r`: перезагрузка
-   `gs`: просмотр источника
-   `i`: войти в режим вставки; все команды будут игнорироваться до тех пор, пока вы не нажмете `Esc` для выхода
-   `yy`: скопировать текущий url в буфер обмена
-   `yf`: копирование url ссылки в буфер обмена
-   `gf`: переход к следующему фрейму
-   `gF`: фокусировка основного/верхнего фрейма


### <span class="section-num">2.2</span> Переход на новые страницы {#переход-на-новые-страницы}

-   Для работы со ссылками и другими элементами на странице создаётся временная комбинацию из одной или нескольких символов, которые становятся видны после нажатия на клавишу `f` (или `F`).

-   `o`: открыть URL, закладку или запись в истории
-   `O`: открыть URL-адрес, закладку, запись в истории на новой вкладке
-   `b`: открыть закладку
-   `B`: открыть закладку в новой вкладке
-   `f`: открыть ссылку в текущей вкладке
-   `F`: открыть ссылку в новой вкладке


### <span class="section-num">2.3</span> Поиск {#поиск}

-   `/`: войти в режим поиска
-   `n`: цикл вперед к следующему найденному совпадению
-   `N`: цикл назад к предыдущему найденному совпадению


### <span class="section-num">2.4</span> Навигация по истории {#навигация-по-истории}

-   `H`: вернуться в историю
-   `L`: идти вперед в истории


### <span class="section-num">2.5</span> Управление вкладками {#управление-вкладками}

-   `J`, `gT`: переход на одну вкладку влево
-   `K`, `gt`: переход на одну вкладку вправо
-   `g0`: переход на первую вкладку. Для перехода на n-ю вкладку используйте ng0
-   `g$`: переход на последнюю вкладку
-   `^`: посетить ранее посещенную вкладку
-   `t`: создать вкладку
-   `yt`: дублировать текущую вкладку
-   `x`: закрыть текущую вкладку
-   `X`: восстановить закрытую вкладку (т.е. развернуть команду 'x')
-   `T`: поиск по открытым вкладкам
-   `W`: переместить текущую вкладку в новое окно
-   `<a-p>`: закрепить/открепить текущую вкладку
-   `<<`: переместить вкладку влево
-   `>>`: переместить вкладку вправо


### <span class="section-num">2.6</span> Использование меток {#использование-меток}

-   `ma`, `mA`: установить локальную метку `a` (глобальную метку `A`)
-   `` `a ``, `` `A ``": переход к локальной метке `a` (глобальная метка `A`)
-   `` `` ``: прыжок назад в позицию, предшествующую предыдущему прыжку (то есть до предыдущего перехода `gg`, `G`, `n`, `N`, `/` или `` `a ``)


### <span class="section-num">2.7</span> Дополнительные команды просмотра {#дополнительные-команды-просмотра}

-   `]]`, `[[`: перейти по ссылке с меткой 'next' или '&gt;' ('previous' или '&lt;') (полезно для просмотра страничных сайтов)
-   `<a-f>`: открыть несколько ссылок в новой вкладке
-   `gi`: фокусировка на первом (или n-ом) текстовом поле ввода на странице. Для перебора вариантов используйте &lt;tab&gt;
-   `gu`: переход на один уровень вверх по иерархии URL
-   `gU`: переход к корню иерархии URL
-   `ge`: редактировать текущий URL
-   `gE`: редактировать текущий URL и открывать его в новой вкладке
-   `zH`: прокрутка до конца влево
-   `zL`: прокрутка вправо
-   `v`: переход в визуальный режим; используйте `p=/=P` для вставки и перехода, используйте `y` для перемещения
-   `V`: перейти в режим визуальной строки


## <span class="section-num">3</span> Расширения для броузеров {#расширения-для-броузеров}


### <span class="section-num">3.1</span> Vimium {#vimium}

-   Сайт: <https://vimium.github.io/>
-   Репозиторий: <https://github.com/philc/vimium>
-   Расширение Chrome: <https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb>
-   Можно в настройках добавить локализованные комбинации клавиш: <https://github.com/philc/vimium/wiki/Key-Mappings>
-   В настройках можно внести в список исключений сайты, на которых вы не хотите использовать сочетания клавиш _Vimium_.


### <span class="section-num">3.2</span> Tridactyl {#tridactyl}

-   Репозиторий: <https://github.com/tridactyl/tridactyl>
-   Развитие Vimperator и Pentadactyl


### <span class="section-num">3.3</span> Surfingkeys {#surfingkeys}

-   Репозиторий: <https://github.com/brookhong/Surfingkeys>


### <span class="section-num">3.4</span> cVim {#cvim}

-   Репозиторий: <https://github.com/1995eaton/chromium-vim>


### <span class="section-num">3.5</span> Vimari {#vimari}

-   Репозитоий: <https://github.com/televator-apps/vimari>


### <span class="section-num">3.6</span> Vrome {#vrome}

-   Репозиторий: <https://github.com/jinzhu/vrome>


### <span class="section-num">3.7</span> Vim Vixen {#vim-vixen}

-   Репозиторий: <https://github.com/ueokande/vim-vixen>
-   Разработка прекращена.
-   Автор делает теперь _Vimmatic_.


### <span class="section-num">3.8</span> Vimmatic {#vimmatic}

-   Репозиторий: <https://github.com/ueokande/vimmatic>


### <span class="section-num">3.9</span> Homerow {#homerow}

-   Сайт: <https://www.homerow.app/>


### <span class="section-num">3.10</span> Vieb {#vieb}

-   Репозиторий: <https://github.com/Jelmerro/Vieb>


### <span class="section-num">3.11</span> Hunt-n-peck {#hunt-n-peck}

-   Репозиторий: <https://github.com/zsims/hunt-and-peck>


### <span class="section-num">3.12</span> Vimium-C {#vimium-c}

-   Репозиторий: <https://github.com/gdh1995/vimium-c>


### <span class="section-num">3.13</span> sVim {#svim}

-   Репозиторий: <https://github.com/flippidippi/sVim>


### <span class="section-num">3.14</span> Spotlink {#spotlink}

-   Репозитоий: <https://github.com/reindert-vetter/spotlink/>


### <span class="section-num">3.15</span> VimMotion {#vimmotion}

-   Репозитоий: <https://github.com/dwarvesf/VimMotionApp>


### <span class="section-num">3.16</span> VimFx {#vimfx}

-   Репозиторий: <https://github.com/akhodakivskiy/VimFx>


### <span class="section-num">3.17</span> Firevin {#firevin}

-   Репозитоий: <https://github.com/glacambre/firenvim>


### <span class="section-num">3.18</span> Vimperator {#vimperator}

-   Репозиторий: <https://github.com/vimperator/vimperator-labs>


### <span class="section-num">3.19</span> Pentadactyl {#pentadactyl}

-   Репозиторий: <https://github.com/5digits/dactyl>


## <span class="section-num">4</span> Отдельные броузеры {#отдельные-броузеры}


### <span class="section-num">4.1</span> Vimb {#vimb}

-   Сайт: <https://fanglingsu.github.io/vimb/>
-   Репозиторий: <https://github.com/fanglingsu/vimb>
-   На основе Webkit
