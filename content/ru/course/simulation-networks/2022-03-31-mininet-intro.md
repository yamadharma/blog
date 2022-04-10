---
title: "Введение в Mininet"
author: ["Dmitry S. Kulyabov"]
date: 2022-03-31T16:10:00+03:00
lastmod: 2022-04-07T19:35:00+03:00
tags: ["network", "education"]
categories: ["science", "computer-science"]
draft: false
weight: 201
toc: true
type: "book"
slug: "mininet-intro"
summary: "Введение в Mininet"
menu:
  "simulation-networks-lab":
    identifier: "введение-в-mininet"
    parent: "simulation-networks"
    weight: 201
---

Введение в средство натурного моделирования _Mininet_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Настройка стенда виртуальной машины _Mininet_ {#настройка-стенда-виртуальной-машины-mininet}


### <span class="section-num">1.1</span> Общая информация {#общая-информация}

-   Репозиторий _Mininet_: <https://github.com/mininet/mininet>
-   Образ виртуальной машины: [mininet-2.3.0-210211-ubuntu-20.04.1-legacy-server-amd64-ovf](https://github.com/mininet/mininet/releases/download/2.3.0/mininet-2.3.0-210211-ubuntu-20.04.1-legacy-server-amd64-ovf.zip)


### <span class="section-num">1.2</span> Настройка образа {#настройка-образа}


#### <span class="section-num">1.2.1</span> VirtualBox {#virtualbox}

-   Распакуйте скачанный образ.
-   Импортируйте файл `.ovf`.
-   Перейдите в настройки.
-   Добавьте дополнительный сетевой адаптер _host-only network adapter_, который вы можете использовать для входа в образ виртуальной машины.


### <span class="section-num">1.3</span> Подключение к виртуальной машине {#подключение-к-виртуальной-машине}

-   Залогиньтесь в виртуальной машине:
    -   login: mininet
    -   password: mininet
-   Посмотрите адрес машины:

    ```shell
    ifconfig
    ```

    -   Внутренний адрес машины будет иметь вид 192.168.x.y.
-   Подключитесь к виртуальной машине (из терминала хостовой машины):

    ```shell
    ssh -Y mininet@192.168.x.y
    ```
-   Настройте вход по ключу (см. [Ключи ssh]({{< relref "2022-02-17-ssh-keys" >}})):

    ```shell
    ssh-copy-id mininet@192.168.x.y
    ```


### <span class="section-num">1.4</span> Настройка параметров _XTerm_ {#настройка-параметров-xterm}

-   По умолчанию _XTerm_ использует растровые шрифты, малого кегля.
-   Предлагается использовать векторные шрифты, кегль увеличить до 12--16 пунктов.
-   Для этого добавим в файл конфигурации `/etc/X11/app-defaults/XTerm`:

    ```conf-unix
    xterm*faceName: Monospace
    xterm*faceSize: 14
    ```

    -   Здесь выбран системный моноширинный шрифт, кегль шрифта --- 14 пунктов.


### <span class="section-num">1.5</span> Настройка соединения X11 для суперпользователя {#настройка-соединения-x11-для-суперпользователя}

-   При попытке запуска приложения из-под суперпользователя возникает ошибка:

    ```text
    X11 connection rejected because of wrong authentication.
    ```
-   Ошибка возникает из-за того, что X-соединение выполняется от имени пользователя `mininet`, а приложение запускается от имени пользователя `root` с использованием `sudo`.
-   Для исправления этой ситуации заполним файл полномочий `/root/.Xauthority`, используя утилиту `xauth`.
-   Для этого скопируем значение куки (MIT magic cookie) пользователя `mininet` в файл для пользователя `root`:

    ```shell
    mininet@mininet-vm:~$ xauth list $DISPLAY
    mininet-vm/unix:10  MIT-MAGIC-COOKIE-1  295acad8e35d17636924c5ab80e8462d

    mininet@mininet-vm:~$ sudo -i
    mininet@mininet-vm:~$ xauth list
    xauth:  file /root/.Xauthority does not exist
    root@mininet-vm:~# xauth add mininet-vm/unix:10  MIT-MAGIC-COOKIE-1  24fa6c77c26e2073d5b0d95e574e2456
    root@mininet-vm:~# xauth list $DISPLAY
    mininet-vm/unix:10  MIT-MAGIC-COOKIE-1  295acad8e35d17636924c5ab80e8462d
    ```

    -   Значение для _MIT-MAGIC-COOKIE_ приведено условно.
-   После этого должны запускаться графические приложения.


### <span class="section-num">1.6</span> Работа с Mininet из-под Windows {#работа-с-mininet-из-под-windows}


#### <span class="section-num">1.6.1</span> Варианты Xserver {#варианты-xserver}

-   Использовать можно любой вариант Xserver.

<!--list-separator-->

1.  VcXsrv Windows X Server

    -   Сайт: <https://sourceforge.net/projects/vcxsrv/>
    -   Лицензия: GPLv3.
    -   Компиляция: Visual C++ 2012 Express Edition

<!--list-separator-->

2.  Xming X Server

    -   Сайт: <http://www.straightrunning.com/XmingNotes/>
    -   Лицензия:
        -   _Public Domain Release_: MIT
        -   _Website Release_: за загрузку новых выпусков необходимо вносить плату; приобретение лицензии дает пользователю доступ к новым загрузкам в течение одного года.
    -   Компиляция: MinGW, Pthreads-Win32.


#### <span class="section-num">1.6.2</span> Установка программного обеспечения {#установка-программного-обеспечения}

-   Установите `putty`:

    ```shell
    choco install putty
    ```
-   Установите VcXsrv Windows X Server

    ```shell
    choco install vcxsrv
    ```


#### <span class="section-num">1.6.3</span> Запуск Xserver {#запуск-xserver}

-   Запустите `XLaunch`.
-   Выберите опции:
    -   _Multiple windows_;
    -   _Display number_: -1;
    -   _Start no client_.
-   Можно сохранить параметры, тогда при следующем запуске не нужно будет отмечать эти опции.


#### <span class="section-num">1.6.4</span> Запуск putty {#запуск-putty}

-   При подключении добавьте опцию перенаправления X11:
    -   Connection, SSH, X11 : _Enable X11 forwarding_.


## <span class="section-num">2</span> Основы работы в _Mininet_ {#основы-работы-в-mininet}


## <span class="section-num">3</span> Видео {#видео}


### <span class="section-num">3.1</span> Youtube {#youtube}


#### <span class="section-num">3.1.1</span> Виртуальная машина Mininet {#виртуальная-машина-mininet}

{{< youtube ZjA4bjiO_DM >}}


#### <span class="section-num">3.1.2</span> Работа с Mininet из-под Windows {#работа-с-mininet-из-под-windows}

{{< youtube KPQMokxQ4Gw >}}


### <span class="section-num">3.2</span> Rutube {#rutube}


#### <span class="section-num">3.2.1</span> Виртуальная машина Mininet {#виртуальная-машина-mininet}

{{< rutube 3afa7009a47f1f5d44d53e282d0d5fe4 >}}


#### <span class="section-num">3.2.2</span> Работа с Mininet из-под Windows {#работа-с-mininet-из-под-windows}

{{< rutube c98ef1bb6b01c1e463854464e20cd1f3 >}}
