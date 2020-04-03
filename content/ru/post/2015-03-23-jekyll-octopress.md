---
categories:
  - soft
date: 2015-03-23T13:51:36+03:00T+00:00
lang: ru
slug: jekyll-octopress
tags:
  - jekyll
title: Перенос блога на Jekyll + Octopress
projects: ["misc-utils"]
---


## Репозиторий для сайта ##

- Создал локальный каталог для сайта:
{% codeblock lang:bash %}
mkdir ~/mysite
{% endcodeblock %}

<!--more-->

### Локальный git-репозиторий ###

- Создал пустой git-репозиторий:
{% codeblock lang:bash %}
cd ~/mysite
git init
{% endcodeblock %}

- Создал в нём файл `README.md`
{% codeblock lang:bash %}
touch README.md
{% endcodeblock %}

- Сделал коммит:
{% codeblock lang:bash %}
git add .
git commit -am 'Initial commit'
{% endcodeblock %}

- Создаю ветку для кода (в `master` будет сайт):
{% codeblock lang:bash %}
git branch source
git checkout source
{% endcodeblock %}

[Далее создаю шаблон для сайта](#head_site-template-create) в ветке `source`.


### Репозиторий на Bitbucket ###

Я пользовался [инструкцией от bitbucket'а][website-on-bitbucket].

- Создал на bitbucket'е репозиторий с названием
`yamadharma.bitbucket.org`.

- Выложил репозиторий
{% codeblock lang:bash %}
cd ~/mysite
git remote add origin git@bitbucket.org:yamadharma/yamadharma.bitbucket.org.git
git push -u origin --all
git push -u origin --tags
{% endcodeblock %}

### Выкладывание сайта на Bitbucket ###

- Создал файл `_deploy.yml` с помощью команды
{% codeblock lang:bash %}
octopress deploy init git -u git@bitbucket.org:yamadharma/yamadharma.bitbucket.org.git
{% endcodeblock %}

- Подредактировал `.gitignore`:
{% codeblock lang:bash %}
echo ".deploy" >> .gitignore
{% endcodeblock %}

- Сгенерил сайт:
{% codeblock lang:bash %}
jekyll b
{% endcodeblock %}

- Выложил существующий сайт:
{% codeblock lang:bash %}
octopress deploy
{% endcodeblock %}

- Положил ветку `source` на git:
{% codeblock lang:bash %}
git add .
git commit -am 'Поправил сайт'
git push
{% endcodeblock %}

## <a name='head_site-template-create'></a> Создание шаблона сайта ##

- В каталоге сайта создаю шаблон:
{% codeblock lang:bash %}
cd ~/mysite
git checkout source
octopress new -f .
{% endcodeblock %}


[website-on-bitbucket]: https://confluence.atlassian.com/display/BITBUCKET/Publishing+a+Website+on+Bitbucket

