---
title: "WireGuard VPN"
author: ["Dmitry S. Kulyabov"]
date: 2025-11-06T08:53:00+03:00
lastmod: 2025-11-06T15:11:00+03:00
tags: ["network", "sysadmin"]
categories: ["computer-science"]
draft: false
slug: "wireguard-vpn"
---

WireGuard VPN.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   WireGuard есть коммуникационный протокол и бесплатное программное обеспечение с открытым исходным кодом, которое реализует зашифрованные виртуальные частные сети (VPN).


### <span class="section-num">1.1</span> Основные особенности WireGuard {#основные-особенности-wireguard}

-   Минималистичный дизайн.
-   Высокая производительность.
-   Простота конфигурации.
-   Криптографические примитивы:
    -   Curve25519 --- для обмена ключами;
    -   ChaCha20 --- для шифрования данных;
    -   Poly1305 --- для проверки целостности сообщений;
    -   BLAKE2s --- для высокоскоростного хэширования;
    -   HKDF --- для безопасной генерации ключей.
-   Кроссплатформенность.
-   Несколько топологий. Поддерживает топологии «точка-точка», «звезда» (сервер/клиент) и Mesh (сеть).


### <span class="section-num">1.2</span> Применение WireGuard {#применение-wireguard}

-   Защита трафика в корпоративных сетях.
-   Создание безопасного доступа к облачным и локальным ресурсам.
-   Шифрование данных в публичных Wi-Fi сетях.
-   Настройка протокола на домашних роутерах для защиты всей сети.


### <span class="section-num">1.3</span> Ограничения WireGuard {#ограничения-wireguard}

-   Привязка к статическим IP:
    -   каждый клиент должен быть настроен с фиксированным IP, что может быть неудобно в динамических сетях.
-   Ограниченная анонимность
    -   протокол не скрывает метаданные, такие как IP-адреса.
-   Отсутствие встроенной обфускации
    -   WireGuard не скрывает трафик от анализа.


## <span class="section-num">2</span> Сервер {#сервер}


### <span class="section-num">2.1</span> **Установка WireGuard** {#установка-wireguard}


#### <span class="section-num">2.1.1</span> Rocky Linux 9 {#rocky-linux-9}

-   Установим репозиторий EPEL:

<!--listend-->

```shell
sudo dnf install epel-release -y
```

-   Установим пакет `wireguard-tools`:

<!--listend-->

```shell
sudo dnf install wireguard-tools -y
```

-   Проверка установки:

<!--listend-->

```shell
wg --version
```


### <span class="section-num">2.2</span> Настройка WireGuard {#настройка-wireguard}

-   WireGuard использует криптографические ключи для аутентификации и шифрования трафика между узлами.


#### <span class="section-num">2.2.1</span> Генерация ключей сервера {#генерация-ключей-сервера}

-   Создадим директорию для хранения ключей и сгенерируем пару ключей:

<!--listend-->

```shell
sudo mkdir -p /etc/wireguard
sudo chmod 700 /etc/wireguard
sudo wg genkey | sudo tee /etc/wireguard/server_private.key
sudo wg pubkey < /etc/wireguard/server_private.key | sudo tee /etc/wireguard/server_public.key
sudo chmod 600 /etc/wireguard/server_private.key /etc/wireguard/server_public.key
```


#### <span class="section-num">2.2.2</span> Создание конфигурационного файла сервера {#создание-конфигурационного-файла-сервера}

-   Создадим файл конфигурации `wg0.conf`:

<!--listend-->

```shell
sudo touch /etc/wireguard/wg0.conf
```

-   Добавьте в него следующие строки, заменив на ваш приватный ключ:

<!--listend-->

```conf-unix
[Interface]
Address = 10.0.0.1/24
SaveConfig = true
ListenPort = 51820
PrivateKey = <Server_Private_Key>
```

-   Приведенная выше конфигурация WireGuard создает новый интерфейс с частным IP-адресом. `10.0.0.1/24`:
    -   `Address = 172.16.0.1/24` : назначает частный IP-адрес `172.16.0.1` интерфейсу WireGuard с маской подсети `255.255.255.0` .
    -   `SaveConfig = true` : позволяет WireGuard автоматически сохранять конфигурацию при выключении сервера.
    -   `PrivateKey = <Server_Private_Key>` : устанавливает закрытый ключ сервера WireGuard.
    -   `ListenPort = 51820`: устанавливает порт сервера WireGuard `51820` для прослушивания входящих запросов на VPN-подключение.


#### <span class="section-num">2.2.3</span> Генерация конфигурации клиента {#генерация-конфигурации-клиента}

-   Замените `client` желаемой схемой именования клиентов.
-   Сгенерируем пару ключей для клиента:

<!--listend-->

```shell
sudo wg genkey | sudo tee /etc/wireguard/client_private.key
sudo wg pubkey < /etc/wireguard/client_private.key | sudo tee /etc/wireguard/client_public.key
```


#### <span class="section-num">2.2.4</span> Создание конфигурационного файла клиента {#создание-конфигурационного-файла-клиента}

-   Создайте файл `client.conf`:

<!--listend-->

```shell
sudo touch /etc/wireguard/client.conf
```

-   Добавьте следующие строки, заменив соответствующие значения вашими ключами и IP-адресом сервера:

<!--listend-->

```conf-unix
[Interface]
PrivateKey = <Client_Private_Key>
Address = 10.0.0.2/24
DNS = 8.8.8.8

[Peer]
PublicKey = <Server_Public_Key>
Endpoint = <Server_Public_IP>:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```

-   Создаётся клиент WireGuard с IP-адресом частного туннеля VPN `10.0.0.2/24`:
    -   `PrivateKey` : устанавливает закрытый ключ клиента WireGuard, используемый для шифрования и аутентификации в туннеле VPN.
    -   `Address` : устанавливает частный IP-адрес клиента WireGuard `10.0.0.2/24`.
    -   `DNS`: устанавливает публичный DNS-сервер Google `8.8.8.8` в качестве DNS-резолвера для разрешения доменных имен при подключении к VPN-туннелю.
    -   `PublicKey` : устанавливает открытый ключ целевого сервера WireGuard.
    -   `AllowedIPs` : определяет сетевые адреса клиентов сети, которым разрешено подключение через туннель VPN.
    -   `Endpoint`: устанавливает публичный IP-адрес сервера WireGuard и порт `51820` для использования при подключении к VPN-туннелю.
    -   `PersistentKeepalive` : поддерживает VPN-соединение активным, отправляя пакеты поддержки активности каждые `15` секунд.


#### <span class="section-num">2.2.5</span> Добавление клиента на сервер {#добавление-клиента-на-сервер}

-   Откройте конфигурационный файл сервера `/etc/wireguard/wg0.conf`.

-   Добавьте информацию о клиенте:

<!--listend-->

```conf-unix
[Peer]
PublicKey = <Client_Public_Key>
AllowedIPs = 10.0.0.2/32
```


#### <span class="section-num">2.2.6</span> Управление сервисом WireGuard {#управление-сервисом-wireguard}

-   Запустите интерфейс WireGuard:

<!--listend-->

```shell
sudo systemctl enable --now wg-quick@wg0
```

-   Убедитесь, что сервис работает корректно:

<!--listend-->

```shell
sudo systemctl status wg-quick@wg0
```


#### <span class="section-num">2.2.7</span> Настройка брандмауэра {#настройка-брандмауэра}

-   Откройте порт 51820/UDP в FirewallD:

<!--listend-->

```shell
sudo firewall-cmd --add-service=wireguard --permanent
sudo firewall-cmd --reload
```

-   Разрешите пересылку пакетов для обеспечения работы VPN:

<!--listend-->

```shell
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

-   Добавьте правило маскарадинга для сети WireGuard:

<!--listend-->

```shell
sudo firewall-cmd --permanent --add-masquerade
sudo firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="10.0.0.0/24" masquerade'
sudo firewall-cmd --reload
```


## <span class="section-num">3</span> Клиент {#клиент}


### <span class="section-num">3.1</span> Установка {#установка}


#### <span class="section-num">3.1.1</span> Gentoo {#gentoo}

-   Установите:
    ```shell
    emerge net-vpn/wireguard-tools
    ```


#### <span class="section-num">3.1.2</span> Rocky Linux 9 {#rocky-linux-9}

-   Установим репозиторий EPEL:

<!--listend-->

```shell
sudo dnf install epel-release -y
```

-   Установим пакет `wireguard-tools`:

<!--listend-->

```shell
sudo dnf install wireguard-tools -y
```

-   Проверка установки:

<!--listend-->

```shell
wg --version
```


### <span class="section-num">3.2</span> Модуль ядра {#модуль-ядра}

-   Включите модуль в ядро:
    ```text
    Device Drivers  --->
      [*] Network device support  --->
          [*] Network core driver support
          <*>   WireGuard secure network tunnel
    ```


### <span class="section-num">3.3</span> Конфигурация {#конфигурация}

-   Скопируйте конфигурацию клиента с сервера, например с помощью `scp`:
    ```shell
    sudo scp root@wireguard-server-ip:/etc/wireguard/client.conf /etc/wireguard/wg0.conf
    ```
-   Активируйте сервис `systemd-resolved`:
    ```shell
    sudo systemctl enable --now systemd-resolved
    ```
-   Активируйте интерфейс:
    ```shell
    sudo wg-quick up wg0
    ```
-   Проверьте статус туннеля:
    ```shell
    sudo wg
    ```
-   Проверьте связь с сервером:
    ```shell
    ping -c 5 10.0.0.1
    ```


## <span class="section-num">4</span> Утилиты {#утилиты}


### <span class="section-num">4.1</span> wghttp {#wghttp}

-   Репозиторий: <https://github.com/zhsj/wghttp>
-   Использовать WireGuard в качестве прокси-сервера HTTP и SOCKS5.
