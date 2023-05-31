---
title: "Общедоступные резольверы DNS"
author: ["Dmitry S. Kulyabov"]
date: 2023-05-26T12:14:00+03:00
lastmod: 2023-05-30T11:48:00+03:00
tags: ["network", "seedling"]
categories: ["computer-science"]
draft: false
slug: "public-dns-resolvers"
---

Общедоступные резольверы DNS.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Google {#google}

-   Описание:
    -   <https://developers.google.com/speed/public-dns/docs/using>
    -   <https://developers.google.com/speed/public-dns/docs/isp>
-   8.8.8.8
-   8.8.4.4
-   2001:4860:4860::8888
-   2001:4860:4860::8844
-   Поддерживается DNS over TLS.


## <span class="section-num">2</span> CloudFlare {#cloudflare}

-   1.1.1.1
-   1.0.0.1
-   Поддерживается DNS over TLS.


## <span class="section-num">3</span> Quad9 {#quad9}

-   9.9.9.9
-   149.112.112.112
-   Блокируются вредоносные хосты и поддерживается DNS over TLS.


## <span class="section-num">4</span> Yandex {#yandex}

-   Сайт: <https://dns.yandex.ru/>


### <span class="section-num">4.1</span> Базовый {#базовый}

-   77.88.8.8
-   77.88.8.1
-   2a02:6b8::feed:0ff
-   2a02:6b8:0:1::feed:0ff


### <span class="section-num">4.2</span> Безопасный {#безопасный}

-   77.88.8.88
-   77.88.8.2
-   2a02:6b8::feed:bad
-   2a02:6b8:0:1::feed:bad
-   Блокируются вредоносные хосты.
-   Защита от мошенников.
-   Защита от ботнетов.


### <span class="section-num">4.3</span> Семейный {#семейный}

-   77.88.8.7
-   77.88.8.3
-   2a02:6b8::feed:a11
-   2a02:6b8:0:1::feed:a11
-   Блокировка сайтов для взрослых.
-   Блокировка рекламы для взрослых.
-   Семейный поиск Яндекса.


## <span class="section-num">5</span> OpenDNS/Cisco {#opendns-cisco}

-   208.67.222.222
-   208.67.220.220
-   Блокируются вредоносные хосты и сайты для взрослых.
-   Поддерживается DNSCrypt и DNS over TLS.


## <span class="section-num">6</span> Comodo {#comodo}

-   8.26.56.26
-   8.20.247.20
-   Блокируются вредоносные хосты.
-   Поддерживается DNSCrypt и DNS over TLS.


## <span class="section-num">7</span> CleanBrowsing.org {#cleanbrowsing-dot-org}

-   185.228.168.168
-   185.228.169.168
-   Блокируется хосты с сайтами для взрослых.
-   Поддерживается DNSCrypt.


## <span class="section-num">8</span> DNS Watch {#dns-watch}

-   84.200.69.80
-   84.200.70.40
-   Не ведутся логи.


## <span class="section-num">9</span> FreeDNS {#freedns}

-   37.235.1.174
-   37.235.1.177
-   Не ведутся логи.


## <span class="section-num">10</span> Fourth Estate {#fourth-estate}

-   45.77.165.194
-   45.32.36.36
-   Не ведутся логи.


## <span class="section-num">11</span> UncensoredDNS {#uncensoreddns}

-   91.239.100.100
    -   Anycast.
-   89.233.43.71
    -   Размещён в Дании.


## <span class="section-num">12</span> Verisign {#verisign}

-   64.6.64.6
-   64.6.65.6


## <span class="section-num">13</span> Level 3 Communications {#level-3-communications}

-   4.2.2.1
-   4.2.2.2
-   4.2.2.3
-   4.2.2.4
-   4.2.2.5
-   4.2.2.6
