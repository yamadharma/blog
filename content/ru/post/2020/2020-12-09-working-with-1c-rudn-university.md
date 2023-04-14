---
title: "Работа с 1С в РУДН"
author: ["Dmitry S. Kulyabov"]
date: 2020-12-09T11:35:00+03:00
lastmod: 2023-02-06T09:53:00+03:00
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


### <span class="section-num">1.2</span> Расписание {#расписание}


#### <span class="section-num">1.2.1</span> Тонкий клиент {#тонкий-клиент}

-   Рекомендуемое название: Расписание
-   Сервер: 192.168.125.107
-   Имя ИБ: `RASP_RUDN`
-   Замечание: Если после настройки отображается ошибка установки соединения, необходимо вручную прописать в файл `/etc/hosts` локальной машины сопоставление DNS-имени сервера 1C:
    ```conf-unix
    192.168.125.107 rasp1cserapp
    ```


### <span class="section-num">1.3</span> Итилиум {#итилиум}

-   Система Service Desk Итилиум --- управление IT-услугами на платформе 1С.
-   Сайт: <https://itilium.ru/service-desk>.


#### <span class="section-num">1.3.1</span> Тонкий клиент {#тонкий-клиент}

-   Рекомендуемое название: Итилиум
-   Кластер серверов: 192.168.125.103:2441
-   Имя ИБ: `ITL_RUDN`


#### <span class="section-num">1.3.2</span> Web-клиент {#web-клиент}

-   Ссылка: <https://eisweb.rudn.ru/ITL_RUDN/>


#### <span class="section-num">1.3.3</span> Мобильное приложение {#мобильное-приложение}

-   Android: <https://play.google.com/store/apps/details?id=com.desnol.itiliummobile.itiliummobile&hl=ru>.
-   iOS: <https://itunes.apple.com/ru/app/%D0%B8%D1%82%D0%B8%D0%BB%D0%B8%D1%83%D0%BC/id1057128487?platform=iphone&preserveScrollPosition=true#platform/iphone>.


### <span class="section-num">1.4</span> Документооборот {#документооборот}


#### <span class="section-num">1.4.1</span> Web-клиент {#web-клиент}

-   Ссылка: <https://sed.rudn.ru/>.