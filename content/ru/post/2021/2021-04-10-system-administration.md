---
title: "Системное администрирование"
author: ["Dmitry S. Kulyabov"]
date: 2021-04-10T18:18:00+03:00
lastmod: 2022-11-16T20:51:00+03:00
tags: ["MOC", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "system-administration"
---

По мере сил занимаюсь настройкой компьютеров. В основном на Linux.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Оборудование {#оборудование}

-   [Критерии выбора ноутбука]({{< relref "2022-04-30-criteria-choosing-laptop" >}})
-   [Критерии выбора персонального компьютера]({{< relref "2022-07-21-criteria-choosing-personal-computer" >}})
-   [Набор вещей для системного администратора]({{< relref "2022-09-11-system-administrator-tools" >}})


## <span class="section-num">2</span> Графическое окружение {#графическое-окружение}

-   [Переход на Sway]({{< relref "2020-09-10-migration-sway" >}})
-   [Window manager i3]({{< relref "2021-05-14-window-manager-i3" >}})
-   [Мультимедиа сервер PipeWire]({{< relref "2021-04-28-pipewire-multimedia-server" >}})
-   [XDG. Пользовательские каталоги]({{< relref "2021-09-16-xdg-user-directories" >}})
-   [Ввод с помощью Compose]({{< relref "2021-12-26-using-compose-key" >}})


## <span class="section-num">3</span> Операционные системы {#операционные-системы}


### <span class="section-num">3.1</span> Windows {#windows}

-   [Администрирование Windows]({{< relref "2021-05-01-windows-administration" >}})


### <span class="section-num">3.2</span> Установка операционных систем {#установка-операционных-систем}

-   [Загрузочная флешка]({{< relref "2021-04-10-bootable-usb-stick" >}})
-   [Установка Linux на btrfs]({{< relref "2021-05-21-installing-linux-btrfs" >}})
-   [Установка загрузчика grub]({{< relref "2021-09-19-installing-grub-bootloader" >}})
-   [Использование vagrant]({{< relref "2021-11-12-using-vagrant" >}})


### <span class="section-num">3.3</span> Серверные системы {#серверные-системы}

-   [Замена Centos]({{< relref "2021-05-25-replacing-centos" >}})
-   [CentOS 8. Изменение адресов репозиториев]({{< relref "2022-02-10-centos8-changing-repository-addresses" >}})
-   [Rocky Linux. Установка сервера]({{< relref "2022-08-12-rockylinux-server-installation" >}})
-   [Автообновление систем на базе деривативов RedHat]({{< relref "2022-09-25-redhat-based-systems-auto-update" >}})


### <span class="section-num">3.4</span> Файловые системы {#файловые-системы}

-   [Файловая система btrfs]({{< relref "2021-08-27-btrfs-file-system" >}})
-   [Дедупликация данных]({{< relref "2022-05-26-data-deduplication" >}})


### <span class="section-num">3.5</span> Управление программным обеспечением {#управление-программным-обеспечением}

-   [Обновление пакетов python]({{< relref "2022-01-21-update-all-python-packages" >}})


### <span class="section-num">3.6</span> Дистрибутивы Linux {#дистрибутивы-linux}


#### <span class="section-num">3.6.1</span> Общая информация {#общая-информация}


#### <span class="section-num">3.6.2</span> Режим киоска {#режим-киоска}

-   Данные дистрибутивы созданы для организации режима киоска (см. [Режим киоска]({{< relref "2022-02-15-kiosk-mode" >}})).
-   [Porteus Kiosk]({{< relref "2022-02-15-porteus-kiosk" >}})
-   [Linutop Kiosk]({{< relref "2022-02-15-linutop-kiosk" >}})


#### <span class="section-num">3.6.3</span> Дистрибутивы общего назначения {#дистрибутивы-общего-назначения}

-   [Linux. Дистрибутив Gentoo]({{< relref "2022-09-17-linux-gentoo-distribution" >}})


### <span class="section-num">3.7</span> Терминальный доступ {#терминальный-доступ}

-   [Virtual Desktop Infrastructure]({{< relref "2022-07-23-virtual-desktop-infrastructure" >}})


### <span class="section-num">3.8</span> Утилиты настройки среды {#утилиты-настройки-среды}

-   [Утилита module]({{< relref "2022-07-24-module-utility" >}})


## <span class="section-num">4</span> Языки программирования {#языки-программирования}

-   [Язык программирования HCL]({{< relref "2022-11-05-hcl-programming-language" >}})


## <span class="section-num">5</span> Серверы приложений {#серверы-приложений}


### <span class="section-num">5.1</span> Drupal {#drupal}

-   [Перенос Drupal на другую машину]({{< relref "2022-09-13-move-drupal-other-machine" >}})


### <span class="section-num">5.2</span> OJS {#ojs}

-   [Open Journal Systems]({{< relref "2022-10-22-open-journal-systems" >}})


## <span class="section-num">6</span> Управление и мониторинг {#управление-и-мониторинг}

-   [Web консоль Cockpit]({{< relref "2022-01-18-cockpit-web-console" >}})


## <span class="section-num">7</span> Шрифты {#шрифты}

-   [Шрифты в Linux]({{< relref "2021-10-27-linux-fonts" >}})


## <span class="section-num">8</span> Пользовательские программы {#пользовательские-программы}


### <span class="section-num">8.1</span> Обработка видео {#обработка-видео}

-   [Видео. KDEnlive]({{< relref "2021-07-23-video-kdenlive" >}})
-   [Обработка видео. Командная строка]({{< relref "2021-10-21-video-processing-command-line" >}})
-   [Закачка с youtube]({{< relref "2022-03-09-download-youtube" >}})


### <span class="section-num">8.2</span> Виртуализация {#виртуализация}

-   [Система виртуализации VirtualBox]({{< relref "2021-09-17-virtualbox-virtualization-system" >}})


### <span class="section-num">8.3</span> Редакторы {#редакторы}

-   [Emacs]({{< relref "2020-12-24-emacs" >}})


### <span class="section-num">8.4</span> Текстовые процессоры {#текстовые-процессоры}

-   [Настройка LibreOffice]({{< relref "2022-01-27-libreoffice-tuning" >}})


### <span class="section-num">8.5</span> Работа с дисками {#работа-с-дисками}

-   [Использование sfdisk]({{< relref "2022-03-08-using-sfdisk" >}})


### <span class="section-num">8.6</span> Вычисления {#вычисления}

-   [Принципы работы на суперкомпьютере]({{< relref "2022-07-22-principles-using-supercomputer" >}})
-   [Регламент доступа к суперкомпьютеру РУДН]({{< relref "2022-09-07-regulations-access-supercomputer-rudn" >}})


### <span class="section-num">8.7</span> Квантовая химия {#квантовая-химия}

-   [Квантовая химия. Gamess]({{< relref "2022-10-17-quantum-chemistry-gamess" >}})


### <span class="section-num">8.8</span> Синхронизация файлов {#синхронизация-файлов}

-   [rclone]({{< relref "2022-10-27-rclone" >}})
-   [Синхронизация файлов с помощью syncthing]({{< relref "2021-08-01-synchronizing-files-syncthing" >}})


### <span class="section-num">8.9</span> Файлы конфигурации {#файлы-конфигурации}

-   [Управление файлами конфигурации. Chezmoi]({{< relref "2022-10-28-configuration-file-management-chezmoi" >}})


## <span class="section-num">9</span> Безопасность {#безопасность}

-   [Менеджеры паролей]({{< relref "2021-04-29-password-managers" >}})
-   [Have I Been Pwned (HIBP)]({{< relref "2021-05-03-have-i-been-pwned-hibp" >}})
-   [Тип ключа ssh]({{< relref "2022-02-03-ssh-key-type" >}})
-   [Сертификаты ACME]({{< relref "2022-04-30-acme-certificates" >}})
-   [Механизм HSTS]({{< relref "2022-05-03-hsts-mechanism" >}})


## <span class="section-num">10</span> Сети {#сети}

-   [Администрирование Cisco]({{< relref "2021-06-16-cisco-administration" >}})


## <span class="section-num">11</span> Организация обучения {#организация-обучения}

-   [Дисплейные классы]({{< relref "2021-09-26-computer-classes" >}})


## <span class="section-num">12</span> Профессиональные требования {#профессиональные-требования}

-   [Профессия Системный администратор]({{< relref "2021-07-02-profession-system-administrator" >}})
