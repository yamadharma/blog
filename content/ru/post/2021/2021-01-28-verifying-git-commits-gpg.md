---
title: "Верификация коммитов git с помощью GPG"
date: 2021-01-28T18:47:00+03:00
lastmod: 2021-01-28T19:10:00+03:00
tags: ["programming"]
categories: ["sysadmin"]
draft: false
slug: "verifying-git-commits-gpg"
---

Настроим верификацию коммитов git с помощью GPG.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Верификация коммитов с помощью GPG {#верификация-коммитов-с-помощью-gpg}

Как настроить GPG-подпись коммитов с помощью `gpg`

-   Генерируем ключ

<!--listend-->

```shell
gpg --full-generate-key
```

Из предложенных опций выбираем тип RSA and RSA, размер 4096 и срок
действия.

При вводе email убедитесь, что он соотвествует адресу, используемому на
GitHub.

-   Выводим список ключей и копируем ID фингерпринта приватного ключа

<!--listend-->

```shell
gpg --list-secret-keys --keyid-format LONG
```

Выделенная часть -- ID PGP-ключа, которая является окончанием его фингерпринта.

-   Экспортируем ключ в формате ASCII по его ID

<!--listend-->

```shell
gpg --armor --export <PGP Fingerprint>
```


### <span class="section-num">1.1</span> Добавление GPG ключа в GitHub {#добавление-gpg-ключа-в-github}

Копируем ключ и добавляем его в настройках профиля на GitHub (или GitLab).

-   Cкопируйте ваш сгенерированный PGP ключ:

    ```shell
    gpg --armor --export <PGP Fingerprint> | xclip -sel clip
    ```
-   Перейдите в настройки GitHub (<https://github.com/settings/keys>), нажмите на кнопку "New GPG key" и вставьте полученный ключ в поле ввода.


### <span class="section-num">1.2</span> Подписывание коммитов git {#подписывание-коммитов-git}

Подпись коммитов при работе через терминал:

```shell
git commit -a -S -m 'your commit message'
```

Флаг `-S` означает создание подписанного коммита. При этом может
потребоваться ввод кодовой фразы, заданной при генерации GPG-ключа.


### <span class="section-num">1.3</span> Настройка автоматических подписей коммитов git {#настройка-автоматических-подписей-коммитов-git}

Используя введёный email, укажите Git применять его при подписи коммитов:

```shell
git config --global user.signingkey <PGP Fingerprint>
git config --global commit.gpgsign true
git config --global gpg.program $(which gpg2)
```


## <span class="section-num">2</span> Использование Keybase {#использование-keybase}

Для генерации и хранения GPG ключей можно использовать Keybase <https://keybase.io/>.

После того, как вы зарегистрируетесь в Keybase, зайдите в терминал и
запустите следующие команды:

```shell
keybase login
```


### <span class="section-num">2.1</span> Генерация GPG ключа {#генерация-gpg-ключа}

Дальше создайте новый GPG ключ, используя ваше настоящее имя и email,
сохраненный в GitHub:

```shell
keybase pgp gen
```

Посмотрите список ключей:

```shell
keybase pgp list
```


### <span class="section-num">2.2</span> Добавление GPG ключа в GitHub {#добавление-gpg-ключа-в-github}

-   Cкопируйте ваш сгенерированный PGP ключ:

    ```shell
    keybase pgp export | xclip -i
    ```

-   Перейдите в настройки GitHub (<https://github.com/settings/keys>), нажмите на кнопку "New GPG key" и вставьте полученный ключ в поле ввода.


## <span class="section-num">3</span> Backlinks {#backlinks}


### <span class="section-num">3.1</span> [Практический сценарий использования git]({{< relref "2021-01-17-git-practical-use-case" >}}) {#практический-сценарий-использования-git}

Настройте верификацию коммитов git (см. [Верификация коммитов git с помощью GPG]({{< relref "2021-01-28-verifying-git-commits-gpg" >}})).
