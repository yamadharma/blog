---
title: "Комментирование для статических сайтов"
date: 2021-05-25T11:46:00+03:00
lastmod: 2021-05-25T15:21:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "commenting-static-sites"
---

Статические сайты являются системами без сохранения состояния. Поэтому не могут обрабатывать изменяющиеся данные, такие как учётные записи пользователей, комментарии и т. д.
Для этого требуются некие внешние базы данных, взаимодействующих со статическим сайтом.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Поддержка комментариев в сайтах, созданных Hugo {#поддержка-комментариев-в-сайтах-созданных-hugo}

По умолчанию Hugo может использовать для комментариев сервисы [Disqus](https://disqus.com/) и [Commento](https://commento.io/).


## <span class="section-num">2</span> Disqus - стандарт de facto {#disqus-стандарт-de-facto}

> Если Вы не платите за товар, то Вы и есть товар.

-   <https://disqus.com/>
-   Практически стандартная платформа для комментариев.
-   Есть бесплатные и платные планы.
    -   <https://disqus.com/pricing/>
-   Есть информация, что в 2017 году Discuss приобрела компания [Zeta Global](https://zetaglobal.com/). Основная деятельность компании --- продажа маркетинговых данных.
-   Недостатки:
    -   Тяжёлый виджет.
    -   Большое количество телеметрии:
        -   <http://donw.io/post/github-comments/>
        -   <https://habr.com/ru/post/327424/>
    -   Нет поддержки markdown.


## <span class="section-num">3</span> Альтернативы Disqus {#альтернативы-disqus}


### <span class="section-num">3.1</span> Commento {#commento}

-   <https://commento.io/>
-   Для использования как сервиса существует только платный план.
-   Исходный код открыт:
    -   <https://gitlab.com/commento>
-   Можно расположить на своём хостинге:
    -   <https://docs.commento.io/getting-started/self-hosting/>
-   Особенности:
    -   Импорт из Disqus.
    -   Голосование (upvote/downvote) на карточке комментария.
    -   Закрепление комментариев в начале треда.
    -   Модерация с верификацией, удалением сообщений, банами и ограничением частоты комментирования.
    -   Определение спама.
    -   Настраиваемые уведомления (почта).


### <span class="section-num">3.2</span> Remark42 {#remark42}

-   <https://remark42.com/>
-   Демонстрация работы:
    -   <https://remark42.com/demo/>
-   Исходный код открыт:
    -   <https://github.com/umputun/remark42>
-   Нет сервиса, только хостинг на своём оборудовании.
-   Особенности:
    -   Импорт из Disqus.
    -   Голосование (upvote/downvote) на карточке комментария.
    -   Логин по OAuth, по почте.
    -   Модерация с верификацией, удалением сообщений и банами.
    -   Загрузка картинок.
    -   Сортировка комментариев.
    -   Настраиваемые уведомления (телеграм, RSS).
-   Для Hugo надо настраивать отдельно:
    -   <https://blog.lasall.dev/post/hugo-and-comments-with-remark42/>


## <span class="section-num">4</span> Backlinks {#backlinks}

-   [Генератор статических сайтов Hugo]({{< relref "2020-12-07-hugo-site-generator" >}})
