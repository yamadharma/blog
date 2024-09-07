---
title: "Emacs. Desire. Конфигурация"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-11T18:55:00+03:00
lastmod: 2024-09-04T11:32:00+03:00
tags: ["emacs"]
categories: ["computer-science"]
draft: false
slug: "emacs-desire-configuration"
---

Конфигурация для пакета desire.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Каталоги конфигурации {#каталоги-конфигурации}


## <span class="section-num">2</span> Установка переменных {#установка-переменных}


## <span class="section-num">3</span> Конфигурационные файлы {#конфигурационные-файлы}

-   В файле `rc.packages.el` находится список используемых пакетов:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; origami-fold-style: triple-braces; -*-
    ;;; rc.packages.el

    ;;; Commentary:

    ;;
    ;;  File id
    ;;
    ;;      Copyright (C)  2002-2024 Dmitry S. Kulyabov
    ;;      Keywords:      rc.packages
    ;;      Author:        Dmitry S. Kulyabov <yamadharma@gmail.com>
    ;;      Maintainer:    Dmitry S. Kulyabov <yamadharma@gmail.com>
    ;;
    ;;      This code is free software in terms of GNU Gen. pub. Lic. v3 or later
    ;;
    ;;  Description
    ;;
    ;;

    ;;; Change Log:

    ;;; Code:

    ;; (desire-old 'tiny)
    (desire-old 'personal)
    ;;
    ;; Mule
    ;;
    (desire-old 'mule)
    ;;(desire-old 'mule-fontset)
    ;; ----------------------------------------------------------------------
    ;;
    ;;{{{ Xemacs

    (if (string-match "XEmacs" emacs-version)
        (desired 'xemacs))

    ;;}}}
    ;;; Package {{{

    ;;; Packaging
    (desire 'package)

    ;;; Build and install your Emacs Lisp packages on-the-fly and directly from source
    (desire 'quelpa)

    ;;; A declarative package management system with a command line interface
    ;; (desire 'straight)

    ;;; Auto update packages
    (desire 'auto-package-update)

    ;;;}}}

    ;; (desire 'esup)

    (desire-old 'site-stuff)

    ;;{{{ Window System

    (if (null window-system)
        ()
      (progn
        (desire-old 'window-system)
    ;    (desire-old  'faces)
    ;    (desire-old  'multi-frame)
      )
    )


    ;; (if (null window-system)
    ;;  ()
    ;;  (desire-old 'window-system)
    ;; )

    ;; (desire-old 'window-system)
    ;; (desire-old 'test)

    ;; (if (eq window-system 'w32)
    ;;  (progn
    ;;    (desired 'window-system)
    ;;    (desired 'window-system-w32)
    ;;  )
    ;; )

    ;; (if (and window-system
    ;;	 (member window-system '(x gtk))
    ;;	 (x-display-color-p)
    ;;    )
    ;;    (progn
    ;;      (desired 'window-system)
    ;;      (desire-old  'faces)
    ;;      (desire-old  'multi-frame)
    ;;    )
    ;; )

    ;;}}}
    ;;{{{ Serve

    ;;; Gnuserv
    ;;(desire-old 'gnuserv nil "gnuserv")
    ;; Rely on dtemacs to do this, otherwise a race condition can cause
    ;; dtemacs to fail.
    ;; (gnuserv-start)

    ;;; Emacs daemon
    ;; (desire-old 'emacs-daemon)

    ;;; Emacs server
    (desire 'server)

    ;;}}}

    (desire 'general)

    (desire 'exec-path-from-shell)
    (desire 'compat)

    (desire 'async)
    ;; (desire 'gcmh)

    ;; ----------------------------------------------------------------------

    ;;{{{ Session Management

    (desire 'savehist)

    ;;}}}

    (desire 'uniquify)

    (desire-old 'keys)
    (desire-old 'dialog)
    (desire-old 'mouse)

    ;; (desire 'xclip)

    (desire 'which-key)
    ;; (desire 'keycast)

    ;; ----------------------------------------------------------------------

    (desire 'pcache)
    (desire 'persistent-soft)

    (desire 'alert)

    (desire 'rg :precondition-system-executable "rg")
    ```

-   В файле используется фолдинг по тройной скобке.


## <span class="section-num">4</span> Конфигурация пакетов {#конфигурация-пакетов}


### <span class="section-num">4.1</span> Оформление интерфейса {#оформление-интерфейса}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; UI {{{

    ;; (desire 'ligature)

    ;; (desire 'all-the-icons)
    (desire 'nerd-icons)
    ;; (desire 'mixed-pitch)

    (desire-old 'fontset)
    (desire-old 'font-lock)
    (desire-old 'font-lock-jit)
    ;; (desire-old 'font-lock-lazy)
    ;; (desire-old 'font-lock-fast)
    ;; (desire-old 'faces)
    ;; (desire-old 'color-theme nil "color-theme")
    ;; (desire-old 'fira-code-mode nil "fira-code-mode" t) ;; Simple minor mode for Fira Code ligatures

    (desire 'unicode-fonts)

    ;; (desire-old 'theme)
    ;; (desire-old 'modeline)

    ;; (desire 'zoom)

    ;; (desire 'centaur-tabs)
    (desire 'tab-bar)
    (desire 'tab-line)

    ;;;}}}
    ```


### <span class="section-num">4.2</span> Поддержка LSP {#поддержка-lsp}

-   [Emacs. Поддержка LSP]({{< relref "2024-01-14-emacs-lsp" >}})


#### <span class="section-num">4.2.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; LSP mode {{{

    (desired 'emacs-lsp-booster :precondition-system-executable "emacs-lsp-booster")
    ```


#### <span class="section-num">4.2.2</span> Eglog {#eglog}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'eglot)
    ```


#### <span class="section-num">4.2.3</span> Lsp-mode {#lsp-mode}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'lsp-mode)
    ```


#### <span class="section-num">4.2.4</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp

    ;;; }}}
    ```


### <span class="section-num">4.3</span> Автодополнение {#автодополнение}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Completion {{{

    ;; (desire 'company)
    (desire 'corfu)

    ;;;}}}
    ```


### <span class="section-num">4.4</span> Автодополнение в минибуфере {#автодополнение-в-минибуфере}


#### <span class="section-num">4.4.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Minibuffer completion {{{
    ```


#### <span class="section-num">4.4.2</span> Ido {#ido}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'ido)
    ```


#### <span class="section-num">4.4.3</span> Helm {#helm}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'helm-posframe)
    ;; (desire 'helm)
    ```


#### <span class="section-num">4.4.4</span> Ivy {#ivy}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'ivy)
    ```


#### <span class="section-num">4.4.5</span> Selectrum {#selectrum}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'selectrum)
    ```


#### <span class="section-num">4.4.6</span> Vertico {#vertico}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'vertico)
    ```


#### <span class="section-num">4.4.7</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp

    ;;;}}}
    ```


### <span class="section-num">4.5</span> Общие настройки мод {#общие-настройки-мод}


### <span class="section-num">4.6</span> Org-mode {#org-mode}


### <span class="section-num">4.7</span> Разное {#разное}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;

    (desire 'tree-sitter)

    (desire 'hydra)

    (desire 'bicycle)
    (desire 'hideshow)

    (desire-old 'show-paren)
    ;; (desire-old 'folding)
    ;; (desire-old 'outline)


    (desire 'origami)

    ;;

    (desire 'imenu)

    (desire 'ace-window)


    ;; (desire-old 'toolbar)

    ;; Parentesis
    (desire 'smartparens)

    ;;; Spell {{{

    ;; (desire-old 'spell)
    (desire 'ispell)
    (desire 'flyspell)
    ;;(desire-old 'speck)
    ;;(desire-old 'wcheck)

    ;; (desire 'flycheck-languagetool)
    ;; (desire 'langtool)

    ;; (desire 'lsp-ltex :recipe '(:fetcher github :repo "emacs-languagetool/lsp-ltex" :branch "master" :files ("*.el")))
    ;; (desire 'eglot-ltex :recipe '(:fetcher github :repo "emacs-languagetool/eglot-ltex" :branch "master" :files ("*.el")))

    ;;;}}}
    ;;; Adress book {{{

    (desired 'vcard)
    (desire 'khardel :precondition-system-executable "khard")
    (desire 'khalel :precondition-system-executable "khal")
    ;; (desire 'org-vcard)
    ;; (desire 'vdirel)
    ;; (desire 'bbdb)

    ;;;}}}
    ;;; Bibliography {{{

    (desire 'biblio)
    (desire 'bibtex)

    ;;;}}}
    ;;; Projects {{{

    ;; (desire 'project)
    (desire 'projectile)

    ;;;}}}

    ;;(desire-old 'yasnippet)

    ;;; Text {{{

    (desire 'texfrag)

    ;; (desire 'adaptive-wrap)
    (desired 'visual-line-mode)

    ;; (desired 'prettify-symbols-mode)
    ;; (desire 'pretty-mode)
    ;; (desire 'prettify-math)
    ;; (desire 'math-preview)

    (desire 'pandoc-mode)

    (desire' mermaid-mode :precondition-system-executable "mmdc")

    (desire-old 'text)
    (desire-old 'markdown-mode nil "markdown-mode" t)

    (desire 'plantuml-mode)

    (desire 'pdf-tools)
    (desire 'nov)
    (desire 'fb2-reader)

    ;; (desire 'valign)

    ;;;}}}
    ;;; Time management {{{

    (desire 'pomm)
    (desire 'org-pomodoro)
    ;; (desire 'hammy)

    ;;;}}}
    ;;; LaTeX {{{

    ;; (desire 'xenops)
    ;; (desire 'lsp-latex :precondition-system-executable "texlab")

    (desire 'cdlatex)

    (desire-old 'xdvi nil "xdvi-search")
    (desired 'reftex)
    ;; (desire-old 'tex)
    (desired 'preview-latex)
    (desire 'auctex)
    ;; (desire 'auctex :initname "latex")
    ;; (desire 'auctex :initname "latex" :precondition-lisp-library "tex-site")

    ;;;}}}
    ;;; Org-mode {{{

    ;; (desire 'org-ql)

    (desire 'org-appear)
    (desire 'org-fragtog)
    (desire 'org-custom-cookies)
    ;; (desire 'svg-tag-mode)
    (desire 'org-superstar)
    ;; (desire 'org-modern-indent :recipe '(:fetcher github :repo "jdtsmith/org-modern-indent" :branch "main" :files ("*.el")))
    (desire 'org-modern)
    ;; (desire 'org-contacts)
    ;; (desire 'google-contacts)
    (desire 'org-edna)
    (desire 'org-ref)
    (desire 'org-tree-slide)

    ;;; Agenda
    (desire 'org-super-agenda)

    ;;(if (desiredp 'org-ql)
    ;; (desire 'org-agenda-files-track-ql)
    (desire 'org-agenda-files-track)
    ;;)

    ;;(if (desiredp 'org-ql)
    ;; (desire 'org-agenda-files-track-ql :recipe '(:fetcher github :repo "nicolas-graves/org-agenda-files-track" :branch "master" :files ("org-agenda-files-track-ql.el")))
    ;; (desire 'org-agenda-files-track :recipe '(:fetcher github :repo "nicolas-graves/org-agenda-files-track" :branch "master" :files ("org-agenda-files-track.el")))
    ;;)

    ;;; Literate
    (desire 'org-tanglesync)

    ;; (desire 'org-gcal)
    (desire 'org-journal)

    (desire 'org-noter)
    ;; (desire 'org-noter :recipe '(:fetcher github :repo "org-noter/org-noter" :branch "feature/org-roam-integration" :files ("*.el" "modules/*.el")))

    (desire 'org-transclusion)
    (desire 'org-gtd)

    (desired 'mobileorg)
    (desire 'org)

    ;;; For messaging
    ;; (desire 'org-msg)

    ;;;}}}
    ;;; Org-roam {{{

    (desire 'emacsql)

    ;; (desire 'delve :recipe '(:fetcher github :repo "publicimageltd/delve" :branch "main"))
    (desire 'zetteldesk)

    ;; (desire 'org-roam-server)
    ;; (desire 'org-roam-ui :recipe '(:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))
    ;; (desire 'org-roam-ui :recipe '(:fetcher github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))
    (desire 'org-roam-ui)


    (desire 'magit-section)
    (desire 'org-roam)

    ;;;}}}
    ;;; Notes {{{

    (desire 'deft)
    ;; (desire-old 'zetteldeft nil "zetteldeft" t)

    (desire 'denote)

    ;;}}}
    ;; XML, XHTML, HTML {{{

    ;;(desire-old 'nxml nil "rng-auto")
    ; (desire-old 'psgml)

    ;;;}}}
    ;;;{{{ Palm pilot support

    ;(desire-old 'palm)

    ;;;}}}
    ;;; Desktop {{{

    ;; (desire-old 'desktop)
    (desire-old 'session nil "session")
    (desire-old 'saveplace nil "saveplace")

    (desire 'ibuffer)
    ;; (desire 'persp-mode)
    ;; (desire 'perspective)
    ;; (desire 'bufler)
    ;; (desire 'tabspaces)

    ;;}}}
    ;;; Appointments, diary, calendar {{{

    ;; Use "M-x calendar RET" to display the calendar and start
    ;; appointment warnings.

    ;; (desire-old 'appt)
    (desire 'calendar)
    ;; (desire-old 'todo-mode)
    ;; (desire-old 'diary "diary-lib")

    ;;;}}}
    ;;; These provide options for the various message handling packages {{{

    (desire 'browse-url)
    ;; (desire-old 'mailcrypt)
    ;; (desire 'supercite)

    ;;;}}}
    ;;; Message {{{

    (desire 'smtpmail)
    ;; (desire 'gnus)
    (desire 'message)
    ;; (desire-old 'vm)
    ;; (desire 'wl :ensurename 'wanderlust)
    ;; (desire-old 'sendmail)
    ;; (desire 'mu4e-dashboard :recipe '(:fetcher github :repo "rougier/mu4e-dashboard"))
    (desire 'mu4e :precondition-system-executable "mu")

    ;;;}}}
    ;;; Programming {{{

    (desire 'speedbar)
    ;; (desire-old 'semantic nil "semantic")

    ;; (desire-old 'cedet nil "cedet")
    ;; (desire-old 'ecb nil "ecb")

    ;; (desire-old 'php-mode nil "php-mode")
    ;; (desire-old 'eiffel-mode nil "eiffel-mode")

    (desire 'ebib)

    (desire 'lua-mode)

    ;;; Julia
    ;;; Code completion and syntax checking
    ;(desire 'eglot-jl)
    ;;; REPL integration
    (desire 'julia-snail)
    ;; (desire 'julia-repl)
    ;;; Syntax highlighting and latex symbols
    (desire 'julia-mode)


    (desire 'yaml-mode)
    (desire 'ini-mode)
    (desire 'hcl-mode)

    (desire 'magit-gitflow)
    (desire 'magit)

    ;;;}}}
    ;;; Blogs {{{

    ;; (desire-old 'hexo nil "hexo")
    ;; (desire-old 'blog-admin nil "blog-admin") ;; Blog admin for emacs with hexo/org-page supported
    (desire-old 'easy-hugo  nil "easy-hugo" t) ;; Emacs major mode for managing hugo

    ;;;}}}
    ;;; Miscellaneous {{{

    (desire 'ebuku)
    (desire-old 'graphviz-dot-mode nil "graphviz-dot-mode")
    ;; (desire-old 'abbrev)
    ;; (desire-old 'bibtex)
    ;; (desire-old 'calc)
    ;; (desire-old 'eiffel-mode)
    ;; (desire-old 'filladapt)
    ;; (desire-old 'hugs-mode)
    ;; (desire-old 'html-helper-mode)
    ;; (desire-old 'lispdir)
    ;; (desire-old 'php-mode)
    ;; (desire-old 'ps-print)
    ;; (desire-old 'sh-script)
    ;; (desire-old 'shell)
    ;; (desire-old 'sql-mode)
    ;; (desire-old 'w3)
    (desire 'web-mode)
    (desire 'gnuplot)

    (desire 'pass)


    (desire 'multiple-cursors)

    (desire 'telega)
    (desire 'pocket-reader)

    ;;;}}}

    ;; (desire 'grammarly)

    ;; (desire 'flycheck-grammarly)

    (desire 'dashboard)

    ;; PERSONAL

    ;; (require 'chord-mode)  ; edit guitar music.
    ;; (require 'discography) ; variant of BibTeX mode for discographies.
    ```


### <span class="section-num">4.8</span> Программные режимы {#программные-режимы}


#### <span class="section-num">4.8.1</span> Работа с CSV {#работа-с-csv}

<!--list-separator-->

1.  Начало

    -   Файл `rc.packages.el`:
        ```emacs-lisp
        ;;; CSV files {{{
        ```

<!--list-separator-->

2.  Пакет csv-mode

    -   [Emacs. cvs-mode]({{< relref "2024-09-04-emacs-cvs-mode" >}})
    -   Файл `rc.packages.el`:
        ```emacs-lisp
        (desire 'csv-mode)
        ```
    -   Установим вызов `cvs-mode` для расширения `.cvs`.
        -   Файл `packages/csv-mode/loaddefs.ecf`:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Major mode for editing comma/char separated values
            ;;; https://elpa.gnu.org/packages/csv-mode.html

            (add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))

            ;;;
            ```
    -   Загружаем пакет при необходимости.
        -   Файл `packages/csv-mode/desire.ecf`:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Major mode for editing comma/char separated values
            ;;; https://elpa.gnu.org/packages/csv-mode.html

            (require 'csv-mode)
            ```
    -   Подключим режим визуального выравнивания полей.
        -   Файл `packages/csv-mode/desire.ecf`:
            ```emacs-lisp
            ;;; Keeps fields visually aligned, on-the-fly
            (add-hook 'csv-mode-hook 'csv-align-mode)
            ```
    -   Настроим визуально представление длинных строк.
        -   Файл `packages/csv-mode/desire.ecf`:
            ```emacs-lisp
            (add-hook 'csv-mode-hook '(lambda () (interactive) (toggle-truncate-lines nil)))

            ;;;
            ```

<!--list-separator-->

3.  Конец

    -   Файл `rc.packages.el`:
        ```emacs-lisp
        ;;;}}}
        ```


### <span class="section-num">4.9</span> Редактирование текста в броузере {#редактирование-текста-в-броузере}

-   [Emacs. Редактирование текста в броузере]({{< relref "2024-08-28-emacs-edit-text-area-browser" >}})


#### <span class="section-num">4.9.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Edit text areas in browsers {{{
    ```


#### <span class="section-num">4.9.2</span> Edit with Emacs {#edit-with-emacs}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'edit-server)
    ```
-   Файл `packages/edit-server.ecf`:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; A Chromium/Firefox "clone" of It's All Text for spawning an editor to edit text areas in browsers. Based on David Hilley's original Chromium extension.
    ;;; https://github.com/stsquad/emacs_chrome

    (require 'edit-server)

    (setq edit-server-new-frame nil)
    (edit-server-start)

    (setq edit-server-url-major-mode-alist
          '(("github\\.com" . markdown-mode)))

    ;;;
    ```


#### <span class="section-num">4.9.3</span> Ghost Text {#ghost-text}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'atomic-chrome)
    ```
-   Файл `packages/atomic-chrome.ecf`:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Edit text area on Chrome with Emacs using Atomic Chrome
    ;;; https://github.com/alpha22jp/atomic-chrome

    (require 'atomic-chrome)
    (atomic-chrome-start-server)

    ;;; Atomic Chrome for Emacs automatically reflects modifications to the browser by default
    (setq atomic-chrome-enable-auto-update t)

    ;;; The default major mode of editing buffer is `text-mode`. You can change the major mode manually
    (setq atomic-chrome-default-major-mode 'markdown-mode)

    ;;; Choose the major mode for a specific website
    (setq atomic-chrome-url-major-mode-alist
          '(("github\\.com" . gfm-mode)
            ("redmine" . textile-mode)))

    ;;; Select editing buffer style
    ;;; full: Open in the selected window.
    ;;; split: Open in the new window by splitting the selected window (default).
    ;;; frame: Create a new frame and window in it.
    ;; (setq atomic-chrome-buffer-open-style split)

    ;;;
    ```


#### <span class="section-num">4.9.4</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```


### <span class="section-num">4.10</span> Навигация по файлам {#навигация-по-файлам}

-   [Emacs. Просмотр каталогов]({{< relref "2021-10-03-emacs-directory-browsing" >}})


#### <span class="section-num">4.10.1</span> Dired {#dired}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Dired {{{

    (desire 'mouse3 :recipe '(:fetcher github :repo "emacsmirror/mouse3" :branch "master" :files ("*.el")))

    (desire 'dired)
    (desire 'dired+ :recipe '(:fetcher github :repo "emacsmirror/dired-plus" :branch "master" :files ("*.el")))

    ;; (desire 'ranger)
    ;; (desire 'efar)
    ;; (desire 'sunrise-commander :recipe '(:fetcher github :repo "sunrise-commander/sunrise-commander"))
    (desire 'dirvish)
    ;; (desire 'diredc)

    ;;;}}}
    ```


#### <span class="section-num">4.10.2</span> Neotree {#neotree}

-   [Emacs. Neotree]({{< relref "2022-03-23-emacs-neotree" >}})
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'neotree)
    ```


#### <span class="section-num">4.10.3</span> Treemacs {#treemacs}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'treemacs)
    ```


### <span class="section-num">4.11</span> Темы {#темы}

-   Подключаем темы в файле `rc.packages.el`:
    ```emacs-lisp
    ;;; Themes {{{

    ;;; Nested menu for minor modes
    (desire 'minions)

    ;;; Tabs and ribbons for the mode-line
    (desire 'moody)

    ;;; Spacemacs theme
    ;; (desire 'spacemacs-theme :precondition-lisp-library "spacemacs-theme-pkg")

    ;;; Doom themes
    ;; (desire 'doom-themes)

    ;; (desire 'zenburn-theme)
    ;; (desire 'lambda-themes :recipe '(:fetcher github :repo "Lambda-Emacs/lambda-themes" :branch "main"))
    ;; (desire 'tao-theme)

    ;;; N Λ N O Theme
    ;; (desire 'nano-theme)

    ;;; Increase the padding/spacing of frames and windows
    ;; (desire 'spacious-padding)

    ```


#### <span class="section-num">4.11.1</span> Modus-themes {#modus-themes}

-   [Emacs. Темы. Modus-themes]({{< relref "2023-02-15-emacs-themes-modus-themes" >}})
-   Подключаем темы в файле `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'modus-themes)
    ```


#### <span class="section-num">4.11.2</span> Ef-themes {#ef-themes}

-   [Emacs. Темы. Ef-themes]({{< relref "2023-06-13-emacs-themes-ef-themes" >}})
-   Подключаем темы в файле `rc.packages.el`:
    ```emacs-lisp
    (desire 'ef-themes)
    ```


#### <span class="section-num">4.11.3</span> Финализирование {#финализирование}

-   Финализируем раздел в `rc.packages.el`:
    ```emacs-lisp

    ;;;}}}
    ```


## <span class="section-num">5</span> Финализирование {#финализирование}

-   Финализируем файл `rc.packages.el`:
    ```emacs-lisp

    ;;; rc.packages.el ends here
    ```