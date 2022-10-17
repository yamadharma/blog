---
title: "Использование vagrant"
author: ["Dmitry S. Kulyabov"]
date: 2021-11-12T12:11:00+03:00
lastmod: 2022-10-08T21:19:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "using-vagrant"
---

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Подготовка образа {#подготовка-образа}


### <span class="section-num">1.1</span> Общая информация {#общая-информация}

-   Подготовка образа проводится с помощью _Packer_.
-   Сайт: <https://www.packer.io/>


### <span class="section-num">1.2</span> Описание установки {#описание-установки}

-   Ранее использовался язык описания JSON.
-   После _Packer-1.5_ используется формат HCL2.


## <span class="section-num">2</span> Операционные системы {#операционные-системы}


### <span class="section-num">2.1</span> Windows {#windows}


#### <span class="section-num">2.1.1</span> Запуск Vagrant под Windows в текущем каталоге {#запуск-vagrant-под-windows-в-текущем-каталоге}

-   Следует задать переменные окружения
    ```shell
    setx VAGRANT_HOME "X:/your/path/.vagrant.d" /M
    setx VAGRANT_DOTFILE_PATH "X:/your/path/.vagrant" /M
    setx VBOX_USER_HOME "X:/your/path/.vbox" /M
    setx VBOX_INSTALL_PATH "X:/your/path/vm" /M
    ```

    -   Команда `setx` добавляет переменные в постоянный список переменных окружения.
    -   Модификатор `/M` добавляет переменные в системное окружение.
    -   Без этого модификатора переменные будут добавляться в окружение пользователя.
