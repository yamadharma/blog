---
title: "Windows. Автоустановка. Простой файл ответов"
author: ["Dmitry S. Kulyabov"]
date: 2023-06-08T16:47:00+03:00
lastmod: 2023-06-08T17:24:00+03:00
tags: ["sysadmin", "windows"]
categories: ["computer-science"]
draft: false
slug: "windows-unattended-simple-autounattend"
---

## <span class="section-num">1</span> Windows. Автоустановка. Простой файл ответов {#2023-06-08-windows-unattended-simple-autounattend}

<!--more-->

{{< toc >}}


### <span class="section-num">1.1</span> Файл ответов {#файл-ответов}

-   За счет файла значительно сокращается количество экранов программы установки, из которых остаются только:
    -   выбор издания
    -   управление дисками
    -   подключение к Wi-Fi
    -   пароль учетной записи (можно задать)
-   Файл предназначен для 64-разрядной Windows. Сохраните его с именем `autounattend.xml`
