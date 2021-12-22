---
title: "Hugo. Шаблон для научных работников"
author: ["Dmitry S. Kulyabov"]
date: 2021-07-02T15:02:00+03:00
lastmod: 2021-12-22T18:37:00+03:00
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
    -   Обновите `HUGO_VERSION` в `netlify.toml` до необходимой версии `0.84.4`.
-   Обновите модуль:
    -   текущий релиз:

        ```shell
        hugo mod get -u
        ```
    -   текущая версия разработчика:

        ```shell
        hugo mod get -u ./...
        ```


## <span class="section-num">3</span> Устранение проблем {#устранение-проблем}


### <span class="section-num">3.1</span> Ошибка: нарушение безопасности {#ошибка-нарушение-безопасности}

-   После обновления до 0.91 возникла следующая ошибка при генерации сайта:

    ```shell
    hugo v0.91.0+extended linux/amd64 BuildDate=2021-12-22T12:45:46+03:00 VendorInfo=Gentoo
    ERROR render of "page" failed: execute of template failed: template: project/single.html:5:3: executing "project/single.html" at <partial "site_head" .>: error calling partial: "/home/dharma/work/blog/git/resources/hugo_cache/modules/filecache/modules/pkg/mod/github.com/wowchemy/wowchemy-hugo-modules/wowchemy/v5@v5.0.0-20211221220555-87f69f8c265e/layouts/partials/site_head.html:207:13": execute of template failed: template: partials/site_head.html:207:13: executing "partials/site_head.html" at <getenv "WC_POST_CSS">: error calling getenv: access denied: "WC_POST_CSS" is not whitelisted in policy "security.funcs.getenv"; the current security configuration is:

    [security]
      enableInlineShortcodes = false
      [security.exec]
        allow = ['^dart-sass-embedded$', '^go$', '^npx$', '^postcss$']
        osEnv = ['(?i)^(PATH|PATHEXT|APPDATA|TMP|TEMP|TERM)$']

      [security.funcs]
        getenv = ['^HUGO_']

      [security.http]
        methods = ['(?i)GET|POST']
        urls = ['.*']
    ```
-   Необходимо добавить строчки в белый список для переменной среды `WC_POST_CSS`.
-   Для `config/_default/config.toml` (в формате TOML):

    ```conf-toml
    [security.funcs]
    getenv = [ "^HUGO_", "^WC_",]
    ```
-   Для `config/_default/config.yaml` (в формате YAML):

    ```yaml
    security:
      funcs:
        getenv:
    ​      - ^HUGO_
    ​      - ^WC_
    ```
