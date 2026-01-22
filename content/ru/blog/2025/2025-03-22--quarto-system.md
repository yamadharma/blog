---
title: "Система Quarto"
author: ["Dmitry S. Kulyabov"]
date: 2025-03-22T17:37:00+03:00
lastmod: 2025-12-14T20:15:00+03:00
tags: ["science-writing", "markdown"]
categories: ["computer-science"]
draft: false
slug: "quarto-system"
---

Система Quarto.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Сайт: <https://quarto.org/>
-   Репозиторий: <https://github.com/quarto-dev/quarto-cli>
-   Quarto — это современная система для создания научной, технической и прочей документации.
-   Входной язык: Markdown.
-   Выходные форматы: html, pdf, epub, docx, презентации в формате reveal.js.
-   Интеграция с языками программирования: R, Python, Julia, Observable JS.
    -   Интеграция как в babel (см. [Emacs. Org Babel]({{< relref "20221015212100-emacs_org_babel.md" >}})) или julyter.
    -   Позволяет включать в документы интерактивные элементы, такие как виджеты и динамические визуализации.


## <span class="section-num">2</span> Установка {#установка}


### <span class="section-num">2.1</span> Windows {#windows}

-   Chocolatey (см. [Пакетный менеджер для Windows. Chocolatey]({{< relref "20210118112300-пакетныи_менеджер_для_windows_chocolatey.md" >}})):
    ```shell
    choco install quarto
    ```


### <span class="section-num">2.2</span> Linux {#linux}


#### <span class="section-num">2.2.1</span> Linux в общем {#linux-в-общем}

-   Установка с помощью скрипта:
    ```shell
    #!/bin/bash

    ## Система
    TARGET=/opt
    TARGET_BIN=/usr/local/bin
    ## Домашний каталог
    # TARGET=~/opt
    # TARGET_BIN=~/.local/bin


    ## Получить тег
    TAG=`basename $(curl -sL -o /dev/null -w %{url_effective} https://github.com/quarto-dev/quarto-cli/releases/latest)`
    TAG=${TAG/v/}

    ## Скачать
    cd /tmp
    wget https://github.com/quarto-dev/quarto-cli/releases/download/v${TAG}/quarto-${TAG}-linux-amd64.tar.gz

    ## Распаковать
    mkdir -p ${TARGET}
    tar -C ${TARGET} -xvzf /tmp/quarto-${TAG}-linux-amd64.tar.gz
    mv ${TARGET}/quarto-${TAG} ${TARGET}/quarto

    ## Симлинк на исполняемый файл
    mkdir -p ${TARGET_BIN}
    ln -s ${TARGET}/quarto/bin/quarto ${TARGET_BIN}/quarto
    ```


#### <span class="section-num">2.2.2</span> Gentoo {#gentoo}

-   Gentoo, репозиторий karma (см. [Gentoo. Репозиторий karma]({{< relref "20240525205200-gentoo_репозитории_karma.md" >}})):
    ```shell
    emerge quarto
    ```


#### <span class="section-num">2.2.3</span> Arch {#arch}

-   Arch linux:
    ```shell
    pacman -S quarto-cli-bin
    ```
-   Manjaro linux:
    ```shell
    pamac install quarto-cli-bin
    ```


#### <span class="section-num">2.2.4</span> Fedora {#fedora}

-   Установка из CORP:
    ```shell
    sudo dnf -y copr enable iucar/rstudio
    sudo dnf -y install quarto
    sudo dnf -y install libxcrypt-compat
    ```


## <span class="section-num">3</span> Установка модулей {#установка-модулей}

-   Установка tinytex:
    ```shell
    quarto install tinytex
    ```


## <span class="section-num">4</span> Общий алгоритм работы {#общий-алгоритм-работы}

```mermaid
flowchart LR
  A{Выбираем тип проекта} --> B(Редактируем YAML)
  B --> C(Пишем текст и код)
  B --> D(Добавляем изображения)
  C --> E(Настраиваем отображение)
  D --> E
  E <--> B
  E --> F[Публикация]

  classDef optional stroke-dasharray:10;
  class D optional
  class E optional
```


## <span class="section-num">5</span> Использование {#использование}

-   [Quarto. Язык markdown]({{< relref "20250323T203600--quarto_язык_markdown.md" >}})
-   [Quarto. Оформление метаданных]({{< relref "20250323T202400--quarto_оформление_метаданных.md" >}})
-   [Quarto. Цитирование]({{< relref "20250323T202900--quarto_цитирование.md" >}})
-   [Quarto. Перекрёстные ссылки]({{< relref "20250323T203300--quarto_перекрестные_ссылки.md" >}})
-   [Quarto. Структура для книги]({{< relref "20250327T163300--quarto_структура_для_книги.md" >}})
-   [Quarto. Формат pdf]({{< relref "20250327T163600--quarto_формат_pdf.md" >}})
-   [Quarto. Листинги]({{< relref "20250513T160400--quarto_листинги.md" >}})
-   [Quarto. Таблицы]({{< relref "20250517T154200--quarto_таблицы.md" >}})
-   [Quarto. Плагины]({{< relref "20250903T205300--quarto_плагины.md" >}})
-   [Quarto. Профили]({{< relref "20251008T194500--quarto_профили.md" >}})
-   [Quarto. Подключение файлов]({{< relref "20251119T211500--quarto_подключение_фаилов.md" >}})


## <span class="section-num">6</span> Ресурсы {#ресурсы}

-   Набор шаблонов для дипломов: <https://github.com/Jupyter4Science/awesome-quarto-thesis>
