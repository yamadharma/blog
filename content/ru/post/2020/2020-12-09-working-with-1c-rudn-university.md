---
title: "Работа с 1С в РУДН"
author: ["Dmitry S. Kulyabov"]
date: 2020-12-09T11:35:00+03:00
lastmod: 2023-01-11T09:45:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "working-with-1c-rudn-university"
---

Работа с 1С в РУДН.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Модули 1С {#модули-1с}


### <span class="section-num">1.1</span> Управление ВУЗом {#управление-вузом}


#### <span class="section-num">1.1.1</span> Тонкий клиент {#тонкий-клиент}

-   Рекомендуемое название: ВУЗ
-   Кластер серверов: 192.168.125.103:1941
-   Имя ИБ: `VUZ_RUDN`


#### <span class="section-num">1.1.2</span> Web-клиент {#web-клиент}

-   Ссылка: <https://eisweb.rudn.ru/VUZ_RUDN/>
-   Расположение базы: На сервере


### <span class="section-num">1.2</span> Расписание {#расписание}


#### <span class="section-num">1.2.1</span> Тонкий клиент {#тонкий-клиент}

-   Рекомендуемое название: Расписание
-   Сервер: 192.168.125.107
-   Имя ИБ: `RASP_RUDN`
-   Замечание: Если после настройки отображается ошибка установки соединения, необходимо вручную прописать в файл `/etc/hosts` локальной машины сопоставление DNS-имени сервера 1C:
    ```conf-unix
    192.168.125.107 rasp1cserapp
    ```
