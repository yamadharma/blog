---
title: "Emacs. Org-mode для написания писем"
author: ["Dmitry S. Kulyabov"]
date: 2022-04-27T15:53:00+03:00
lastmod: 2022-04-27T16:20:00+03:00
tags: ["emacs"]
categories: ["computer-science"]
draft: false
slug: "emacs-org-mode-for-compose-emails"
---

Использование org-mode для написания писем в Emacs.

<!--more-->

{{< toc >}}

Данные пакеты позволяют редактировать сообщения с использованием `org-mode` (см. [Org-mode]({{< relref "2021-10-14-org-mode" >}})).


## <span class="section-num">1</span> Пакет `org-mime` {#пакет-org-mime}


### <span class="section-num">1.1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/org-mime/org-mime>
-   Отправка электропочты в формате HTML с помощью экспорта HTML из _org-mode_.
-   Для набора в _org-mode_ используется отдельное окно.


## <span class="section-num">2</span> Пакет `org-msg` {#пакет-org-msg}


### <span class="section-num">2.1</span> Общая информация {#общая-информация}

-   Репозиторий: <https://github.com/jeremy-compostella/org-msg>
-   Пакет: <https://melpa.org/#/org-msg>
-   Поддерживаемые режимы:
    -   Message mode;
    -   mu4e mode;
    -   notmuch mode.

-Может заменить встроенную в _mu4e_ поддержку `org-mode`.


### <span class="section-num">2.2</span> Зависимости {#зависимости}

-   Необходим пакет [emacs-htmlize](https://github.com/hniksic/emacs-htmlize).


### <span class="section-num">2.3</span> Использование {#использование}

-   `C-c` `C-e` --- генерирует и отображает экспортированную версию электронной почты (`org-msg-preview`).
-   `C-c` `C-k` --- закрывает буфер (`message-kill-buffer`).
-   `C-c` `C-s` --- переход к теме сообщения (как и в режиме сообщения) (`message-goto-subject`).
-   `C-c` `C-b` --- переход к телу сообщения (аналогично `message-goto-body` в режиме сообщения) (`org-msg-goto-body`).
-   `C-c` `C-a` --- добавить (или удалить) вложение (похоже на функцию `org-attach`) (`org-msg-attach`). Список вложений хранится в свойстве `attachment:`.
-   `C-c` `C-c` --- генерирует сообщение MIME и отправляет его (`org-ctrl-c-ctrl-c`).


### <span class="section-num">2.4</span> Настройка {#настройка}

-   Необходимо задать `mail-user-agent` до загрузки `org-msg`:

    ```elisp
    (setq mail-user-agent 'mu4e-user-agent)
    ```


### <span class="section-num">2.5</span> Недостатки {#недостатки}

-   Пакет реализует собственный механизм подключения вложений.
-   Поэтому становится невозможно использование mime-вложений, например, нельзя подписать (электроподписью) сообщение с вложением.


## <span class="section-num">3</span> Модуль `org-mu4e` {#модуль-org-mu4e}


### <span class="section-num">3.1</span> Общая информация {#общая-информация}

-   Входит в пакет _mu4e_ (см. [Emacs. Почта. Mu4e]({{< relref "2020-12-24-emacs-mail-mu4e" >}})).
-   Используется только для _mu4e_.
-   Переключает основной режим буфера сообщений между режимом `org` (когда вы находитесь в теле сообщения) и режимом `mu4e-compose` (когда вы находитесь в области заголовков).
-   Можно преобразовывать текст `org-mode` в `html` при отправлении электрического письма.
-   Пакет считается устаревшим и не поддерживается.


### <span class="section-num">3.2</span> Использование {#использование}

-   Переключение в `org-mu4e-compose-org-mode` при создании сообщения.
-   Преобразование в `html` при отправке сообщения.

    ```emacs-lisp
    (require 'org-mu4e)

    (defun htmlize-and-send ()
      "When in an org-mu4e-compose-org-mode message, htmlize and send it."
      (interactive)
      (when (member 'org~mu4e-mime-switch-headers-or-body post-command-hook)
        (org-mime-htmlize)
        (org-mu4e-compose-org-mode)
        (mu4e-compose-mode)
        (message-send-and-exit)))

    ;; Overload C-c C-c commands in org-mode
    (add-hook 'org-ctrl-c-ctrl-c-hook 'htmlize-and-send t)

    (add-hook 'mu4e-compose-mode-hook
    	  (defun do-compose-stuff ()
    	    "My settings for message composition."
    	    (org-mu4e-compose-org-mode)))
    ```
