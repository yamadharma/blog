---
categories:
  - soft
date: 2015-04-20T13:17:32+00:00T+00:00
lang: ru
slug: octopus-multilingual
subtitle: Поддержка многоязычности в Jekyll на основе Octopress Multilingual
tags:
  - jekyll
title: Поддержка многоязычности
---


Добавим в конфигурационный файл (`_config.yml`):

{% codeblock lang:yaml %}
gems:
  - octopress-multilingual
  - octopress-linkblog
{% endcodeblock %}		

Также зададим язык по-умолчанию:

{% codeblock lang:yaml %}
lang: ru
{% endcodeblock %}

<!--more-->

## Язык для постов ##

Добавим язык  в заголовок шаблонов:

{% codeblock lang:yaml %}
lang: ru
{% endcodeblock %}

## Конфигурация для разных языков ##

В каталоге `_data` создадим конфигурационные файлы вида
`lang_[language_code].yml`:

{% codeblock lang:yaml %}
_data
  lang_en.yml
  lang_ru.yml
{% endcodeblock %}		

Примерное их содержание:

{% codeblock lang:yaml %}
# lang_en.yml
title: English title

# lang_ru.yml
title: Русское название сайта
{% endcodeblock %}
