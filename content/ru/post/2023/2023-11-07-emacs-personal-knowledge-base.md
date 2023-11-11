---
title: "Emacs. Персональная база знаний"
author: ["Dmitry S. Kulyabov"]
date: 2023-11-07T15:54:00+03:00
lastmod: 2023-11-08T14:33:00+03:00
tags: ["emacs", "zettelkasten"]
categories: ["computer-science", "self-management"]
draft: false
slug: "emacs-personal-knowledge-base"
---

-   Организация персональной базы знаний на Emacs.
-   Пакеты можно сгруппировать по сервисам, аналоги которых они хотят реализовать.
-   Или идеям реализации сервиса.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Ориентация на Roam Research {#ориентация-на-roam-research}

-   Roam Research
-   Сайт: <https://roamresearch.com/>
-   Популярный сервис ведения заметок.


### <span class="section-num">1.1</span> Org Roam {#org-roam}

-   [Org-roam]({{< relref "2022-11-23-org-roam" >}})
-   Самый известный проект в области системе типа Zettelkasten на Emacs.
-   Имеет достаточно большое количество сопутствующих пакетов.


### <span class="section-num">1.2</span> Gkroam {#gkroam}

-   Репозиторий: <https://github.com/Kinneyzhang/gkroam>
-   Реализация Roam Research для Emacs.
-   Последняя активность в 2022 году.


## <span class="section-num">2</span> Ориентация на TheBraine {#ориентация-на-thebraine}

-   Сайт: <https://www.thebrain.com/>
-   Визуализирование ведение заметок.
-   Похоже на Mindmap или концептуальные карты.


### <span class="section-num">2.1</span> org-brain {#org-brain}

-   Репозиторий: <https://github.com/Kungsgeten/org-brain>


## <span class="section-num">3</span> Ориентация на идею Zettelkasten {#ориентация-на-идею-zettelkasten}

-   [Метод Zettelkasten]({{< relref "2021-02-18-zettelkasten-method" >}})
-   Большое внимание уделяется нумерации Лумана.
-   Реализуются обратные ссылки.


### <span class="section-num">3.1</span> phi-notes {#phi-notes}

-   Репозиторий: <https://github.com/brunocbr/phi-notes>
-   Особенности:
    -   Заметки идентифицируются уникальными последовательными номерами или временными метками.
    -   Заметки могут быть связаны с использованием синтаксиса вики-ссылок.
    -   Примечания могут иметь родительские и дочерние примечания.
    -   Библиографические аннотации поддерживаются ссылками BibTeX.
    -   Заметки могут иметь теги.
    -   Для хранения метаданных используется формат YAML.
    -   Заметки могут быть написаны в Markdown.


### <span class="section-num">3.2</span> zk {#zk}

-   Репозиторий: <https://github.com/localauthor/zk>


### <span class="section-num">3.3</span> ekg {#ekg}

-   ekg (emacs knowledge graph)
-   Репозиторий: <https://github.com/ahyatt/ekg>
-   Данные хранятся в базе данных sqlite.
-   Заметки организованы по тегам.
-   Можете просмотреть множество заметок, просматривая один или несколько тегов.


### <span class="section-num">3.4</span> denote {#denote}

-   Репозиторий: <https://github.com/protesilaos/denote>
-   Большое внимание уделяется схеме именования файлов.


### <span class="section-num">3.5</span> howm {#howm}

-   Репозиторий: <https://github.com/kaorahi/howm>
-   Сайт: <https://kaorahi.github.io/howm/>


### <span class="section-num">3.6</span> zetteldeft {#zetteldeft}

-   Репозиторий: <https://github.com/EFLS/zetteldeft>
-   Документация: <https://www.eliasstorms.net/zetteldeft/>
-   Автор перешёл на Denote и забросил пакет.


## <span class="section-num">4</span> Поиск по файлам {#поиск-по-файлам}

-   При работе с большим количеством файлов возникает задача поиска в них.
-   Группа пакетов пытается решить эту проблему.
-   Это, скорее, вспомогательные пакеты.


### <span class="section-num">4.1</span> deft {#deft}

-   Репозиторий: <https://github.com/jrblevin/deft>
-   Документация: <https://jblevins.org/projects/deft/>
-   Режим для быстрого просмотра, фильтрации и редактирования каталогов заметок.
-   Проблемы с русским языком.
-   Медленно работает при среднем количестве заметок (несколько тысяч).


### <span class="section-num">4.2</span> notdeft {#notdeft}

-   Репозиторий: <https://github.com/hasu/notdeft>
-   Документация: <https://tero.hasu.is/notdeft/>
-   Ответвление от Deft.
-   Использует движок Xapian.
