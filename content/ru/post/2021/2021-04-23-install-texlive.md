---
title: "Установка TeXlive"
author: ["Dmitry S. Kulyabov"]
date: 2021-04-23T18:09:00+03:00
lastmod: 2023-07-31T17:38:00+03:00
tags: ["tex"]
categories: ["computer-science"]
draft: false
slug: "install-texlive"
---

Установка дистрибутива _TeXlive_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   TeX Live --- наиболее полный дистрибутив LaTeX, поддерживаемый TeX-сообществом.
-   Поддерживает большое количество операционных систем.
-   Разрабатывается начиная с 1996 года.
-   Был основан на дистрибутиве teTeX.
-   MacTeX --- вариант для MacOS.
-   Основная страница: <https://www.tug.org/texlive/>.
-   TeX Live --- это дистрибутив с непрерывным обновлением в рамках ежегодной версии дистрибутива.


## <span class="section-num">2</span> Сетевая установка на один компьютер {#сетевая-установка-на-один-компьютер}


### <span class="section-num">2.1</span> Установка с помощью дистрибутивных скриптов {#установка-с-помощью-дистрибутивных-скриптов}

-   Ссылки на сайте даны зеркала. Зеркало выбирается автоматически.
    -   Скачивается инсталлятор:
        -   Unix: <https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz>
            ```shell
            cd /tmp/
            wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
            ```
        -   Windows: <https://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe>
    -   Для Windows: запускаете исполняемый файл и устанавливаете.
    -   Для Linux
        -   Распаковываете скачанный файл:
            ```shell
            tar xzvf install-tl-unx.tar.gz
            ```
        -   Заходите в распакованный каталог и запускаете установщик:
            ```shell
            cd install-tl-[0-9]*
            ./install-tl
            ```

            -   Рекомендуется создать ссылки на исполняемые файлы в каталоге `/usr/local/bin`. Для этого в консольном варианте утилиты выберите опцию `O`, а затем `L`. Для возврата в предыдущее меню используйте `R`.


### <span class="section-num">2.2</span> Установка с помощью менеджера пакетов {#установка-с-помощью-менеджера-пакетов}

-   Windows. Используйте пакетный менеджер Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "2021-01-18-package-manager-windows-chocolatey" >}})).
    ```shell
    choco install texlive
    ```


## <span class="section-num">3</span> Поддержка сетевой установки на нескольких компьютерах {#поддержка-сетевой-установки-на-нескольких-компьютерах}


### <span class="section-num">3.1</span> Файл-сервер {#файл-сервер}

-   На файл-сервере хранится копия архива TeX Live.
-   Храним её в каталоге `/com/lib/portage/extras/texlive` (естественно, можно выбрать любой).
-   Данный каталог расшариваем по NFS (например).
-   Сделаем скрипт для ежедневного скачивания:
    ```shell
    #!/bin/bash
    # /etc/cron.daily/texlive-rsync-tree

    RSYNC_MIRROR=rsync://mirrors.mi.ras.ru/CTAN/

    mkdir -p /com/lib/portage/extras/texlive
    rsync -rltpD -v -HS --delete ${RSYNC_MIRROR}/systems/texlive/tlnet/ /com/lib/portage/extras/texlive
    ```


### <span class="section-num">3.2</span> Клиенты {#клиенты}


#### <span class="section-num">3.2.1</span> Установка {#установка}

-   На клиентах вначале устанавливаем вручную. Для этого на клиенте запускаем:
    ```shell
    /com/lib/portage/extras/texlive/install-tl --repository=/com/lib/portage/extras/texlive
    ```


### <span class="section-num">3.3</span> Обновление {#обновление}

-   Для обновления используем на клиенте скрипт:
    ```shell
    #!/bin/bash
    # /etc/cron.weekly/texlive-update

    if [[ -d /com/lib/portage/extras/texlive ]]
    then
        tlmgr update --repository=/com/lib/portage/extras/texlive --self
        tlmgr update --repository=/com/lib/portage/extras/texlive --all
    else
        tlmgr update --self
        tlmgr update --all
    fi
    ```


## <span class="section-num">4</span> Обновление до следующей версии TeXlive {#обновление-до-следующей-версии-texlive}

-   Рекомендуется установить новую версию TeXlive отдельно.
-   Но можно сделать ручное обновление, используя уже существующую установку.
-   Будем считать, что у нас архитектура `x86_64-linux`.
-   Если вы установили символические ссылки в системные каталоги (через опцию установщика или `tlmgr path add`), удалите их:
    ```shell
    tlmgr path remove
    ```
-   Перенесите весь каталог TeXlive так, чтобы он соответствовал новой версии, например:
    ```shell
    mv /usr/local/texlive/2022/ /usr/local/texlive/2023
    ```
-   Удалите бекапы пакетов:
    ```shell
    rm /usr/local/texlive/2023/tlpkg/backups/*
    ```
-   Создайте ссылки на исполняемые файлы:
    ```shell
    /usr/local/texlive/2023/bin/x86_64-linux/tlmgr path add
    ```
-   Загрузите последнюю версию скрипта `update-tlmgr-latest.sh`:
    ```shell
    cd /tmp
    wget https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh
    ```
-   Запустите скрипт:
    ```shell
    sh ./update-tlmgr-latest.sh -- upgrade
    ```
-   Если вы не хотите использовать репозиторий по умолчанию для загрузки новых файлов, то замените его:
    ```shell
    tlmgr option repository <reponame>
    ```
-   Обновите менеджер пакетов TeXlive:
    ```shell
    tlmgr update --self
    ```
-   Обновите пакеты TeXlive:
    ```shell
    tlmgr update --all
    ```
-   Установите символические ссылки на исполняемые файлы в системные каталоги (`/usr/local/bin`):
    ```shell
    tlmgr path add
    ```
-   Можно пересоздать кэш _lualatex_ под пользователем:
    ```shell
    rm -rvf ~/.texlive2022
    luaotfload-tool -fu
    ```

    -   Если этого не сделать, то кэш будет пересоздан при первом запуске `lualatex`.
