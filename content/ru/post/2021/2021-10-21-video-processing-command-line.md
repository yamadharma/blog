---
title: "Обработка видео. Командная строка"
author: ["Dmitry S. Kulyabov"]
date: 2021-10-21T17:26:00+03:00
lastmod: 2023-07-13T12:18:00+03:00
categories: ["computer-science"]
draft: false
slug: "video-processing-command-line"
---

Обработка видео. Командная строка

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Инструментарий {#инструментарий}


### <span class="section-num">1.1</span> ffmpeg {#ffmpeg}

-   Комплексное решение по обработке видео.
-   Установка
    -   Linux
        -   Gentoo
            ```shell
            emerge media-video/ffmpeg
            ```


### <span class="section-num">1.2</span> mkvtoolnix {#mkvtoolnix}

-   Инструменты для создания, изменения и проверки файлов формата Matroska.
-   Установка
    -   Linux
        -   Gentoo
            ```shell
            emerge media-video/mkvtoolnix
            ```


## <span class="section-num">2</span> Задачи {#задачи}


### <span class="section-num">2.1</span> Перекодирование звуковой дорожки в видеофайле {#перекодирование-звуковой-дорожки-в-видеофайле}

-   Есть видеофайлы (в частности, в формате `mp4`).
-   При проигрывании на телевизоре нет звука.
-   Причина: звуковая дорожка закодирована с частотой дискретизации 48 кГц, а телевизор воспринимает только с частотой дискретизации 44,1 кГц.
-   В видеофайле одна видео-дорожка и одна аудио-дорожка.
-   Для перекодирования сделан командный файл:
    ```shell
    #!/bin/bash
    # recode-48to44.1

    OUTDIR_AUDIO=recoded-audio
    OUTDIR=recoded
    mkdir -p ${OUTDIR}
    mkdir -p ${OUTDIR_AUDIO}

    for i in *.mp4
    do
        NAME=`basename "${i}" .mp4`
        ffmpeg -i "${i}" -vn -ar 44100 -c:a libfdk_aac -b:a 192k "${OUTDIR_AUDIO}"/"${NAME}".aac
        mkvmerge --default-language rus -o "${OUTDIR}"/"${NAME}".mkv --language 1:rus "${i}" --default-track 0:1 "${OUTDIR_AUDIO}"/"${NAME}".aac
    done
    ```
-   Сначала мы с помощью `ffmeg` перекодируем аудио-дорожку:
    -   `-vn` : игнорирование видео-дорожек;
    -   `-ar 44100` : частота дискретизации 44,1 кГц;
    -   `-c:a libfdk_aac` : задаём кодек для формата AAC;
    -   `-b:a 192k` : задаём битрейт.
-   С помощью `mkvmerge` сливаем файлы в новый (формата `mkv`):
    -   `--default-language rus` : задаём язык по умолчанию для дорожек;
    -   `--language 1:rus` : меняем язык аудио-дорожки в исходном файле;
    -   `--default-track 0:1` : ставим новую звуковую дорожку дорожкой по умолчанию.
