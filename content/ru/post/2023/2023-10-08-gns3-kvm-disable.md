---
title: "Отключение поддержки KVM в GNS3"
author: ["Dmitry S. Kulyabov"]
date: 2023-10-08T18:13:00+03:00
lastmod: 2023-10-09T09:59:00+03:00
tags: ["education", "network"]
categories: ["computer-science", "science"]
draft: false
slug: "gns3-kvm-disable"
---

Отключение поддержки KVM в GNS3.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Описание проблемы {#описание-проблемы}

-   На информационном экране виртуальной машины появляется сообщение:

    > KVM support available: False
-   При попытке запуска образа в GNS3 сообщается, что невозможно использовать ускорение KVM (`/dev/kvm` не существует).
-   Это может происходить, например, на процессорах M1 (см. [Процессор Apple M1]({{< relref "2021-02-08-chip-apple-m1" >}})), поскольку Apple не позволяет пробрасывать kvm-виртуализацию в виртуальную машину.
-   Подобная проблема может возникать и в Windows 11 на VMware WS Pro.


## <span class="section-num">2</span> Решение {#решение}

-   В качестве решения предлагается отключить KVM.
-   При этом надо понимать, что вся виртуализация будет осуществлять программно.
-   Отключить виртуализацию можно в конфигурационном файле `gns3_server.conf` на виртуальной машине.
-   В него следует добавить следующее:
    ```conf-unix
    [Qemu]
    enable_kvm = false
    ```
-   Получить доступ к этому файлу можно из текстового меню виртуальной машины, выбрав пункт _Configure_.
-   После этого следует перегрузить виртуальную машину.


## <span class="section-num">3</span> Видео {#видео}

{{< tabs tabTotal="2" >}}
{{< rtab tabName="RuTube" >}}

{{< rutube 67984efbfcfe953d2581c09894621132 >}}

{{< /rtab >}}
{{< rtab tabName="Youtube" >}}

{{< youtube HF-byEQtI-4 >}}

{{< /rtab >}}
{{< /tabs >}}