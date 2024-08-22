---
title: "Подпись коммитов git ключом ssh"
author: ["Dmitry S. Kulyabov"]
date: 2024-08-14T22:08:00+03:00
lastmod: 2024-08-22T15:12:00+03:00
tags: ["sysadmin", "programming"]
categories: ["computer-science"]
draft: false
slug: "verifying-git-commits-ssh"
---

Подпись коммитов git ключом ssh.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   В git можно производить подпись коммитов с помощью ssh-ключа.


## <span class="section-num">2</span> Настройка подписи ключом ssh {#настройка-подписи-ключом-ssh}

-   Настроим подписывание в git:
    ```shell
    git config --global commit.gpgsign true
    git config --global gpg.format ssh
    ```

-   Получим список ключей (используя агент хранения ключей, [Агенты для хранения ключей]({{< relref "2024-08-22-key-storage-agent" >}})):
    ```shell
    ssh-add -L
    ```

-   Указываем ключ:
    ```shell
    git config --global user.signingkey "ssh-ed25519 <key_id>"
    ```

-   Для проверки работы подписывания запустите команду в любом из ваших репозиториев:
    ```shell
    git commit --allow-empty --message="Testing SSH signing"
    ```


## <span class="section-num">3</span> Доверенные подписи {#доверенные-подписи}

-   Проверим созданный коммит:
    ```shell
    git show --show-signature
    ```
-   Git не видит подписи.
-   Необходимо внести ключ в список доверенных подписантов.
-   Сконфигурируем git:
    ```shell
    git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers
    touch ~/.ssh/allowed_signers
    ```
-   Формат этого файла:
    ```conf-unix
    <email>[,<email>...] <key_type> <public_key>
    ```

-   Добавляем ключ в файл:
    ```shell
    echo "<user_email> ssh-ed25519 <key_id>" > ~/.ssh/authorized_signatures
    ```


## <span class="section-num">4</span> Итоговый `~/config/git/config` {#итоговый-config-git-config}

-   В файле `~/config/git/config` должно будет появиться следующее:
    ```toml
    [gpg]
        format = ssh
    [gpg "ssh"]
        allowedSignersFile = ~/.ssh/allowed_signers
    [user]
        signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGXySeykoPLO4ChvQuGVrveXJ+m0rxQEJFl1XQ0OKF2Y
    ```

---
