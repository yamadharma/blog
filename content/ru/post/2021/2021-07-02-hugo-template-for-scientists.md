---
title: "Hugo. Шаблон для научных работников"
author: ["Dmitry S. Kulyabov"]
date: 2021-07-02T15:02:00+03:00
lastmod: 2023-07-03T10:41:00+03:00
tags: ["hugo", "sysadmin"]
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


## <span class="section-num">2</span> Обновление шаблонов Wowchemy {#обновление-шаблонов-wowchemy}


### <span class="section-num">2.1</span> До версии 5.3 {#до-версии-5-dot-3}

-   Примечания до версии 5.3 находятся в блоге <https://wowchemy.com/blog/>.
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
    ```toml
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


### <span class="section-num">2.2</span> Общие рекомендации {#общие-рекомендации}

-   Текущую версию можно найти:
    -   в файле `themes/academic/data/academic.toml` (если всё делалось очень давно);
    -   в файле `go.mod`:
        -   точная версия (например, `v5.0.0`);
        -   версия сборки в ​​​​форме `v<dummy-version-number>-<date>-<build-number>`.
-   Отредактируйте файл `go.mod`:
    ```conf-unix
    module github.com/wowchemy/starter-hugo-academic

    go 1.15

    require (
      github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-netlify-cms main
      github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-netlify main
      github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-reveal main
      github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy/v5 main
    )
    ```

    -   Вы настраиваете версию модуля в операторе `require`.
    -   Вместо версии `main` можно задать конкретную версию модуля (в формате `v5.x.y`).
-   Обновите пути модулей в файле `config/_default/config.yaml`:
    ```yaml
    module:
      imports:
    ​    - path: github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-netlify-cms
    ​    - path: github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-netlify
    ​    - path: github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy-plugin-reveal
    ​    - path: github.com/wowchemy/wowchemy-hugo-themes/modules/wowchemy/v5
    ```
-   Обновите переменную `HUGO_VERSION` до рекомендованной (возите из примечания к выпуску <https://github.com/wowchemy/wowchemy-hugo-themes/releases>).
-   Проверьте, что локальная версия _Hugo Extended_ имеет необходимую версию.
-   Последовательно примените любые критические изменения из соответствующих примечаний к выпуску. Если в релизе нет раздела _Breaking Changes_, то никаких изменений не требуется.
-   Обновите модули темы:
    -   до последней официальной версии:
        ```shell
        hugo mod get -u
        ```
    -   до текущей версии в репозитории:
        ```shell
        hugo mod get -u ./...
        ```
-   После этого `main` в `go.mod` будет заменена на конкретную версию.
-   Если Вы обновляете совсем старую версию, Вам может быть проще создать новый сайт и перенести папку `content`.


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
    ```toml
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


## <span class="section-num">4</span> Элементы шаблонов Wowchemy {#элементы-шаблонов-wowchemy}


## <span class="section-num">5</span> Типы контента Wowchemy {#типы-контента-wowchemy}

-   [Hugo. Wowchemy. Book]({{< relref "2022-11-22-hugo-wowchemy-book" >}})
