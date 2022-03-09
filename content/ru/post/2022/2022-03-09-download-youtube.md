---
title: "Закачка с youtube"
author: ["Dmitry S. Kulyabov"]
date: 2022-03-09T17:38:00+03:00
lastmod: 2022-03-09T18:40:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "download-youtube"
---

Возникла задача скопировать видео с Youtube. Основная часть содержимого --- это мои видеозаписи для преподавания.
Для этой задачи я использовал `yt-dlp`.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/yt-dlp/yt-dlp>
-   Является продвинутым форком `youtube-dl`.


## <span class="section-num">2</span> Скачивание своего общедоступного видео с Youtube {#скачивание-своего-общедоступного-видео-с-youtube}


### <span class="section-num">2.1</span> Постановка задачи {#постановка-задачи}

-   Видео добавлены в плейлисты по темам.
-   Есть ссылки на чужие видео.
-   Скачать нужно только своё общедоступное видео.
-   Следует сохранить порядок расположения видео в плейлистах.


### <span class="section-num">2.2</span> Решение {#решение}

-   `%(playlist)s` : будем сортировать виде по плейлистам.
-   `%(playlist_index)s` : будем сохранять номер видео в плейлисте.
-   `%(title)s.%(ext)s` : будем сохранять видео с его названием.
-   `--write-comments` : будем сохранять всю дополнительную информацию в отдельный файл формата `json`.
-   `--match-filter "uploader = 'Dmitry Kulyabov'"` : будем скачивать только те видео, который загрузили мы сами.


#### <span class="section-num">2.2.1</span> Итоговый скрипт {#итоговый-скрипт}

-   Итоговый скрипт будет иметь следующий вид:

    ```shell
    yt-dlp -o "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "https://www.youtube.com/user/<youtube user name>/playlists" --write-comments --match-filter "uploader = 'Dmitry Kulyabov'"
    ```
