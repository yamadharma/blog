---
title: "Загрузочный сервер PXE"
author: ["Dmitry S. Kulyabov"]
date: 2023-11-08T14:42:00+03:00
lastmod: 2023-11-15T16:37:00+03:00
tags: ["sysadmin", "network"]
categories: ["computer-science"]
draft: false
slug: "pxe-server"
---

Установка загрузочного сервера PXE.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая настройка {#общая-настройка}

-   Установите сервер Linux (см. [Rocky Linux. Установка сервера]({{< relref "2022-08-12-rockylinux-server-installation" >}})).


## <span class="section-num">2</span> Сетевые сервисы {#сетевые-сервисы}


### <span class="section-num">2.1</span> tftp {#tftp}

-   Установите сервер tftp:
    ```shell
    dnf -y install tftp-server
    ```
-   Настройте брандмауэр:
    ```shell
    firewall-cmd --add-service=tftp --permanent
    firewall-cmd --reload
    ```
-   Активируйте сервис:
    ```shell
    systemctl enable --now tftp.socket
    ```


### <span class="section-num">2.2</span> web-сервер {#web-сервер}

-   Для снижения нагрузки на tftp будем загружать образы по http.
-   Установим сервер nginx:
    ```shell
    dnf -y install nginx
    ```
-   Настройте брандмауэр:
    ```shell
    firewall-cmd --add-service=http --permanent
    firewall-cmd --reload
    ```


#### <span class="section-num">2.2.1</span> Конфигурация {#конфигурация}

-   Создадим файл конфигурации `/etc/nginx/conf.d/pxe.conf`:
    ```conf-unix
    server {
        listen   80 default_server;
        listen       [::]:80;
        root /var/lib/tftpboot;
        server_name pxe.example.com;

        location / {
        }
        index index.html index.htm;
        autoindex on;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;
    }
    ```


#### <span class="section-num">2.2.2</span> SELinux {#selinux}

-   Зададим переключатели SELinux:
    ```shell
    setsebool -P httpd_serve_cobbler_files 1
    setsebool httpd_serve_cobbler_files 1
    ```
-   Создадим файл с описанием политики `nginx-tftp.te`:
    ```conf-unix
    module nginx-tftp 1.0;

    require {
            type httpd_t;
            type tftpdir_rw_t;
            class dir read;
            class file { getattr open read };
    }

    #============= httpd_t ==============

    #!!!! This avc is allowed in the current policy
    allow httpd_t tftpdir_rw_t:dir read;

    #!!!! This avc is allowed in the current policy
    allow httpd_t tftpdir_rw_t:file { getattr read };
    allow httpd_t tftpdir_rw_t:file open;
    ```
-   Применим его:
    ```shell
    semodule -i nginx-tftp.te
    ```


#### <span class="section-num">2.2.3</span> Запуск {#запуск}

-   Запустим nginx:
    ```shell
    systemctl enable --now nginx.service
    ```


## <span class="section-num">3</span> Сетевые загрузчики {#сетевые-загрузчики}

-   Возможно использовать любой сетевой загрузчик:
    -   pxelinux
    -   ipxe
    -   grub2


### <span class="section-num">3.1</span> pxelinux {#pxelinux}


### <span class="section-num">3.2</span> ipxe {#ipxe}


### <span class="section-num">3.3</span> grub2 {#grub2}


#### <span class="section-num">3.3.1</span> Установка {#установка}

-   Установим необходимые пакеты для grub2:
    ```shell
    dnf -y install grub2-efi-x64-modules grub2-tools-extra grub2-pc-modules
    ```
-   Установим файлы в каталог tftpd:
    ```shell
    grub2-mknetdir --net-directory /var/lib/tftpboot/
    restorecon -vR /var/lib/tftpboot
    ```


#### <span class="section-num">3.3.2</span> Настройки DHCP-сервера {#настройки-dhcp-сервера}

-   Настройки для сервера ISC DHCP.
-   Файл конфигурации `/etc/dhcp/dhcpd.conf`.
-   Настройка основных опций:
    ```conf-unix
    option pxe-system-type code 93 = unsigned integer 16;
    option rfc3442-classless-static-routes code 121 = array of integer 8;
    option ms-classless-static-routes code 249 = array of integer 8;

    option space pxelinux;
    option pxelinux.magic code 208 = string;
    option pxelinux.configfile code 209 = text;
    option pxelinux.pathprefix code 210 = text;
    option pxelinux.reboottime code 211 = unsigned integer 32;
    option architecture-type   code 93 = unsigned integer 16;
    option pxelinux.mtftp-ip    code 1 = ip-address;
    option pxelinux.mtftp-cport code 2 = unsigned integer 16;
    option pxelinux.mtftp-sport code 3 = unsigned integer 16;
    option pxelinux.mtftp-tmout code 4 = unsigned integer 8;
    option pxelinux.mtftp-delay code 5 = unsigned integer 8;
    ```
-   Настройка файлов загрузки:
    ```shell
    class "pxeclients" {
        match if substring (option vendor-class-identifier, 0, 9) = "PXEClient";
        if option pxe-system-type = 00:07 {
                filename "boot/grub2/x86_64-efi/core.efi";
            } else if option pxe-system-type = 00:08 {
                filename "boot/grub2/x86_64-efi/core.efi";
            } else if option pxe-system-type = 00:09 {
                filename "boot/grub2/x86_64-efi/core.efi";
            } else if option pxe-system-type = 00:0a {
                # ArmHFP
                filename "boot/grub2/armv7a-efi/core.efi";
            } else if option pxe-system-type = 00:0b {
                # aarch64
                filename "boot/grub2/aarch64-efi/core.efi";
            } else {
                # BIOS boot
                filename "boot/grub2/i386-pc/core.0";
            }
    }
    ```
-   Необходимо также настроить `next_server`, который должен указывать на tftp-сервер:
    ```shell
    next-server     10.100.0.1;
    ```


### <span class="section-num">3.4</span> Файл конфигурации grub {#файл-конфигурации-grub}

-   Создадим основной файл конфигурации:
    ```shell
    touch /var/lib/tftpboot/boot/grub2/grub.cfg
    ```
-   Создадим в нём базовую конфигурацию:
    ```conf-unix
    set default=0
    set timeout=60

    menuentry 'EFI Firmware System Setup' $menuentry_id_option 'uefi-firmware' {
      fwsetup
    }

    menuentry 'Reboot' {
      reboot
    }

    menuentry 'Shutdown' {
      halt
    }
    ```
-   Создадим символическую ссылку на этот файл в каждом каталоге, содержащим `core.*`:
    ```shell
    cd /var/lib/tftpboot/boot/grub2/x86_64-efi; ln -snf ../grub.cfg
    cd /var/lib/tftpboot/boot/grub2/i386-pc; ln -snf ../grub.cfg
    ```
