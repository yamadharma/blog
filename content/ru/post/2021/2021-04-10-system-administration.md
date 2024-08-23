---
title: "Системное администрирование"
author: ["Dmitry S. Kulyabov"]
date: 2021-04-10T18:18:00+03:00
lastmod: 2024-08-23T20:38:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "system-administration"
---

По мере сил занимаюсь настройкой компьютеров. В основном на Linux.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> DevOps {#devops}

-   [Непрерывная интеграция. GitHub Actions]({{< relref "2023-07-16-continuous-integration-github-actions" >}})


## <span class="section-num">2</span> Безопасность {#безопасность}


### <span class="section-num">2.1</span> Пароли {#пароли}

-   [Менеджеры паролей]({{< relref "2021-04-29-password-managers" >}})
-   [Have I Been Pwned (HIBP)]({{< relref "2021-05-03-have-i-been-pwned-hibp" >}})
-   [Одноразовые пароли]({{< relref "2023-08-24-one-time-passwords" >}})


### <span class="section-num">2.2</span> Разное {#разное}

-   [Тип ключа ssh]({{< relref "2022-02-03-ssh-key-type" >}})
-   [Сертификаты ACME]({{< relref "2022-04-30-acme-certificates" >}})
-   [Механизм HSTS]({{< relref "2022-05-03-hsts-mechanism" >}})
-   [fail2ban. Основные настройки]({{< relref "2023-10-30-fail2ban-basic-settings" >}})


## <span class="section-num">3</span> Гаджеты {#гаджеты}

-   [Гаджеты]({{< relref "2024-08-22-gadget" >}})


## <span class="section-num">4</span> Графическое окружение {#графическое-окружение}


### <span class="section-num">4.1</span> Linux {#linux}

-   [Мультимедиа сервер PipeWire]({{< relref "2021-04-28-pipewire-multimedia-server" >}})
-   [XDG. Пользовательские каталоги]({{< relref "2021-09-16-xdg-user-directories" >}})
-   [XDG. Приложения MIME]({{< relref "2023-04-02-xdg-mime-applications" >}})
-   [Ввод с помощью Compose]({{< relref "2021-12-26-using-compose-key" >}})
-   [Тайловые оконные менеджеры]({{< relref "2023-06-19-tiling-window-manager" >}})
-   [Консоль linux. Kmscon]({{< relref "2024-06-25-linux-console-kmscon" >}})
-   [Лаунчеры]({{< relref "2024-08-11-launcher" >}})


### <span class="section-num">4.2</span> Wayland {#wayland}

-   [Wayland]({{< relref "2023-08-14-wayland" >}})
-   [Linux. Приложения. Индикатор прогресса wob]({{< relref "2024-03-06-linux-applications-progress-indicator-wob" >}})
-   [Переход на Sway]({{< relref "2020-09-10-migration-sway" >}})


### <span class="section-num">4.3</span> X11 {#x11}

-   [Window manager i3]({{< relref "2021-05-14-window-manager-i3" >}})


### <span class="section-num">4.4</span> Темы оформления {#темы-оформления}

-   [Linux. Темы оформления]({{< relref "2024-05-07-linux-themes" >}})


## <span class="section-num">5</span> Инфраструктура в РУДН {#инфраструктура-в-рудн}

-   [Переход на домен pfur.ru]({{< relref "2023-04-20-switching-domain-pfur" >}})
-   [Спецификации компьютеров]({{< relref "2023-06-11-computer-specifications" >}})
-   [Сервера на Донской]({{< relref "2022-09-15-servers-donskaya" >}})
-   [Сеть на Донской]({{< relref "2023-08-13-network-donskaya" >}})


## <span class="section-num">6</span> Конфигурации {#конфигурации}

-   [Моя конфигурация программного обеспечения]({{< relref "2024-03-06-my-software-configuration" >}})


## <span class="section-num">7</span> Оборудование {#оборудование}

-   [Критерии выбора ноутбука]({{< relref "2022-04-30-criteria-choosing-laptop" >}})
-   [Критерии выбора персонального компьютера]({{< relref "2022-07-21-criteria-choosing-personal-computer" >}})
-   [Набор вещей для системного администратора]({{< relref "2022-09-11-system-administrator-tools" >}})
-   [Клавиатуры]({{< relref "2023-10-11-keyboards" >}})


## <span class="section-num">8</span> Операционные системы {#операционные-системы}


### <span class="section-num">8.1</span> Windows {#windows}

-   [Администрирование Windows]({{< relref "2021-05-01-windows-administration" >}})
-   [MSYS2. Приложения Unix под Windows]({{< relref "2023-09-23-msys2-unix-applications-windows" >}})


### <span class="section-num">8.2</span> Linux {#linux}

-   [Администрирование Linux]({{< relref "2023-06-07-linux-administration" >}})


### <span class="section-num">8.3</span> Установка операционных систем {#установка-операционных-систем}

-   [Загрузочная флешка]({{< relref "2021-04-10-bootable-usb-stick" >}})
-   [Перенос Linux на btrfs]({{< relref "2021-05-21-installing-linux-btrfs" >}})
-   [Установка загрузчика grub]({{< relref "2021-09-19-installing-grub-bootloader" >}})
-   [Использование vagrant]({{< relref "2021-11-12-using-vagrant" >}})


### <span class="section-num">8.4</span> Серверные системы {#серверные-системы}

-   [Замена Centos]({{< relref "2021-05-25-replacing-centos" >}})
-   [CentOS 8. Изменение адресов репозиториев]({{< relref "2022-02-10-centos8-changing-repository-addresses" >}})
-   [Rocky Linux. Установка сервера]({{< relref "2022-08-12-rockylinux-server-installation" >}})
-   [Автообновление систем на базе деривативов RedHat]({{< relref "2022-09-25-redhat-based-systems-auto-update" >}})


### <span class="section-num">8.5</span> Управление программным обеспечением {#управление-программным-обеспечением}

-   [Обновление пакетов python]({{< relref "2022-01-21-update-all-python-packages" >}})


### <span class="section-num">8.6</span> Терминальный доступ {#терминальный-доступ}

-   [Virtual Desktop Infrastructure]({{< relref "2022-07-23-virtual-desktop-infrastructure" >}})


### <span class="section-num">8.7</span> Утилиты настройки среды {#утилиты-настройки-среды}

-   [Утилита module]({{< relref "2022-07-24-module-utility" >}})


### <span class="section-num">8.8</span> Загрузчики {#загрузчики}

-   [Загрузчик rEFInd]({{< relref "2024-01-29-refind-boot-manager" >}})


## <span class="section-num">9</span> Организация обучения {#организация-обучения}

-   [Дисплейные классы]({{< relref "2021-09-26-computer-classes" >}})


## <span class="section-num">10</span> Пользовательские программы {#пользовательские-программы}


### <span class="section-num">10.1</span> Виртуализация {#виртуализация}

-   [Система виртуализации VirtualBox]({{< relref "2021-09-17-virtualbox-virtualization-system" >}})
-   [Система виртуализации VMware]({{< relref "2024-05-16-vmware-virtualization-system" >}})


### <span class="section-num">10.2</span> Вычисления {#вычисления}

-   [Принципы работы на суперкомпьютере]({{< relref "2022-07-22-principles-using-supercomputer" >}})
-   [Регламент доступа к суперкомпьютеру РУДН]({{< relref "2022-09-07-regulations-access-supercomputer-rudn" >}})


### <span class="section-num">10.3</span> Квантовая химия {#квантовая-химия}

-   [Квантовая химия. Gamess]({{< relref "2022-10-17-quantum-chemistry-gamess" >}})


### <span class="section-num">10.4</span> Наборы программ {#наборы-программ}

-   [Программы на Android]({{< relref "2023-06-26-android-apps" >}})


### <span class="section-num">10.5</span> Обработка видео {#обработка-видео}

-   [Видео. KDEnlive]({{< relref "2021-07-23-video-kdenlive" >}})
-   [Обработка видео. Командная строка]({{< relref "2021-10-21-video-processing-command-line" >}})
-   [Закачка с youtube]({{< relref "2022-03-09-download-youtube" >}})


### <span class="section-num">10.6</span> Офисные программы {#офисные-программы}

-   [Настройка LibreOffice]({{< relref "2022-01-27-libreoffice-tuning" >}})
-   [Альтернативы Microsoft Office]({{< relref "2023-03-19-microsoft-office-alternatives" >}})


### <span class="section-num">10.7</span> Просмотрщики {#просмотрщики}

-   [Pdf. Просмотр. Zathura]({{< relref "2023-09-20-pdf-viewer-zathura" >}})


### <span class="section-num">10.8</span> Работа с дисками {#работа-с-дисками}

-   [Использование sfdisk]({{< relref "2022-03-08-using-sfdisk" >}})


### <span class="section-num">10.9</span> Работа с терминалом {#работа-с-терминалом}

-   [Терминальный мультиплексор tmux]({{< relref "2024-02-19-terminal-multiplexer-tmux" >}})
-   [Эмулятор терминала kitty]({{< relref "2024-03-16-kitty-terminal-emulator" >}})


### <span class="section-num">10.10</span> Работа с файлами {#работа-с-файлами}

-   [Файловый менеджер Midnight Commander]({{< relref "2023-08-26-midnight-commander-file-manager" >}})


### <span class="section-num">10.11</span> Редакторы {#редакторы}

-   [Emacs]({{< relref "2020-12-24-emacs" >}})
-   [Редактор vim]({{< relref "2023-07-04-vim-editor" >}})


### <span class="section-num">10.12</span> Сетевые клиенты {#сетевые-клиенты}

-   [Почтовый клиент aerc]({{< relref "2024-07-17-email-client-aerc" >}})


#### <span class="section-num">10.12.1</span> Броузеры {#броузеры}

-   [Флаги запуска google chrome]({{< relref "2023-02-28-google-chrome-flags" >}})
-   [Броузер Nyxt]({{< relref "2023-10-05-nyxt-browser" >}})
-   [Firefox. Расширения]({{< relref "2006-12-24-firefox-extention" >}})
-   [Vim. Клавиатура. Броузеры]({{< relref "2023-08-19-vim-keyboard-browsers" >}})
-   [Emacs. Клавиатура. Броузеры]({{< relref "2023-08-19-emacs-keyboard-browsers" >}})


### <span class="section-num">10.13</span> Синхронизация файлов {#синхронизация-файлов}

-   [rclone]({{< relref "2022-10-27-rclone" >}})
-   [Синхронизация файлов с помощью syncthing]({{< relref "2021-08-01-synchronizing-files-syncthing" >}})
-   [Скачать фотографии с google photo]({{< relref "2024-06-01-google-photo-download" >}})


### <span class="section-num">10.14</span> Телеконференции {#телеконференции}

-   [Аналоги программ для видеоконференций]({{< relref "2023-03-23-video-conferencing-software-analogues" >}})


### <span class="section-num">10.15</span> Утилиты {#утилиты}

-   [Pdf. Поиск подстроки]({{< relref "2023-06-27-pdf-grep" >}})
-   [Локальные поисковики]({{< relref "2023-06-27-desktop-search" >}})
-   [Linux. Архивирование]({{< relref "2024-03-22-linux-archiving" >}})
-   [Менеджер закладок buku]({{< relref "2024-06-22-buku-bookmark-manager" >}})


### <span class="section-num">10.16</span> Файлы конфигурации {#файлы-конфигурации}

-   [Управление файлами конфигурации. Домашний каталог. Chezmoi]({{< relref "2022-10-28-configuration-file-management-chezmoi" >}})
-   [Управление файлами конфигурации. Домашний каталог. Репозиторий]({{< relref "2023-07-30-configuration-file-management-repo" >}})


## <span class="section-num">11</span> Профессиональные требования {#профессиональные-требования}

-   [Профессия Системный администратор]({{< relref "2021-07-02-profession-system-administrator" >}})
-   [Тест Лимончелли]({{< relref "2024-01-27-limoncelli-test" >}})


## <span class="section-num">12</span> Разработка {#разработка}

-   [Обновление хостовых ключей ssh Bitbucket Cloud]({{< relref "2023-06-14-update-bitbucket-ssh-host-keys" >}})


## <span class="section-num">13</span> Серверы приложений {#серверы-приложений}


### <span class="section-num">13.1</span> Drupal {#drupal}

-   [Перенос Drupal на другую машину]({{< relref "2022-09-13-move-drupal-other-machine" >}})


### <span class="section-num">13.2</span> OJS {#ojs}

-   [Open Journal Systems]({{< relref "2022-10-22-open-journal-systems" >}})


### <span class="section-num">13.3</span> Ldap {#ldap}

-   [Перенос Openldap на другую машину]({{< relref "2023-09-01-openldap-migration" >}})
-   [Настройка Openldap]({{< relref "2023-09-02-configure-openldap-rocky-linux" >}})


### <span class="section-num">13.4</span> Kerberos {#kerberos}

-   [Перенос kerberos на другую машину]({{< relref "2023-09-03-kerberos-migration" >}})


### <span class="section-num">13.5</span> Git {#git}

-   [Хостинг git. gitea]({{< relref "2023-10-29-git-hosting-gitea" >}})


## <span class="section-num">14</span> Сети {#сети}


### <span class="section-num">14.1</span> Cisco {#cisco}

-   [Администрирование Cisco]({{< relref "2021-06-16-cisco-administration" >}})


### <span class="section-num">14.2</span> VLAN {#vlan}

-   [Linux. Настройка vlan]({{< relref "2024-05-13-linux-vlan-configuration" >}})


### <span class="section-num">14.3</span> VPN {#vpn}

-   [VPN. L2TP+IPsec. Подключение клиента]({{< relref "2023-02-05-l2tp-ipsec-vpn-client-setup" >}})
-   [Подключение к Cisco VPN]({{< relref "2023-08-19-cisco-vpn-client-setup" >}})


### <span class="section-num">14.4</span> Железо {#железо}

-   [Формат Small Form-factor Pluggable (SFP)]({{< relref "2023-03-19-small-form-factor-pluggable" >}})


### <span class="section-num">14.5</span> Коммутаторы {#коммутаторы}

-   [DHCP snooping]({{< relref "2023-09-05-dhcp-snooping" >}})


### <span class="section-num">14.6</span> Управление и мониторинг {#управление-и-мониторинг}

-   [Система мониторинга Observium]({{< relref "2023-03-02-observium-monitoring-system" >}})
-   [Система мониторинга LibreNMS]({{< relref "2023-03-20-librenms-monitoring-system" >}})
-   [Мониторинг пропускной способности и скорости сети]({{< relref "2023-06-16-bandwidth-network-speed-monitoring" >}})
-   [Система управления сетью NetBox]({{< relref "2024-06-19-netbox" >}})


### <span class="section-num">14.7</span> Протоколы {#протоколы}

-   [Протокол IPv6]({{< relref "2023-06-26-ipv6-protocol" >}})


#### <span class="section-num">14.7.1</span> Bittorrent {#bittorrent}

-   [bittorrent. Трекер opentracker]({{< relref "2024-01-31-bittorrent-opentracker" >}})


### <span class="section-num">14.8</span> Сетевые сервисы {#сетевые-сервисы}


#### <span class="section-num">14.8.1</span> DNS {#dns}

-   [Domain Name System (DNS)]({{< relref "2023-09-16-domain-name-system-dns" >}})


#### <span class="section-num">14.8.2</span> DHCP {#dhcp}

-   [Сервер DHCP Kea]({{< relref "2024-06-18-dhcp-kea-server" >}})
-   [Сервер ISC DHCP]({{< relref "2024-06-19-server-isc-dhcp" >}})
-   [DHCP snooping]({{< relref "2023-09-05-dhcp-snooping" >}})
-   [Адресация IPv4 и IPv6. Настройка DHCP для IPv4]({{< relref "2022-08-15-configuring-dhcp-ipv4" >}})
-   [Адресация IPv4 и IPv6. Настройка DHCPv6 для IPv6]({{< relref "2022-08-17-configuring-dhcpv6-ipv6" >}})


#### <span class="section-num">14.8.3</span> Почта {#почта}

-   [Запросы по протоколу imap из командной строки]({{< relref "2024-04-13-imap-queries-command-line" >}})


## <span class="section-num">15</span> Управление и мониторинг {#управление-и-мониторинг}

-   [Web консоль Cockpit]({{< relref "2022-01-18-cockpit-web-console" >}})


## <span class="section-num">16</span> Файловые системы {#файловые-системы}


### <span class="section-num">16.1</span> Локальные файловые системы {#локальные-файловые-системы}

-   [Файловая система btrfs]({{< relref "2021-08-27-btrfs-file-system" >}})
-   [Дедупликация данных]({{< relref "2022-05-26-data-deduplication" >}})
-   [Файловая система xfs]({{< relref "2023-08-26-xfs-file-system" >}})


### <span class="section-num">16.2</span> Сетевые и распределённые файловые системы {#сетевые-и-распределённые-файловые-системы}

-   [Файловая система afs]({{< relref "2023-08-28-file-system-afs" >}})
-   [Использование Яндекс-диска]({{< relref "2024-06-25-using-yandex-disk" >}})


### <span class="section-num">16.3</span> Файловые системы объединения (union) {#файловые-системы-объединения--union}

-   [Файловая система mergerfs]({{< relref "2024-01-28-mergerfs" >}})


## <span class="section-num">17</span> Форматы файлов {#форматы-файлов}


### <span class="section-num">17.1</span> csv {#csv}

-   [Формат CSV. csvkit]({{< relref "2023-07-06-csv-csvkit" >}})


## <span class="section-num">18</span> Шрифты {#шрифты}

-   [Шрифты в Linux]({{< relref "2021-10-27-linux-fonts" >}})


## <span class="section-num">19</span> Языки программирования {#языки-программирования}

-   [Язык программирования HCL]({{< relref "2022-11-05-hcl-programming-language" >}})


## <span class="section-num">20</span> Ресурсы {#ресурсы}

-   Awesome Sysadmin: <https://github.com/awesome-foss/awesome-sysadmin>
