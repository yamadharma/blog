---
title: "Создание сайта на Hugo"
author: ["Dmitry S. Kulyabov"]
date: 2022-04-12T20:49:00+03:00
lastmod: 2022-04-14T15:45:00+03:00
tags: ["hugo"]
categories: ["computer-science"]
draft: false
slug: "creating-hugo-site"
---

Быстрое развертывание сайта на GitHub Pages с помощью генератора статического html _Hugo_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Установка Hugo {#установка-hugo}


### <span class="section-num">1.1</span> Необходимое программное обеспечение {#необходимое-программное-обеспечение}


### <span class="section-num">1.2</span> Установка в различных операционных системах {#установка-в-различных-операционных-системах}

-   Linux
    -   Ubuntu:

        ```shell
        sudo apt-get install hugo
        ```
-   Windows
    -   Chocolatey

        ```shell
        choco install hugo-extended
        ```


## <span class="section-num">2</span> Создание структуры сайта {#создание-структуры-сайта}


## <span class="section-num">3</span> Установка темы (внешнего вида) сайта {#установка-темы--внешнего-вида--сайта}


## <span class="section-num">4</span> Настройка сайта {#настройка-сайта}


## <span class="section-num">5</span> Публикация сайта {#публикация-сайта}


## <span class="section-num">6</span> Добавление контента {#добавление-контента}

Теперь рассмотрим последовательность действий подробнее:

1.  Установка Hugo

На официальном сайте целая куча вариантов установки Hugo на различные
системы.

Например, для Ubuntu Linux:

```sh
sudo apt-get install hugo
```

2.  Структура сайта

<!--listend-->

```sh
ls ~/work/blog

archetypes  config.toml  content  data  docs  layouts  README.md  static  themes
```

Рассмотрим подробнее:

-   archetypes Каталог, содержащий шаблоны новых md-файлов, которые
    создает Hugo с помощью команды hugo new
-   config.toml Основной конфиг сайта
-   content Каталог данных, из которых Hugo будет генерировать сайт
-   data Каталог дополнительных данных, которые непосредственно не
    учавствуют в генерации сайта
-   docs Корень генерируемого сайта. Этот каталог не создается Hugo, мы
    его получили при заведении репозитория на GitHub и ниже мы его
    пропишем в файле config.toml
-   layouts Содержит шаблоны сайта
-   static Каталог для статических данных (изображения, CSS, JavaScript и
    т.д.)
-   themes Каталог для тем оформления сайта
