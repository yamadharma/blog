---
title: "Замена Centos"
date: 2021-05-25T15:22:00+03:00
lastmod: 2021-05-25T17:01:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "replacing-centos"
---

После серии покупок (Centos -> RedHat -> IBM) дистрибутив _Centos_, представляющий из себя свободную реализацию _RedHat_, приказал долго жить.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Предыстория {#предыстория}

-   Red Hat купила Centos.
-   IBM купила RedHat.
-   Компания RedHat декларировала завершение разработки и поддержки _CentOS_ в конце 2021 года и переход на поддержку непрерывного релиза _CentOS Stream_.
    -   <https://blog.centos.org/2020/12/future-is-centos-stream/>.
    -   <https://centos.rip/>


## <span class="section-num">2</span> Альтернативы Centos {#альтернативы-centos}

-   Данные дистрибутивы можно считать либо условными, либо временными альтернативами.


### <span class="section-num">2.1</span> Условные альтернативы {#условные-альтернативы}


#### <span class="section-num">2.1.1</span> CentOS Stream {#centos-stream}

<!--list-separator-->

1.  Описание дистрибутива

    -   <https://www.centos.org/>

<!--list-separator-->

2.  Миграция на CentOS Stream

    -   Подключаем репозиторий CentOS Stream:

        ```shell
        dnf install centos-release-stream
        ```
    -   Указываем новый репозиторий в качестве репозитория по умолчанию:

        ```shell
        dnf swap centos-{linux,stream}-repos
        ```
    -   Синхронизируем установленные пакеты:

        ```shell
        dnf distro-sync
        ```


#### <span class="section-num">2.1.2</span> Oracle Linux {#oracle-linux}

<!--list-separator-->

1.  Описание дистрибутива


### <span class="section-num">2.2</span> Полные альтернативы {#полные-альтернативы}


#### <span class="section-num">2.2.1</span> Almalinux {#almalinux}

<!--list-separator-->

1.  Описание дистрибутива


#### <span class="section-num">2.2.2</span> Rocky Linux {#rocky-linux}

<!--list-separator-->

1.  Описание дистрибутива


## <span class="section-num">3</span> Backlinks {#backlinks}

-   [Системное администрирование]({{< relref "2021-04-10-system-administration" >}})
