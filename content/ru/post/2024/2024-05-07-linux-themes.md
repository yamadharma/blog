---
title: "Linux. Темы оформления"
author: ["Dmitry S. Kulyabov"]
date: 2024-05-07T15:39:00+03:00
lastmod: 2024-05-20T11:19:00+03:00
tags: ["linux"]
categories: ["computer"]
draft: false
slug: "linux-themes"
---

Темы оформления Linux.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Плоские темы {#плоские-темы}


### <span class="section-num">1.1</span> Тема Arc {#тема-arc}

-   Последние релизы 2022 года.


#### <span class="section-num">1.1.1</span> Gtk тема {#gtk-тема}

-   Название Materia
-   Репозиторий: <https://github.com/nana-4/materia-theme>

<!--list-separator-->

1.  Установка

    <!--list-separator-->

    1.  Gentoo

        -   В репозитории _guru_ (см. [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})):
            ```shell
            emerge x11-themes/materia-theme
            ```


#### <span class="section-num">1.1.2</span> KDE тема {#kde-тема}

-   Название: Materia KDE
-   Репозиторий: <https://github.com/PapirusDevelopmentTeam/materia-kde>

<!--list-separator-->

1.  Установка

    <!--list-separator-->

    1.  Gentoo

        -   В репозиториях _jorgicio_, _spikyatlinux_, _gig_ (см. [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})):
            ```shell
            emerge x11-themes/materia-kde
            ```


## <span class="section-num">2</span> Материальные темы {#материальные-темы}

-   Базируются на Material Design (<https://material.io>).


### <span class="section-num">2.1</span> Тема Materia {#тема-materia}

-   Последние релизы 2022 года.


#### <span class="section-num">2.1.1</span> Gtk тема {#gtk-тема}

-   Название Materia
-   Репозиторий: <https://github.com/nana-4/materia-theme>

<!--list-separator-->

1.  Установка

    <!--list-separator-->

    1.  Gentoo

        -   В репозитории _guru_ (см. [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})):
            ```shell
            emerge x11-themes/materia-theme
            ```


#### <span class="section-num">2.1.2</span> KDE тема {#kde-тема}

-   Название: Materia KDE
-   Репозиторий: <https://github.com/PapirusDevelopmentTeam/materia-kde>

<!--list-separator-->

1.  Установка

    <!--list-separator-->

    1.  Gentoo

        -   В репозиториях _jorgicio_, _spikyatlinux_, _gig_ (см. [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})):
            ```shell
            emerge x11-themes/materia-kde
            ```


### <span class="section-num">2.2</span> Тема Orchis {#тема-orchis}

-   Тема сделана на основе темы Materia.
-   Поддерживается в настоящее время.
-   Состоит из тем для Gtk, KDE и рекомендованной темы для иконок.


#### <span class="section-num">2.2.1</span> Gtk тема {#gtk-тема}

-   Название Orchis
-   Репозиторий: <https://github.com/vinceliuice/Orchis-theme>

<!--list-separator-->

1.  Установка

    <!--list-separator-->

    1.  Gentoo

        -   В репозитории _karma_ (см. [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})):
            ```shell
            emerge x11-themes/orchis-theme
            ```


#### <span class="section-num">2.2.2</span> KDE тема {#kde-тема}

-   Название: Orchis KDE
-   Репозиторий: <https://github.com/vinceliuice/Orchis-kde>

<!--list-separator-->

1.  Установка

    <!--list-separator-->

    1.  Gentoo

        -   В репозитории _karma_ (см. [Gentoo. Дополнительные репозитории]({{< relref "2023-10-01-gentoo-additional-repositories" >}})):
            ```shell
            emerge x11-themes/orchos-kde
            ```


#### <span class="section-num">2.2.3</span> Тема иконок {#тема-иконок}

-   Название: Tela Circle Icon Theme
-   Репозиторий: <https://github.com/vinceliuice/Tela-circle-icon-theme>

<!--list-separator-->

1.  Установка

    <!--list-separator-->

    1.  Gentoo

        -   В основном репозитории:
            ```shell
            USE="hardlink kde standard black blue brown dracula green grey manjaro nord orange pink purple red ubuntu yellow" emerge x11-themes/tela-icon-theme
            ```
