---
title: "Hugo. Шаблон для научных работников"
date: 2021-07-02T15:02:00+03:00
lastmod: 2021-07-02T17:27:00+03:00
tags: ["sysadmin"]
categories: ["computer-science"]
draft: false
slug: "hugo-template-for-scientists"
---

Тема _Wowchemy_. Бывшая _Academic_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Информация {#информация}

-   Сайт: <https://wowchemy.com/>
-   Репозиторий: <https://github.com/wowchemy>
-   Репозиторий модуля темы: <https://github.com/wowchemy/wowchemy-hugo-modules>


## <span class="section-num">2</span> Обновление {#обновление}


### <span class="section-num">2.1</span> v5.3 {#v5-dot-3}

-   В файле `go.mod` установите необходимую версию (например, `5.3`), исправив строку:

    ```conf-unix
    require (
    	github.com/wowchemy/wowchemy-hugo-modules/v5 v5.3.0
    )
    ```
-   Обновите пути к модулям в конфигурации в файле `config/_default/config.yaml`:

    ```yaml
    module:
      imports:
    ​    - path: github.com/wowchemy/wowchemy-hugo-modules/wowchemy-cms/v5
    ​    - path: github.com/wowchemy/wowchemy-hugo-modules/wowchemy/v5
    ```

    или `config/_default/config.toml`:

    ```conf-toml
    [module]
      [[module.imports]]
        path = "github.com/wowchemy/wowchemy-hugo-modules/wowchemy-cms/v5"
      [[module.imports]]
        path = "github.com/wowchemy/wowchemy-hugo-modules/wowchemy/v5"
    ```
-   Для использования с _netlify_:
    -   Обновите `HUGO_VERSION` в `netlify.toml` до необходимой версии.
-   Обновите модуль:
    -   текущий релиз:

        ```shell
        hugo mod get -u
        ```
    -   текущая версия разработчика:

        ```shell
        hugo mod get -u ./...
        ```
