---
title: "CentOS 8. Изменение адресов репозиториев"
author: ["Dmitry S. Kulyabov"]
date: 2022-02-10T14:39:00+03:00
lastmod: 2022-11-02T18:23:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "centos8-changing-repository-addresses"
---

С 31 января 2022 года установка пакетов или обновление репозиториев в CentOS8 выдаёт ошибку.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Ошибка {#ошибка}

-   При работе с репозиториями в CentOS 8 появилась ошибка:
    ```shell
    Error: Failed to download metadata for repo 'repo_name': Cannot prepare internal mirrorlist: No URLs in mirrorlist
    ```


## <span class="section-num">2</span> Причины {#причины}

-   31 января 2022 года удалены все пакеты для _CentOS8_ с официальных зеркал.
-   Вызвано прекращением поддержки _CentOS8_ (см. [Замена Centos]({{< relref "2021-05-25-replacing-centos" >}})).
-   Теперь они перенесены на <https://vault.centos.org>.


## <span class="section-num">3</span> Устранение {#устранение}

-   Следует обновить файлы описания репозиториев в `/etc/yum.repos.d`.
-   Следует использовать `vault.centos.org` вместо `mirror.centos.org`.
-   Предлагается выполнить следующие команды:
    ```shell
    sudo sed -i -e "s|mirrorlist=|#mirrorlist=|g" \
    -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" \
    -e "s|\$contentdir|centos|g" /etc/yum.repos.d/CentOS-*
    ```
