---
title: "Примеры команд для обработки pdf"
author: ["Dmitry S. Kulyabov"]
date: 2024-04-28T18:02:00+03:00
lastmod: 2024-04-28T20:30:00+03:00
tags: ["pdf"]
categories: ["computer-science"]
draft: false
slug: "examples-pdf-processing-commands"
---

Примеры команд для обработки pdf.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Создание PDF-файла из изображений {#создание-pdf-файла-из-изображений}

С помощью GraphicsMagick :

$ GM Convert 1.jpg 2.jpg 3.jpg out.pdf
С помощью ImageMagick :

$ Magick Convert 1.jpg 2.jpg 3.jpg out.pdf
Обратите внимание, что вывод ImageMagick имеет потери. Для создания PDF-файла без потерь из JPEG используйте img2pdf .


## <span class="section-num">2</span> Объединение PDF-файлов {#объединение-pdf-файлов}

С помощью Ghostscript:

$ gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=out.pdf -dBATCH 1.pdf 2.pdf 3.pdf
С PDFtk:

$ pdftk 1.pdf 2.pdf 3.pdf вывод кота.pdf
С Попплером:

$ pdfunite 1.pdf 2.pdf 3.pdf out.pdf
С QPDF:

$ qpdf --empty --pages 1.pdf 2.pdf 3.pdf -- out.pdf


## <span class="section-num">3</span> Извлечь текст из PDF {#извлечь-текст-из-pdf}

С помощью Poppler и сохранением макета:

$ pdftotext -макет в.pdf out.txt
См. также pdftotext(1) .

С калибром :

$ ebook-convert in.pdf out.txt
Результаты различаются в зависимости от приложения и от PDF-файла.

Расшифровать PDF-файл
В этом разделе перечислены команды для расшифровки PDF-файла в незашифрованный файл. Обратите внимание, что большинство программ просмотра PDF также поддерживают зашифрованные PDF-файлы.

С PDFtk:

$ pdftk in.pdf input_pw вывод пароля out.pdf
С помощью Poppler в PostScript:

$ pdftops -upw пароль in.pdf out.ps
С QPDF:

$ qpdf --decrypt --password= пароль in.pdf out.pdf
Совет: Забытые пароли можно восстановить с помощью pdfcrack , см. pdfcrack(1) .


## <span class="section-num">4</span> Зашифровать PDF-файл {#зашифровать-pdf-файл}

Пароль пользователя используется для шифрования, пароль владельца — для ограничения операций после расшифровки документа. Дополнительную информацию см. в Википедии:PDF#Шифрование и подписи .

С PDFtk:

$ pdftk in.pdf вывод out.pdf user_pw пароль
С ПоДоФо :

$ podofoencrypt -u пароль_пользователя -o пароль_владельца in.pdf out.pdf
С QPDF:

$ qpdf --encrypt user_password  владелец_пароль  длина_ключа -- in.pdf out.pdf
где key_lengthможет быть 40, 128 или 256.


## <span class="section-num">5</span> Извлечение изображений из PDF-файла {#извлечение-изображений-из-pdf-файла}

С помощью poppler сохранение изображений в формате JPEG:

$ pdfimages infile .pdf -j outfileroot


## <span class="section-num">6</span> Извлечение диапазона страниц из PDF, разделение многостраничного PDF-документа {#извлечение-диапазона-страниц-из-pdf-разделение-многостраничного-pdf-документа}

С Ghostscript в виде одного файла [6]

$ gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -dFirstPage= первый -dLastPage= последний -sOutputFile= выходной файл .pdf входящий файл .pdf
С PDFtk как одним файлом:

$ pdftk infile .pdf cat первый — последний выходной файл .pdf
С Poppler в виде отдельных файлов:

$ pdfseparate -f первый -l последний  infile .pdf outfileroot -%d.pdf
Если QPDF представляет собой один файл:

$ qpdf --empty --pages infile .pdf первый - последний -- исходящий файл .pdf
С mutool в виде одного файла:

$ mutool clean -g infile .pdf исходящий файл .pdf первый - последний


## <span class="section-num">7</span> Наложить PDF (nup) {#наложить-pdf--nup}

Наложение PDF — это процесс, при котором несколько входных страниц объединяются в одну выходную страницу, расположенную в сетке строк x столбцов .

Это можно сделать с помощью pdfjam (обратите внимание, что сценарии-оболочки, такие как pdfnup и pdfbook , устарели):

$ pdfjam --nup строк x столбцов  input.pdf --outfile output.pdf
или с pdfsak :

$ pdfsak --input-file input.pdf --output output.pdf --nup rows  columns


## <span class="section-num">8</span> Проверка метаданных {#проверка-метаданных}

С помощью ExifTool :

$ exiftool -Все файлы.pdf
С Попплером:

$ pdfinfo файл.pdf
Удалить метаданные
Использование ExifTool
С помощью ExifTool :

$ exiftool -All= -overwrite_original input.pdf
$ mv input.pdf /tmp/temp.pdf
$ qpdf --линеаризовать /tmp/temp.pdf input.pdf
Шаг линеаризации необходим для предотвращения восстановления удаленных метаданных. См. этот вопрос SuperUser и соответствующую ветку форума ExifTool .

Использование pdftk
Многие PDF-файлы хранят метаданные документа, используя как словарь Info (старая школа), так и поток XMP (новая школа). Эта команда pdftk полностью удаляет поток XMP из PDF-файла. Информационный словарь не удаляется.

Обратите внимание, что объекты внутри PDF-файла могут иметь свои собственные отдельные потоки метаданных XMP, и эта команда не удаляет их. Он удаляет только поток XMP на уровне документа PDF.

$ pdftk input.pdf drop_xmp вывод output.pdf


## <span class="section-num">9</span> Уменьшить размер pdf-файла (сжатие) {#уменьшить-размер-pdf-файла--сжатие}


### <span class="section-num">9.1</span> Ghostscript {#ghostscript}

-   Скрипт ps2pdf:
    ```shell
    ps2pdf -dPDFSETTINGS=/screen in.pdf out.pdf
    ```
-   Команда gs:
    ```shell
    gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -sOutputFile=out.pdf in.pdf
    ```

    -   `-sDEVICE=pdfwrite` : указывает используемое устройство вывода (`pdfwrite` указывает, что результат будет в формате PDF);
    -   `-dCompatibilityLevel` : устанавливает уровень совместимости для оптимизированного PDF-файла (уровень совместимости `1.4` соответствует версии PDF-1.4);
    -   `-dPDFSETTINGS` : определяет параметры качества и сжатия оптимизированного PDF-файла (см. <https://ghostscript.com/docs/9.54.0/Devices.htm>):
        -   `/screen` : 72 dpi;
        -   `/default` : 72 dpi;
        -   `/ebook` : 150 dpi (для просмотра на устройствах для чтения электронных книг);
        -   `/printer` : 300 dpi (для высококачественной печати);
        -   `/prepress` : 300 dpi;
    -   `-dNOPAUSE` : предотвращает паузу Ghostscript между страницами;
    -   `-dQUIET` : подавляет информационные сообщения;
    -   `-dBATCH` : предотвращает выход Ghostscript после обработки входного файла;
    -   `-sOutputFile=output.pdf` : указывает имя выходного файла.


### <span class="section-num">9.2</span> exiftool {#exiftool}

-   Файлы PDF могут содержать метаданные, такие как имена авторов, даты создания и другую информацию, которая может влиять на размер файла.
-   Можно удалить эти метаданные, чтобы уменьшить размер PDF-файла:
    ```shell
    exiftool -all:all= document.pdf
    ```

    -   `-all:all=` : указывает имя тега, который нужно изменить.


## <span class="section-num">10</span> Уменьшить размер pdf-файла (оптимизация) {#уменьшить-размер-pdf-файла--оптимизация}


### <span class="section-num">10.1</span> qpdf {#qpdf}

-   Команда qpdf:
    ```shell
    qpdf --compress-streams=y --object-streams=generate document.pdf qpdf_compressed.pdf
    ```

    -   `--compress-streams=y` : указывает `qpdf` сжимать потоки контента в файле PDF. Потоки контента содержат фактические данные, такие как текст и изображения, в документе PDF;
    -   `--object-streams=generate` : определяет обработку объектных потоков в файле PDF. Опция генерации указывает qpdf генерировать новые потоки объектов во время процесса оптимизации;
    -   `document.pdf` : входной файл для оптимизации;
    -   `qpdf_compressed.pdf` : выходной или оптимизированный файл.


## <span class="section-num">11</span> Растеризовать PDF-файл {#растеризовать-pdf-файл}

Эти команды преобразуют ваш PDF-файл в изображения.

С помощью GraphicsMagick для преобразования определенной страницы в файл изображения:

$ gm Convert -density dpi  входящий файл .pdf[ страница ] исходящий файл .jpg
С помощью ImageMagick для преобразования определенной страницы в файл изображения:

$ Magick Convert -density dpi  входящий файл .pdf[ страница ] исходящий файл .jpg

С помощью ImageMagick конвертируйте все страницы в другой PDF-файл, состоящий из файла изображения на каждой странице:

$ Magick Convert -density dpi  входящий файл .pdf исходящий файл .pdf
Предупреждение. Это существенно увеличит размер вашего PDF-файла. Используйте его, например, если ваш принтер не может правильно распечатать PDF-файл.
С помощью Poppler для преобразования всех страниц в один файл изображения на странице:

$ pdftoppm -jpeg -r dpi  infile .pdf outfileroot
С помощью Poppler для преобразования определенной страницы в файл изображения:

$ pdftoppm -jpeg -r dpi -f page -singlefile infile .pdf outfileroot
Разделить страницы PDF
С помощью инструментов mupdf для разделения каждой страницы по вертикали на две страницы:

$ mutool плакат -y 2 in.pdf out.pdf
Может использоваться для отмены простого наложения .

Добавить изображение
Можно добавить изображение в любое место PDF-файла.

с ImageMagick (конвертировать), xv AUR и pdftk . ( скрипт-обертка )
с журналом AUR
с LibreOffice
Подробности об этих и других решениях можно найти на StackExchange .


## <span class="section-num">12</span> Добавить цифровую подпись в PDF {#добавить-цифровую-подпись-в-pdf}

jsignpdf AUR может подписывать PDF-файлы цифровой подписью с помощью сертификатов X.509 в графическом интерфейсе пользователя и интерфейсе командной строки.

Такие программы чтения, как Okular и MuPDF, могут подписывать PDF-файлы цифровыми подписями. Для этого требуется сертификат PFX, который можно создать с помощью команды OpenSSL :

$ openssl req -x509 -days 365 -newkey rsa:2048 -keyout cert.pem -out cert.pem
$ openssl pkcs12 -export -in cert.pem -out cert.pfx
Пользователи MuPDF могут затем подписывать PDF-файлы с cert.pfxпомощью графического интерфейса или инструмента mutool-sign .

Пользователи Okular должны импортировать сертификаты cert.pfxв хранилище сертификатов, например, в профиль Firefox по умолчанию. [7] [ недействительная ссылка 13 января 2024 г. ⓘ] В Firefox это можно сделать через «Настройки» &gt; «Конфиденциальность и безопасность» &gt; «Просмотр сертификатов» &gt; «Ваши сертификаты» &gt; «Импортировать» и выбрать cert.pfx . После этого Okular предложит использовать этот сертификат при подписании PDF-файлов.

Libreoffice также может подписывать PDF-файлы. [8]


## <span class="section-num">13</span> Удаление аннотаций из PDF-файла {#удаление-аннотаций-из-pdf-файла}

С pdftk [9] :

$ pdftk in.pdf вывод — распаковка | sed '/^\\/Annots/d' | pdftk — сжатие вывода в формате .pdf
С perl-cam-pdf AUR :

$ rewritepdf.pl -C in.pdf out.pdf
См. <https://superuser.com/a/1051543> для получения дополнительной информации.


## <span class="section-num">14</span> Добавьте номера страниц {#добавьте-номера-страниц}

С pdfsak :

$ pdfsak --input-file input.pdf --output output.pdf --text "\large \\$page/\\$pages" br 0.99 0.99 --latex-engine xelatex --font "Noto Regular"


## <span class="section-num">15</span> Добавить метки страниц {#добавить-метки-страниц}

Метки страниц — это логические номера страниц, отображаемые на панели навигации программы чтения PDF-файлов. Они полезны, например, если первые страницы PDF-файла представляют собой индексы, пронумерованные римскими цифрами (I, II и т. д.), а страница с номером «1» соответствует странице PDF-файла с номером больше 1, и вы хотите, чтобы номер страницы отображался на панели навигации соответствует номеру страницы, указанному на физической странице.

Это не следует путать с добавлением номеров страниц на физическую страницу. См. раздел 12.4.2 справочника по PDF, чтобы лучше понять метки страниц.

Используя pagelabels-py , предположим, что у нас есть PDF-файл с именем my_document.pdf, содержащий 12 страниц.
Страницы с 1 по 4 должны быть помечены Intro Iкак Intro IV.
Страницы с 5 по 9 должны быть помечены 2как 6.
Страницы с 10 по 12 должны быть помечены Appendix AкакAppendix C
Мы можем выдать следующий список команд:
$ python3 -m метки страниц --удалить "my_document.pdf"
$ python3 -m метки страниц --startpage 1 --prefix "Введение" --type "римские заглавные буквы" "my_document.pdf"
$ python3 -m метки страниц --startpage 5 --firstpagenum 2 "my_document.pdf"
$ python3 -m метки страниц --startpage 10 --prefix "Приложение" --type "буквы в верхнем регистре" "my_document.pdf"
Примечание. pagelabels-py преобразует ваш файл в формат PDF 1.3.
Используя pdftk , создайте metadata.txtфайл с метками:
PageLabelBegin
PageLabelNewIndex: 1
PageLabelStart: 1
PageLabelPrefix: Обложка
PageLabelNumStyle: Нонумбер
PageLabelBegin
PageLabelNewIndex: 2
PageLabelStart: 1
PageLabelPrefix: задняя обложка
PageLabelNumStyle: Нонумбер
PageLabelBegin
PageLabelNewIndex: 3
PageLabelStart: 1
PageLabelNumStyle: строчные римские цифры
PageLabelBegin
PageLabelNewIndex: 27
PageLabelStart: 1
PageLabelNumStyle: Десятичные арабские цифры
Где:
PageLabelBegin
сигнализирует о том, что последует новое определение метки страницы
PageLabelNewIndex
— индекс страницы PDF, к которому применяется стиль нумерации, считая с единицы. Стиль нумерации будет сохраняться до следующей метки страницы или, если меток страниц больше нет, до конца документа.
PageLabelStart
это стартовый номер. Например, если здесь указать 5, страницы будут пронумерованы 5, 6, 7,...
Префикс PageLabelPrefix
текст, который будет помещен перед числом в метках страниц.
PageLabelNumStyle
может быть DecimalArabicNumerals, UppercaseRomanNumerals, LowercaseRomanNumerals, UppercaseLetters, LowercaseLettersили NoNumber.
Затем используйте:
pdftk book.pdf update_info_utf8 Metadata.txt выходная книга-с-метаданными.pdf
Подробнее см . в этом вопросе SuperUser .


## <span class="section-num">16</span> Извлечь закладки {#извлечь-закладки}

С pdftk:

$ pdftk file.pdf dump_data_utf8 | grep '^Закладка'
С qpdf:

$ qpdf --json --json-key=файл контуров.pdf
См. <https://unix.stackexchange.com/questions/143886/how-to-extract-bookmarks-from-a-pdf-file> для получения дополнительной информации.


## <span class="section-num">17</span> Добавить закладки {#добавить-закладки}

С pdftk
Создайте текстовый файл bookmark_definitions.txtс определениями закладок в следующем формате:

ЗакладкаНачать
ЗакладкаНазвание: Глава 1
Уровень закладки: 1
ЗакладкаНомерСтраницы: 1
ЗакладкаНачать
ЗакладкаНазвание: Глава 1.1
Уровень закладки: 2
ЗакладкаНомерСтраницы: 2
ЗакладкаНачать
ЗакладкаНазвание: Глава 1.2
Уровень закладки: 2
ЗакладкаНомерСтраницы: 3
ЗакладкаНачать
ЗакладкаНазвание: Глава 1.3
Уровень закладки: 2
ЗакладкаНомерСтраницы: 4
ЗакладкаНачать
ЗакладкаНазвание: Глава 1.3.1
Уровень закладки: 3
ЗакладкаНомерСтраницы: 5
ЗакладкаНачать
ЗакладкаНазвание: Глава 2
Уровень закладки: 1
ЗакладкаНомерСтраницы: 6
Где

ЗакладкаНачать
сигнализировать о новом определении закладки
ЗакладкаНазвание
название закладки
Уровень закладки
уровень закладки в иерархии
ЗакладкаНомерСтраницы
номер страницы, на которую перенаправляется закладка
В этом примере приведенный выше файл создаст следующую структуру закладок:

Глава 1
Глава 1.1
Глава 1.2
Глава 1.3
Глава 1.3.1
Глава 2
Примените закладки с помощью следующей команды:

$ pdftk input.pdf update_info_utf8 bookmark_definitions.txt вывод output.pdf
Извлечение страниц, содержащихся в закладке
Чтобы извлечь страницы, содержащиеся в закладке, вы можете использовать pdf_extbook-git AUR .

При этом вам будет подсказано, какую закладку, чьи страницы вы хотите извлечь и куда ее сохранить. Чтобы извлечь все закладки данного иерархического уровня: pdf_extbook file

$ файл pdf_extbook - уровень  выходного_файла_stem
Удалить пустые страницы
Можно использовать следующий скрипт для удаления пустых страниц из PDF-файла (кредит: сообщение SuperUser ):

\#!/бин/ш

ИН="\\(1"
filename=\\)(базовое имя "\\({IN}")
filename="\\){filename%.\*}"
PAGES=$(pdfinfo "$IN" | grep ^Pages: | tr -dc '0-9')

non_blank() {
	для я в $(seq 1 \\(PAGES); делать
		PERCENT=\\)(gs -o - -dFirstPage=\\({i} -dLastPage=\\){i} -sDEVICE=ink_cov "$IN" | grep CMYK | nawk 'BEGIN { sum=0; } {sum += $1 + $2 + $3 + $4;} END { printf "%.5f\n", sum } ')
		if [ $(echo "$PERCENT &gt; 0,001" | bc) -eq 1 ]; затем
			эхо $i
			#echo $i 1&gt;&amp;2
		быть
		эхо -н. 1&gt;&amp;2
	сделано | тройник "$filename.tmp"
	эхо 1&gt;&amp;2
}

установить +х
pdftk "${IN}" cat \\((non\_blank) вывод "\\){filename}_noblanks.pdf"
Используйте его как pdf_remove_blank_pages input.pdf.

Для сценария необходимы pdftk , nawk и Ghostscript .

Найдите шрифты, используемые в PDF-файле
Команду pdffonts (1) (из poppler ) можно использовать, чтобы узнать, какие шрифты используются в PDF-файле и встроены ли они в него или нет:

$ файл pdffonts .pdf
имя типа кодировка emb sub uni идентификатор объекта
------------------------------------ -------------- --- ---------------- --- --- --- ---------
Times-Roman Type 1 Пользовательский нет нет нет 8 0
Times-Italic Type 1 Стандартный нет нет нет 9 0
Times-Bold Type 1 Стандартный нет нет нет 7 0
Helvetica Тип 1 Стандартный нет нет нет 34 0
Helvetica-Bold Type 1 Стандартный нет нет нет 35 0
Это можно использовать при возникновении проблем с правильным отображением текста в PDF-файле, чтобы определить, нужно ли устанавливать отсутствующие шрифты или их метрически-совместимый эквивалент .


## <span class="section-num">18</span> Восстановить поврежденный PDF-файл {#восстановить-поврежденный-pdf-файл}

С помощью скрипта-призрака :

$ gs -o отремонтированный.pdf -sDEVICE=pdfwrite -dPDFSETTINGS=/препресс поврежден.pdf
С попплером :

$ pdftocairo -pdf поврежден.pdf  восстановлен.pdf
С помощью инструментов mupdf :

$ mutool очистить поврежденный.pdf  восстановленный.pdf
Ссылка: <https://superuser.com/q/278562>


## <span class="section-num">19</span> Конвертируйте PDF в стандарт PDF/A {#конвертируйте-pdf-в-стандарт-pdf-a}

С помощью скрипта-призрака :

$ gs -dPDFA -dBATCH -dNOPAUSE -sColorConversionStrategy=UseDeviceIndependentColor -sDEVICE=pdfwrite -dPDFACompatibilityPolicy=2 -sOutputFile= document_pdfa.pdf  document.pdf
Ссылка: <https://stackoverflow.com/a/56459053>


## <span class="section-num">20</span> Проверка соответствия PDF/A {#проверка-соответствия-pdf-a}

Используя verapdf AUR, вы можете проверить соответствие вашего PDF различным вариантам стандарта PDF/A:

$ verapdf --flavour 1a --формат текстового документа.pdf
