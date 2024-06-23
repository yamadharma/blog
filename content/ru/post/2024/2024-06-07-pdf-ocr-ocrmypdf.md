---
title: "Распознавание pdf. OCRmyPDF"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-07T21:07:00+03:00
lastmod: 2024-06-22T18:08:00+03:00
tags: ["pdf", "read"]
categories: ["computer-science"]
draft: false
slug: "pdf-ocr-ocrmypdf"
---

Распознавание pdf. OCRmyPDF

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/ocrmypdf/OCRmyPDF>
-   Сайт: <https://ocrmypdf.readthedocs.io/>


## <span class="section-num">2</span> Примеры использования {#примеры-использования}

-   Список языков для распознавания:
    ```shell
    tesseract --list-langs
    ```
-   Преобразовать сканированный файл в файл PDF/A с распознаванием русского и английского языков:
    ```shell
    ocrmypdf -l rus+eng input.pdf output.pdf
    ```
-   Заменить отсканированный PDF-файл PDF/A-файлом:
    ```shell
    ocrmypdf input.pdf
    ```
-   Пропустить страницы входного PDF-файла смешанного формата, которые уже содержат текст:
    ```shell
    ocrmypdf --skip-text input.pdf output.pdf
    ```
-   Очистите, исправьте перекос и поверните плохо отсканированные страницы:
    ```shell
    ocrmypdf --clean --deskew --rotate-pages input.pdf output.pdf
    ```
-   Задать метаданные PDF-файла:
    ```shell
    ocrmypdf --title "<title>" --author "<author>" --subject "<subject>" --keywords "<keyword; key phrase; ...>" input_file.pdf output.pdf
    ```
