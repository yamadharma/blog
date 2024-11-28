---
title: "Emacs. Desire. Конфигурация"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-11T18:55:00+03:00
lastmod: 2024-11-28T20:28:00+03:00
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


### <span class="section-num">3.1</span> Заголовок {#заголовок}

-   В файле `rc.packages.el` находится список используемых пакетов.
-   Заголовок файла:

<!--listend-->

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
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 1:</span>
  rc.packages.el
</div>

-   Файл:

<!--listend-->

```emacs-lisp

;;; Code:

;; (desire-conf 'tiny)
(desire-conf 'personal)
;;
;; Mule
;;
(desire-conf 'mule)
;;(desire-conf 'mule-fontset)
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
```


### <span class="section-num">3.2</span> Компиляция файлов {#компиляция-файлов}


#### <span class="section-num">3.2.1</span> compile-angel {#compile-angel}

-   Подключим пакет:
    ```emacs-lisp
    ;;; compile-angel.el
    (desire 'compile-angel)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 2:</span>
      rc.packages.el
    </div>
-   Настроим начальную конфигурацию:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Compile Emacs Lisp libraries automatically.
    ;;; https://github.com/jamescherti/compile-angel.el

    ;; (require 'compile-angel)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 3:</span>
      packages/compile-angel/loaddefs.ecf
    </div>
-   Настроим основные параметры:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Compile Emacs Lisp libraries automatically.
    ;;; https://github.com/jamescherti/compile-angel.el

    ;;; Ensure Emacs loads the most recent byte-compiled files.
    (setq load-prefer-newer t)

    ;;; Ensure JIT compilation is enabled for improved performance by
    ;;; native-compiling loaded .elc files asynchronously
    (setq native-comp-jit-compilation t)
    (setq native-comp-deferred-compilation t) ; Deprecated in Emacs > 29.1

    ;;; Enable/Disable byte compilation and native compilation
    (setq compile-angel-enable-byte-compile t)
    (setq compile-angel-enable-native-compile t)

    ;;; Enable verbose (Set it to t while debugging)
    (setq compile-angel-verbose nil)

    ';; Display the *Compile-Log* buffer (Set it to t while writing elisp)
    (setq compile-angel-display-buffer nil)

    ;;; Perform byte/native compilation of .el files only once during initial loading
    ;;; (Setting this to nil will try to compile each time an .el file is loaded)
    (setq compile-angel-on-load-mode-compile-once t)

    ;;; Ignore certain files, for example, for users of the `dir-config` package:
    (setq compile-angel-excluded-files-regexps '("/\\.dir-config\\.el$"))

    ;;; Function that determines if an .el file should be compiled. It takes one
    ;;; argument (an EL file) and returns t if the file should be compiled,
    ;;; (By default, `compile-angel-predicate-function` is set to nil, which
    ;;; means that the predicate function is not called.)
    (setq compile-angel-predicate-function
          #'(lambda(el-file)
           ;; Show a message
           (message "PREDICATE: %s" el-file)
           ;; Return t (Compile all)
           t))

    ;; Ensure that quitting only occurs once Emacs finishes native compiling,
    ;; preventing incomplete or leftover compilation files in `/tmp`.
    (setq native-comp-async-query-on-exit t)
    (setq confirm-kill-processes t)

    ;;; Show buffer when there is a warning.
    ;;; (NOT RECOMMENDED, except during development).
    ;; (setq warning-minimum-level :warning)
    ;; (setq byte-compile-verbose t)
    ;; (setq byte-compile-warnings t)
    ;; (setq native-comp-async-report-warnings-errors t)
    ;; (setq native-comp-warning-on-missing-source t)

    ;;; Non-nil means to natively compile packages as part of their installation.
    (setq package-native-compile t)

    (add-hook 'emacs-lisp-mode-hook #'compile-angel-on-save-local-mode)

    (compile-angel-on-save-mode)
    (compile-angel-on-load-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 4:</span>
      packages/compile-angel/desire.ecf
    </div>


### <span class="section-num">3.3</span> Системные настройки {#системные-настройки}

```emacs-lisp

;; (desire 'esup)

(desire-conf 'site-stuff)

;;{{{ Window System

(if (null window-system)
    ()
  (progn
    (desire-conf 'window-system)
                                      ;    (desire-conf  'faces)
                                      ;    (desire-conf  'multi-frame)
    )
  )


;; (if (null window-system)
;;  ()
;;  (desire-conf 'window-system)
;; )

;; (desire-conf 'window-system)
;; (desire-conf 'test)

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
;;      (desire-conf  'faces)
;;      (desire-conf  'multi-frame)
;;    )
;; )

;;}}}
;;{{{ Serve

;;; Gnuserv
;;(desire-conf 'gnuserv nil "gnuserv")
;; Rely on dtemacs to do this, otherwise a race condition can cause
;; dtemacs to fail.
;; (gnuserv-start)

;;; Emacs daemon
;; (desire-conf 'emacs-daemon)

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

(desire-conf 'keys)
(desire-conf 'dialog)
(desire-conf 'mouse)

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


### <span class="section-num">3.4</span> Оформление интерфейса {#оформление-интерфейса}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; UI {{{

    ;; (desire 'ligature)

    ;; (desire 'all-the-icons)
    (desire 'nerd-icons)
    ;; (desire 'mixed-pitch)

    (desire-conf 'fontset)
    (desire-conf 'font-lock)
    (desire-conf 'font-lock-jit)
    ;; (desire-conf 'font-lock-lazy)
    ;; (desire-conf 'font-lock-fast)
    ;; (desire-conf 'faces)
    ;; (desire-conf 'color-theme nil "color-theme")
    ;; (desire-conf 'fira-code-mode nil "fira-code-mode" t) ;; Simple minor mode for Fira Code ligatures

    (desire 'unicode-fonts)

    ;; (desire-conf 'theme)

    ;; (desire 'zoom)

    ;; (desire 'centaur-tabs)
    (desire 'tab-bar)
    (desire 'tab-line)

    ;;;}}}
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 5:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.4.1</span> Нумерация строк {#нумерация-строк}

-   [Emacs. Нумерация строк]({{< relref "2024-11-28-emacs-line-numbering" >}})

<!--list-separator-->

1.  display-line-numbers

    -   Подключаем моду:
        ```emacs-lisp
        ;; (desire 'display-line-numbers)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 6:</span>
          rc.packages.el
        </div>
    -   Сконфигурируем загрузку:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Interface for display-line-numbers

        (global-display-line-numbers-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 7:</span>
          packages/display-line-numbers.ecf
        </div>

<!--list-separator-->

2.  nlinum

    -   Подключаем моду:
        ```emacs-lisp
        (desire 'nlinum)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 8:</span>
          rc.packages.el
        </div>
    -   Сконфигурируем загрузку:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Show line numbers in the margin
        ;;; https://elpa.gnu.org/packages/nlinum.html

        (require 'nlinum)
        (global-nlinum-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 9:</span>
          packages/nlinum.ecf
        </div>


### <span class="section-num">3.5</span> Автодополнение {#автодополнение}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Completion {{{

    ;; (desire 'company)
    (desire 'corfu)

    ;;;}}}
    ```


### <span class="section-num">3.6</span> Автодополнение в минибуфере {#автодополнение-в-минибуфере}


#### <span class="section-num">3.6.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Minibuffer completion {{{
    ```


#### <span class="section-num">3.6.2</span> Ido {#ido}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'ido)
    ```


#### <span class="section-num">3.6.3</span> Helm {#helm}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'helm-posframe)
    ;; (desire 'helm)
    ```


#### <span class="section-num">3.6.4</span> Ivy {#ivy}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'ivy)
    ```


#### <span class="section-num">3.6.5</span> Selectrum {#selectrum}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'selectrum)
    ```


#### <span class="section-num">3.6.6</span> Vertico {#vertico}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'vertico)
    ```


#### <span class="section-num">3.6.7</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp

    ;;;}}}
    ```


### <span class="section-num">3.7</span> Навигация по окнам {#навигация-по-окнам}

-   [Emacs. Окна]({{< relref "2024-10-15-emacs-window" >}})


#### <span class="section-num">3.7.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Window navigation {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 10:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.7.2</span> Windmove {#windmove}

-   [Emacs. Окна. Windmove]({{< relref "2024-10-20-emacs-window-windmove" >}})
-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'windmove)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 11:</span>
      rc.packages.el
    </div>
-   Настройка пакета:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Directional window-selection routinesdirectional window-selection routines
    ;;; https://www.emacswiki.org/emacs/WindMove
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 12:</span>
      packages/windmove.ecf
    </div>

-   По умолчанию используется комбинация `Shift` + стрелки. Но это конфликтует с _org-mode_:
    ```emacs-lisp
    ;;; Shifted arrow keys
    ;; (windmove-default-keybindings)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 13:</span>
      packages/windmove.ecf
    </div>
-   Будем использовать  `Ctrl` + стрелки:
    ```emacs-lisp
    ;;; Ctrl + arrow keys
    (windmove-default-keybindings 'ctrl)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 14:</span>
      packages/windmove.ecf
    </div>

-   Что-то делает:
    ```emacs-lisp
    ;;; Wrap around at edges
    (setq windmove-wrap-around t)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 15:</span>
      packages/windmove.ecf
    </div>

-   Завершим файл:
    ```emacs-lisp
    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 16:</span>
      packages/windmove.ecf
    </div>


#### <span class="section-num">3.7.3</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 17:</span>
      rc.packages.el
    </div>


### <span class="section-num">3.8</span> Общие настройки мод {#общие-настройки-мод}


### <span class="section-num">3.9</span> Поддержка LSP {#поддержка-lsp}

-   [Emacs. Поддержка LSP]({{< relref "2024-01-14-emacs-lsp" >}})


#### <span class="section-num">3.9.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; LSP mode {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 18:</span>
      rc.packages.el
    </div>

-   Включаем поддержку `emacs-lsp-booster`:
    ```emacs-lisp
    (desired 'emacs-lsp-booster :precondition-system-executable "emacs-lsp-booster")
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 19:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.9.2</span> Eglog {#eglog}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'eglot)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 20:</span>
      rc.packages.el
    </div>
-   Начальная загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; A client for Language Server Protocol servers
    ;;; https://github.com/joaotavora/eglot

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 21:</span>
      packages/eglot/loaddefs.ecf
    </div>
-   Загрузка самого пакета:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; A client for Language Server Protocol servers
    ;;; https://github.com/joaotavora/eglot

    (require 'eglot)

    ;;; Control blocking of LSP connection attempts
    (setq eglot-sync-connect nil)

    (setq eglot-connect-timeout 10)
    (setq eglot-autoshutdown t)
    (setq eglot-send-changes-idle-time 0.5)

    ;;; Disable `eglot-auto-display-help-buffer` because :select t in its popup rule causes eglot to steal focus too often.
    (setq eglot-auto-display-help-buffer nil)

    ;;; Disable any debug logging and may speed things up
    (setq eglot-events-buffer-size 0)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 22:</span>
      packages/eglot/desire.ecf
    </div>
-   Загрузка `emacs-lsp-booster`:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Boost eglot using lsp-booster
    ;;; https://github.com/jdtsmith/eglot-booster

    (desire 'eglot-booster :recipe '(:fetcher github :repo "jdtsmith/eglot-booster" :branch "main" :files ("*.el")))
    (require 'eglot-booster)
    (eglot-booster-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 23:</span>
      packages/eglot/emacs-lsp-booster.ecf
    </div>


#### <span class="section-num">3.9.3</span> Lsp-mode {#lsp-mode}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'lsp-mode)
    ```


#### <span class="section-num">3.9.4</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp

    ;;; }}}
    ```


### <span class="section-num">3.10</span> Casual Suite {#casual-suite}

-   [Emacs. Пакет casual]({{< relref "2024-10-26-emacs-casual" >}})


#### <span class="section-num">3.10.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Casual Suite
    (desire 'casual)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 24:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.10.2</span> Основная библиотека {#основная-библиотека}

-   Файл `packages/casual/loaddefs.ecf`:
    ```emacs-lisp
    ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; A collection of opinionated keyboard-driven user interfaces for various built-in Emacs modes
    ;;; https://github.com/kickingvegas/casual

    (require 'casual)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 25:</span>
      packages/casual/loaddefs.ecf
    </div>
-   Файл `packages/casual/desire.ecf`:
    ```emacs-lisp
    ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; A collection of opinionated keyboard-driven user interfaces for various built-in Emacs modes
    ;;; https://github.com/kickingvegas/casual

    (require 'casual-calc)
    (require 'casual-dired)
    (require 'casual-isearch)
    (require 'casual-ibuffer)
    (require 'casual-info)
    (require 'casual-re-builder)
    (require 'casual-bookmarks)
    (require 'casual-editkit)

    (keymap-set calc-mode-map "C-o" #'casual-calc-tmenu)
    (keymap-set dired-mode-map "C-o" #'casual-dired-tmenu)
    (keymap-set isearch-mode-map "C-o" #'casual-isearch-tmenu)
    (keymap-set ibuffer-mode-map "C-o" #'casual-ibuffer-tmenu)
    (keymap-set ibuffer-mode-map "F" #'casual-ibuffer-filter-tmenu)
    (keymap-set ibuffer-mode-map "s" #'casual-ibuffer-sortby-tmenu)
    (keymap-set Info-mode-map "C-o" #'casual-info-tmenu)
    (keymap-set reb-mode-map "C-o" #'casual-re-builder-tmenu)
    (keymap-set reb-lisp-mode-map "C-o" #'casual-re-builder-tmenu)
    (keymap-set bookmark-bmenu-mode-map "C-o" #'casual-bookmarks-tmenu)
    (keymap-global-set "C-o" #'casual-editkit-main-tmenu)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 26:</span>
      packages/casual/desire.ecf
    </div>
-   Файл сделан под все элементы пакета.
-   Необходимо будет разделить всё это по разным пакетам.


#### <span class="section-num">3.10.3</span> Поддержка Avy {#поддержка-avy}

-   Файл `packages/casual/avy.ecf`:
    ```emacs-lisp
    ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; An opinionated Transient menu for Avy.
    ;;; https://github.com/kickingvegas/casual-avy

    (desire 'casual-avy)
    (require 'casual-avy)

    (keymap-global-set "M-g" #'casual-avy-tmenu)

    ;;; Imenu (index) Support
    (add-hook 'markdown-mode-hook #'imenu-add-menubar-index)
    (add-hook 'makefile-mode-hook #'imenu-add-menubar-index)
    (add-hook 'prog-mode-hook #'imenu-add-menubar-index)
    (add-hook 'org-mode-hook #'imenu-add-menubar-index)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 27:</span>
      packages/casual/avy.ecf
    </div>


#### <span class="section-num">3.10.4</span> Поддержка Symbol Overlay {#поддержка-symbol-overlay}

-   Файл `packages/casual/symbol-overlay.ecf`:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; An opinionated Transient user interface for the Emacs package Symbol Overlay.
    ;;; https://github.com/kickingvegas/casual-symbol-overlay

    (desire 'casual-symbol-overlay)
    (require 'casual-symbol-overlay)

    (keymap-set symbol-overlay-map "C-o" #'casual-symbol-overlay-tmenu)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 28:</span>
      packages/casual/symbol-overlay.ecf
    </div>


#### <span class="section-num">3.10.5</span> Поддержка Org-agenda {#поддержка-org-agenda}

-   Файл `packages/org/casual.ecf`:
    ```emacs-lisp
    ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; A collection of opinionated keyboard-driven user interfaces for various built-in Emacs modes
    ;;; https://github.com/kickingvegas/casual

    (require 'casual-agenda)

    (keymap-set org-agenda-mode-map "C-o" #'casual-agenda-tmenu)
    (keymap-set org-agenda-mode-map "M-j" #'org-agenda-clock-goto) ; optional
    (keymap-set org-agenda-mode-map "J" #'bookmark-jump) ; optional

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 29:</span>
      packages/org/casual.ecf
    </div>


### <span class="section-num">3.11</span> Разное {#разное}

-   Файл `rc.packages.el`:

<!--listend-->

```emacs-lisp
;;

(desire 'tree-sitter)

(desire 'hydra)

(desire 'bicycle)
(desire 'hideshow)

(desire-conf 'show-paren)
;; (desire-conf 'folding)
;; (desire-conf 'outline)


(desire 'origami)

;;

(desire 'imenu)

(desire 'ace-window)


;; (desire-conf 'toolbar)

;; Parentesis
(desire 'smartparens)

;;; Spell {{{

;; (desire-conf 'spell)
(desire 'ispell)
(desire 'flyspell)
;;(desire-conf 'speck)
;;(desire-conf 'wcheck)

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

;;(desire-conf 'yasnippet)

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

(desire-conf 'text)
(desire-conf 'markdown-mode nil "markdown-mode" t)

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

(desire 'xenops)
;; (desire 'lsp-latex :precondition-system-executable "texlab")

(desire 'cdlatex)

(desire-conf 'xdvi nil "xdvi-search")
(desired 'reftex)
;; (desire-conf 'tex)
(desired 'preview-latex)
(desire 'auctex)
;; (desire 'auctex :initname "latex")
;; (desire 'auctex :initname "latex" :precondition-lisp-library "tex-site")

;;;}}}
```


### <span class="section-num">3.12</span> Org-mode {#org-mode}

-   [Org-mode]({{< relref "2021-10-14-org-mode" >}})
-   Конфигурация для `org-mode`:
    ```emacs-lisp
    ;;; Org-mode {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 30:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.12.1</span> Babel {#babel}

-   [Emacs. Org Babel]({{< relref "2022-10-15-emacs-org-babel" >}})
-   Общие настройки babel:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Org-Babel
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 31:</span>
      packages/org/desire.ecd/babel.ecf
    </div>
-   Отключим подтверждение запутывания:
    ```emacs-lisp
    ;;; Org-babel confirm before evaluation
    (setq org-confirm-babel-evaluate nil)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 32:</span>
      packages/org/desire.ecd/babel.ecf
    </div>

<!--list-separator-->

1.  org-auto-tangle

    -   Репозиторий: <https://github.com/yilkalargaw/org-auto-tangle/>
    -   Подключим org-auto-tangle:
        ```emacs-lisp
        ;;; A simple emacs package to allow org file tangling upon save
        ;;; https://github.com/yilkalargaw/org-auto-tangle/
        (desire 'org-auto-tangle)
        (require 'org-auto-tangle)
        (add-hook 'org-mode-hook 'org-auto-tangle-mode)

        ;;; Auto-tangle as the default behavior for all org buffers
        ;; (setq org-auto-tangle-default t)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 33:</span>
          packages/org/desire.ecd/babel.ecf
        </div>

<!--list-separator-->

2.  Конец

    ```emacs-lisp
    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 34:</span>
      packages/org/desire.ecd/babel.ecf
    </div>


#### <span class="section-num">3.12.2</span> Разное {#разное}

```emacs-lisp
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
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 35:</span>
  rc.packages.el
</div>


#### <span class="section-num">3.12.3</span> Повестка дня {#повестка-дня}

-   Конфигурация повестки дня:

<!--listend-->

```emacs-lisp
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
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 36:</span>
  rc.packages.el
</div>


#### <span class="section-num">3.12.4</span> org-gtd {#org-gtd}

-   [Emacs. Пакеты. Org-gtd]({{< relref "2023-07-31-emacs-packages-org-gtd" >}})
-   Подключение для загрузки:
    ```emacs-lisp
    ;;; GTD
    (desire 'org-gtd)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 37:</span>
      rc.packages.el
    </div>

<!--list-separator-->

1.  Клавиатурные сочетания


#### <span class="section-num">3.12.5</span> mobileorg {#mobileorg}

```emacs-lisp
(desired 'mobileorg)
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 38:</span>
  rc.packages.el
</div>


#### <span class="section-num">3.12.6</span> org-mode {#org-mode}

```emacs-lisp
(desire 'org)

;;; For messaging
;; (desire 'org-msg)

;;;}}}
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 39:</span>
  rc.packages.el
</div>

<!--list-separator-->

1.  Предпросмотр LaTeX

    -   [Org-mode. Предпросмотр TeX]({{< relref "2024-01-06-org-mode-latex-preview" >}})
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Previewing LaTeX fragments
        ;;; https://orgmode.org/manual/Previewing-LaTeX-fragments.html
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 40:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>
    -   Зададим каталог для создаваемых изображений (по умолчанию они создаются в рабочем каталоге):
        ```emacs-lisp
        ;;; LaTeX image directory
        (setq org-preview-latex-image-directory (concat home-cache-path "org-latex/"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 41:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>
    -   Зададим опции создания изображений:
        ```emacs-lisp
        ;;; Output format
        (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.0))
        (setq org-format-latex-options (plist-put org-format-latex-options :density 600))
        (setq org-format-latex-options (plist-put org-format-latex-options :background "Transparent"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 42:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>
    -   Зададим формат изображений. В данном случае это формат `svg`:
        ```emacs-lisp
        (setq org-latex-create-formula-image-program 'dvisvgm)
        (setq org-preview-latex-process-alist
              '((dvipng :programs
                      ("lualatex" "dvipng")
                      :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
                      (1.0 . 1.0)
                      :latex-compiler
                      ("lualatex -output-format dvi -interaction nonstopmode -output-directory %o %f")
                      :image-converter
                      ("dvipng -D %D -T tight -o %O %f"))
              (dvisvgm :programs
                       ("latex" "dvisvgm")
                       :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :use-xcolor t :image-input-type "xdv" :image-output-type "svg" :image-size-adjust
                       (1.7 . 1.5)
                       :latex-compiler
                       ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                       :image-converter
                       ("dvisvgm %f -n -b min -c %S -o %O"))
              (imagemagick :programs
                           ("latex" "convert")
                           :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
                           (1.0 . 1.0)
                           :latex-compiler
                           ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                           :image-converter
                           ("convert -density %D -trim -antialias %f -quality 100 %O"))))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 43:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>
    -   Теперь зададим настройки для LaTeX:
        ```emacs-lisp
        ;;; Configure latex
        (setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
        ;;; Default position for LaTeX figures
        (setq org-latex-default-figure-position "!htbp")
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 44:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>
    -   Опишем используемые пакеты:
        ```emacs-lisp
        ;;; Unicode fonts
        (add-to-list 'org-latex-packages-alist '("" "unicode-math") t)
        ;;; Physics2 package
        ;; (add-to-list 'org-latex-packages-alist '("" "physics2") t)
        ;;; Math
        (add-to-list 'org-latex-packages-alist '("" "amsmath") t)
        (add-to-list 'org-latex-packages-alist '("" "mathtools") t)
        ;;; Local definitions
        ;; (add-to-list 'org-latex-packages-alist '("" "local-define") t)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 45:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>


### <span class="section-num">3.13</span> Заметочники {#заметочники}

-   [Emacs. Персональная база знаний]({{< relref "2023-11-07-emacs-personal-knowledge-base" >}})
-   Разные заметочники:
    ```emacs-lisp
    ;;; Notes {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 46:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.13.1</span> Org-roam {#org-roam}

```emacs-lisp
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
```


#### <span class="section-num">3.13.2</span> Denote {#denote}

```emacs-lisp

(desire 'deft)
;; (desire-conf 'zetteldeft nil "zetteldeft" t)

(desire 'denote)

;;}}}
```


### <span class="section-num">3.14</span> Разное {#разное}

```emacs-lisp
;; XML, XHTML, HTML {{{

;;(desire-conf 'nxml nil "rng-auto")
                                      ; (desire-conf 'psgml)

;;;}}}
;;;{{{ Palm pilot support

                                      ;(desire-conf 'palm)

;;;}}}
;;; Desktop {{{

;; (desire-conf 'desktop)
(desire-conf 'session nil "session")
(desire-conf 'saveplace nil "saveplace")

(desire 'ibuffer)
;; (desire 'persp-mode)
;; (desire 'perspective)
;; (desire 'bufler)
;; (desire 'tabspaces)

;;}}}
;;; Appointments, diary, calendar {{{

;; Use "M-x calendar RET" to display the calendar and start
;; appointment warnings.

;; (desire-conf 'appt)
(desire 'calendar)
;; (desire-conf 'todo-mode)
;; (desire-conf 'diary "diary-lib")

;;;}}}
;;; These provide options for the various message handling packages {{{

(desire 'browse-url)
;; (desire-conf 'mailcrypt)
;; (desire 'supercite)

;;;}}}
;;; Message {{{

(desire 'smtpmail)
;; (desire 'gnus)
(desire 'message)
;; (desire-conf 'vm)
;; (desire 'wl :ensurename 'wanderlust)
;; (desire-conf 'sendmail)
;; (desire 'mu4e-dashboard :recipe '(:fetcher github :repo "rougier/mu4e-dashboard"))
(desire 'mu4e :precondition-system-executable "mu")

;;;}}}
```

```emacs-lisp
;;; Blogs {{{

;; (desire-conf 'hexo nil "hexo")
;; (desire-conf 'blog-admin nil "blog-admin") ;; Blog admin for emacs with hexo/org-page supported
(desire-conf 'easy-hugo  nil "easy-hugo" t) ;; Emacs major mode for managing hugo

;;;}}}
;;; Miscellaneous {{{

(desire 'ebuku)
(desire-conf 'graphviz-dot-mode nil "graphviz-dot-mode")
;; (desire-conf 'abbrev)
;; (desire-conf 'bibtex)
;; (desire-conf 'calc)
;; (desire-conf 'eiffel-mode)
;; (desire-conf 'filladapt)
;; (desire-conf 'hugs-mode)
;; (desire-conf 'html-helper-mode)
;; (desire-conf 'lispdir)
;; (desire-conf 'php-mode)
;; (desire-conf 'ps-print)
;; (desire-conf 'sh-script)
;; (desire-conf 'shell)
;; (desire-conf 'sql-mode)
;; (desire-conf 'w3)
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


### <span class="section-num">3.15</span> Разные программные режимы {#разные-программные-режимы}


#### <span class="section-num">3.15.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Different program modes {{{
    ```


#### <span class="section-num">3.15.2</span> Пакет csv-mode {#пакет-csv-mode}

-   [Emacs. cvs-mode]({{< relref "2024-09-04-emacs-cvs-mode" >}})
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; csv-mode
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


#### <span class="section-num">3.15.3</span> Поддержка ebuild-файлов {#поддержка-ebuild-файлов}

-   Сайт: <https://wiki.gentoo.org/wiki/Project:Emacs>
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Ebuild files
    (desire 'ebuild-mode :recipe '(:fetcher github :repo "emacsmirror/ebuild-mode" :branch "master"))
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 47:</span>
      rc.packages.el
    </div>
-   Настроим загрузку:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Edit ebuild and eclass files
    ;;; https://wiki.gentoo.org/wiki/Project:Emacs
    ;;; https://github.com/emacsmirror/ebuild-mode

    (add-to-list 'load-path "/usr/share/emacs/site-lisp/ebuild-mode")
    (autoload 'ebuild-mode "ebuild-mode"
      "Major mode for Gentoo .ebuild files." t)
    (autoload 'ebuild-eclass-mode "ebuild-mode"
      "Major mode for Gentoo .eclass files." t)
    (autoload 'ebuild-repo-mode "ebuild-mode"
      "Minor mode for files in an ebuild repository." t)
    (autoload 'ebuild-repo-mode-maybe-enable "ebuild-mode")
    (autoload 'devbook-mode "devbook-mode"
      "Major mode for editing the Gentoo Devmanual." t)
    (autoload 'gentoo-newsitem-mode "gentoo-newsitem-mode"
      "Major mode for Gentoo GLEP 42 news items." t)
    (autoload 'glep-mode "glep-mode"
      "Major mode for Gentoo Linux Enhancement Proposals." t)

    (add-to-list 'auto-mode-alist '("\\.ebuild\\'" . ebuild-mode))
    (add-to-list 'auto-mode-alist '("\\.eclass\\'" . ebuild-eclass-mode))
    (add-to-list 'auto-mode-alist '("/devmanual.*\\.xml\\'" . devbook-mode))
    (add-to-list 'auto-mode-alist
             '("/[0-9]\\{4\\}-[01][0-9]-[0-3][0-9]-.+\\.[a-z]\\{2\\}\\.txt\\'"
               . gentoo-newsitem-mode))
    (add-to-list 'auto-mode-alist '("/glep.*\\.rst\\'" . glep-mode))
    (add-to-list 'auto-mode-alist
             '("/\\(package\\.\\(mask\\|unmask\\|use\\|env\
    \\|license\\|properties\\|accept_\\(keywords\\|restrict\\)\\)\
    \\|\\(package\\.\\)?use.\\(stable\\.\\)?\\(force\\|mask\\)\\)\\'"
               . conf-space-mode))
    (add-to-list 'auto-mode-alist
             '("/make\\.\\(conf\\|defaults\\)\\'" . conf-unix-mode))
    (add-to-list 'interpreter-mode-alist '("openrc-run" . sh-mode))
    (add-to-list 'interpreter-mode-alist '("runscript" . sh-mode))
    (add-hook 'find-file-hook #'ebuild-repo-mode-maybe-enable)
    (modify-coding-system-alist 'file "\\.\\(ebuild\\|eclass\\)\\'" 'utf-8)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 48:</span>
      packages/ebuild-mode/loaddefs.ecf
    </div>


#### <span class="section-num">3.15.4</span> Asymptote {#asymptote}

-   <https://asymptote.sourceforge.io/>

<!--list-separator-->

1.  Редактирование файлов Asymptote

    -   Поддержка редактирования файлов Asymptote.
    -   Файл `rc.packages.el`:
        ```emacs-lisp
        ;;; Asymptote
        (desire 'asy-mode :recipe '(:fetcher github :repo "vectorgraphics/asymptote" :branch "master" :files ("base/asy-mode.el")))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 49:</span>
          rc.packages.el
        </div>
    -   Конфигурационный файл:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; 2D & 3D TeX-Aware Vector Graphics Language
        ;;; https://github.com/vectorgraphics/asymptote

        (autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
        (autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
        (autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
        (add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 50:</span>
          packages/asy-mode.ecf
        </div>

<!--list-separator-->

2.  Поддержка Asymptote в Babel

    -   Репозиторий: <https://github.com/hurrja/ob-asymptote>
    -   Необходимо установить программу Asymptote: <http://asymptote.sourceforge.net/>

    <!--listend-->

    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Org-Babel support for evaluating asymptote
    ;;; https://github.com/hurrja/ob-asymptote

    (desire 'ob-asymptote)
    (require 'ob-asymptote)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 51:</span>
      packages/org/desire.ecd/ob-asymptote.ecf
    </div>


#### <span class="section-num">3.15.5</span> kmonad-файлы {#kmonad-файлы}

-   Поддержка синтаксиса конфигурационных файлов kmonad.
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; kbd-mode
    ;; (desire 'kbd-mode :recipe '(:fetcher github :repo "kmonad/kbd-mode" :branch "master"))
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 52:</span>
      rc.packages.el
    </div>
-   Конфигурационный файл:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Emacs mode for syntax highlighting kmonad's .kbd files.
    ;;; https://github.com/kmonad/kbd-mode

    (autoload 'kdb-mode "kbd-mode.el" "Kmonad's .kbd files" t)
    (add-to-list 'auto-mode-alist '("\\.kbd$" . kbd-mode))

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 53:</span>
      packages/kbd-mode.ecf
    </div>


#### <span class="section-num">3.15.6</span> Julia {#julia}

```emacs-lisp
;;; Julia {{{

;;; Code completion and syntax checking
                                      ;(desire 'eglot-jl)
;;; REPL integration
(desire 'julia-snail)
;; (desire 'julia-repl)
;;; Syntax highlighting and latex symbols
(desire 'julia-mode)
```

<!--list-separator-->

1.  Конец

    -   Файл `rc.packages.el`:
        ```emacs-lisp
        ;;;}}}
        ```


#### <span class="section-num">3.15.7</span> Разное {#разное}

```emacs-lisp
(desire 'speedbar)
;; (desire-conf 'semantic nil "semantic")

;; (desire-conf 'cedet nil "cedet")
;; (desire-conf 'ecb nil "ecb")

;; (desire-conf 'php-mode nil "php-mode")
;; (desire-conf 'eiffel-mode nil "eiffel-mode")

(desire 'ebib)

(desire 'lua-mode)
```

```emacs-lisp


(desire 'yaml-mode)
(desire 'ini-mode)
(desire 'hcl-mode)

(desire 'magit-gitflow)
(desire 'magit)
```


#### <span class="section-num">3.15.8</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```


### <span class="section-num">3.16</span> Редактирование текста в броузере {#редактирование-текста-в-броузере}

-   [Emacs. Редактирование текста в броузере]({{< relref "2024-08-28-emacs-edit-text-area-browser" >}})


#### <span class="section-num">3.16.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Edit text areas in browsers {{{
    ```


#### <span class="section-num">3.16.2</span> Edit with Emacs {#edit-with-emacs}

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


#### <span class="section-num">3.16.3</span> Ghost Text {#ghost-text}

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


#### <span class="section-num">3.16.4</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```


### <span class="section-num">3.17</span> Навигация по файлам {#навигация-по-файлам}

-   [Emacs. Просмотр каталогов]({{< relref "2021-10-03-emacs-directory-browsing" >}})


#### <span class="section-num">3.17.1</span> Dired {#dired}

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


#### <span class="section-num">3.17.2</span> Neotree {#neotree}

-   [Emacs. Neotree]({{< relref "2022-03-23-emacs-neotree" >}})
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'neotree)
    ```


#### <span class="section-num">3.17.3</span> Treemacs {#treemacs}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'treemacs)
    ```


### <span class="section-num">3.18</span> Навигация по тексту {#навигация-по-тексту}


#### <span class="section-num">3.18.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Text navigation {{{
    ```


#### <span class="section-num">3.18.2</span> line-reminder {#line-reminder}

-   Line annotation for changed and saved lines: <https://github.com/emacs-vs/line-reminder>
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Line annotation for changed and saved lines
    (desire 'line-reminder)
    ```
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Line annotation for changed and saved lines
    ;;; https://github.com/emacs-vs/line-reminder

    ;;; Enable for all buffers
    (global-line-reminder-mode t)

    ;;; Display Annotation
    ;;; linum | indicators
    (setq line-reminder-show-option 'linum)

    ;;; Display thumbnail
    (setq line-reminder-thumbnail t)

    ;;;
    ```


#### <span class="section-num">3.18.3</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```


### <span class="section-num">3.19</span> Modeline {#modeline}


#### <span class="section-num">3.19.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Modeline {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 54:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.19.2</span> Общие настройки modeline {#общие-настройки-modeline}

-   Загрузим только конфигурационный файл:
    ```emacs-lisp
    (desire-conf 'modeline)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 55:</span>
      rc.packages.el
    </div>

-   Заголовок файла:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Configure modeline
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 56:</span>
      packages/modeline.ecf
    </div>
-   Показывать столбец, в котором находится курсор (<https://www.gnu.org/software/emacs/manual/html_node/efaq/Displaying-the-current-line-or-column.html>):
    ```emacs-lisp
    ;;; Show column number
    (setq column-number-mode t)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 57:</span>
      packages/modeline.ecf
    </div>
-   Задаём 24-часовой формат времени:
    ```emacs-lisp
    ;;; Time in 24 hour format, plus day and date.
    (setq display-time-day-and-date t)
    (setq display-time-24hr-format t)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 58:</span>
      packages/modeline.ecf
    </div>
-   Мы можем захотеть видеть и секунды:
    ```emacs-lisp
    ;;; Display time in seconds in the mode line
    ;;; %H is the hour on a 24-hour clock, %I is on a 12-hour clock,
    ;;; %k is like %H only blank-padded, %l is like %I blank-padded.
    ;;; %p is the locale's equivalent of either AM or PM.
    ;;; %M is the minute, %S is the second.
    (setq display-time-format "%H:%M:%S")
    (setq display-time-interval 1)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 59:</span>
      packages/modeline.ecf
    </div>

-   Разрешим показывать время в модлайн:
    ```emacs-lisp
    ;;; Enable the display of time and CPU load average in the modeline
    (display-time-mode 1)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 60:</span>
      packages/modeline.ecf
    </div>


#### <span class="section-num">3.19.3</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 61:</span>
      rc.packages.el
    </div>


### <span class="section-num">3.20</span> Темы {#темы}

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


#### <span class="section-num">3.20.1</span> Modus-themes {#modus-themes}

-   [Emacs. Темы. Modus-themes]({{< relref "2023-02-15-emacs-themes-modus-themes" >}})
-   Подключаем темы в файле `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'modus-themes)
    ```


#### <span class="section-num">3.20.2</span> Ef-themes {#ef-themes}

-   [Emacs. Темы. Ef-themes]({{< relref "2023-06-13-emacs-themes-ef-themes" >}})
-   Подключаем темы в файле `rc.packages.el`:
    ```emacs-lisp
    (desire 'ef-themes)
    ```


#### <span class="section-num">3.20.3</span> Финализирование {#финализирование}

-   Финализируем раздел в `rc.packages.el`:
    ```emacs-lisp

    ;;;}}}
    ```


## <span class="section-num">4</span> Финализирование {#финализирование}

-   Финализируем файл `rc.packages.el`:
    ```emacs-lisp

    ;;; rc.packages.el ends here
    ```
