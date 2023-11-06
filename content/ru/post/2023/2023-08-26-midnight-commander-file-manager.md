---
title: "Файловый менеджер Midnight Commander"
author: ["Dmitry S. Kulyabov"]
date: 2023-08-26T17:40:00+03:00
lastmod: 2023-10-07T17:36:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "midnight-commander-file-manager"
---

Файловый менеджер Midnight Commander.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}


### <span class="section-num">1.1</span> Windows {#windows}

-   Репозиторий:
    -   <https://github.com/adamyg/mcwin32>
    -   <https://sourceforge.net/projects/mcwin32>


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Windows {#windows}

-   Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})):
    ```shell
    choco install openssh -y
    choco install mc --package-parameters='/modifypath' -y
    ```
-   Открывается как отдельное приложение.
-   Опция `--package-parameters='/modifypath'` позволяет открывать из командной строки вызовом `mc`.
-   Ssh нужно для подключения к удалённым компьютерам через меню в панели.


## <span class="section-num">3</span> Горячие клавиши для файловых панелей {#горячие-клавиши-для-файловых-панелей}


### <span class="section-num">3.1</span> Файлменеджер {#файлменеджер}

-   `F3`: Просмотр файла
-   `F4`: Редактирование файла
-   `Insert`: Выделение текущего объекта вызывает окно для выделения группы файлов (можно использовать регулярные выражения) снимает отметку с группы файлов (действие, обратное тому, которое вызывается по клавише +)
-   `Meta+Enter`: Вставить текущий объект в командную строку
-   `Meta+.`: не показывать или показать скрытые файлы или каталоги (начинаются на точку ‘.’)
-   `Meta+,`: Переключить режим отображения панелей (вертикально/горизонтально)2
-   `Meta+a`, `Ctrl+x p`: Посылает в командную строку полный путь в текущей активной панели
-   `Meta+c`: Вызывается меню быстрой смены текущего каталога на активной панели
-   `Meta+g`: отмечает первый файл или каталог в отображаемом списке на панели
-   `Meta+h`: Вызов меню последних выполненных команд
-   `Meta+i`: Смена текущего каталога на неактивной панели, на каталог в котором вы находитесь в активной панели
-   `Meta+j`: отмечает последний файл или каталог в отображаемом списке на панели
-   `Meta+n`: Вернуть последующую выполненную командную строку
-   `Meta+o`: неактивная панель переходит в каталог на который указывает активная панель
-   `Meta+p`: Вернуть предыдущую выполненную командную строку
-   `Meta+r`: отмечает средний файл или каталог в отображаемом списке на панели
-   `Meta+t`: Смена режима работы панели (‘Стандартный’,’Укороченный’,’Расширенный’)
-   `Meta+Shift+?`: Вызывается меню расширенного поиска файлов
-   `Meta+Shift+A`, `Ctrl+x Ctrl+p`:	Посылает в командную строку полный путь в нективной панели
-   `Meta+Shift+H`: Отобразить историю каталогов
-   `Ctrl+`: Вызывается меню часто используемых каталогов
-   `Ctrl+l`: Перерисовать экран
-   `Ctrl+o`: Скрытие/показ панелей
-   `Ctrl+r`: перечитать содержимое каталога
-   `Ctrl+s`: Быстрый поиск файла или каталога
-   `Ctrl+Space`: Показать размер текущего каталога
-   `Ctrl+x a`: Отображается список активных соединений виртуальных файловых систем
-   `Ctrl+x c`: Просмотр/правка прав доступа текущего объекта
-   `Ctrl+x i`: Быстрый просмотр информации о текущем объекте на второй панели
-   `Ctrl+x j`: Показ фоновых задач
-   `Ctrl+x l`: Создать жесткую ссылку с текущего объекта
-   `Ctrl+x o`: Просмотр/правка владельца/группы для текущего объекта
-   `Ctrl+x q`: Быстрый просмотр содержимого файла на второй панели
-   `Ctrl+x s`: Создает символьную ссылку symlink для текущего объекта
-   `Ctrl+x t`: Вставка всех выделенных объектов в командную строку
-   `Ctrl+x Ctrl+s`: Редактировать символическую ссылку
-   `Shift+F1`: Вызывается меню быстрого перехода между точками монтирования на левой панели
-   `Shift+F2`: Вызывается меню быстрого перехода между точками монтирования на правой панели
-   `Shift+F3`: Просмотр файла raw без учета расширения
-   `Shift+F4`: Создает новый файл и открывает в редакторе