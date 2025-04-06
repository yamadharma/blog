---
title: "Emacs. Desire. Конфигурация"
author: ["Dmitry S. Kulyabov"]
date: 2024-06-11T18:55:00+03:00
lastmod: 2025-04-04T07:57:00+03:00
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
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; origami-fold-style: triple-braces; -*-
    ;;; rc.packages.el

    ;;; Commentary:

    ;;
    ;;  File id
    ;;
    ;;      Copyright (C)  2002-2025 Dmitry S. Kulyabov
    ;;      Keywords:      rc.packages
    ;;      Author:        Dmitry S. Kulyabov <yamadharma@gmail.com>
    ;;      Maintainer:    Dmitry S. Kulyabov <yamadharma@gmail.com>
    ;;
    ;;      This code is free software in terms of GNU Gen. pub. Lic. v3 or later
    ;;

    ;;;  Description:

    ;;; Change Log:

    ;;; Code:

    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 1:</span>
      rc.packages.el
    </div>

-   Файл:

<!--listend-->

```emacs-lisp
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
```


### <span class="section-num">3.2</span> Управление пакетами {#управление-пакетами}

-   [Emacs. Управление пакетами]({{< relref "2023-12-18-emacs-package-management" >}})

<!--listend-->

```emacs-lisp
;;; Package management
```


#### <span class="section-num">3.2.1</span> Встроенный пакетный менеджер {#встроенный-пакетный-менеджер}

-   [Emacs. Управление пакетами. package]({{< relref "2025-01-25--emacs-package-management-package" >}})

<!--listend-->

```emacs-lisp
;;; Packaging
(desire 'package)
```


#### <span class="section-num">3.2.2</span> Пакетный менеджер quelpa {#пакетный-менеджер-quelpa}

-   Необходим для emacs-29 и старше.
-   Начиная с emacs-30 можно использовать `package-vc.`
-   Подключение:
    ```emacs-lisp
    ;;; Build and install your Emacs Lisp packages on-the-fly and directly from source
    ;; (desire 'quelpa)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 2:</span>
      rc.packages.el
    </div>
-   Загружаем:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Build and install your Emacs Lisp packages on-the-fly directly from source
    ;; https://github.com/quelpa/quelpa

    (require 'quelpa)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 3:</span>
      packages/quelpa/loaddefs.ecf
    </div>
-   Асинхронные операции:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Build and install your Emacs Lisp packages on-the-fly directly from source
    ;; https://github.com/quelpa/quelpa

    ;;; If non-nil, quelpa operation will not block Emacs input
    ;; (setq quelpa-async-p t)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 4:</span>
      packages/quelpa/desire.ecf
    </div>
-   Обновление пакетов:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Build and install your Emacs Lisp packages on-the-fly directly from source
    ;; https://github.com/quelpa/quelpa

    ;;; To run quelpa-upgrade-all at most every 14 days
    ;; (setq quelpa-upgrade-interval 14)
    ;; (add-hook #'after-init-hook #'quelpa-upgrade-all-maybe)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 5:</span>
      packages/quelpa/personal.ecf
    </div>


#### <span class="section-num">3.2.3</span> Пакетный менеджер straight {#пакетный-менеджер-straight}

```emacs-lisp
;;; A declarative package management system with a command line interface
(desire 'straight)
```


#### <span class="section-num">3.2.4</span> Автообновление пакетов {#автообновление-пакетов}

```emacs-lisp
;;; Auto update packages
(desire 'auto-package-update)

;;;}}}
```


### <span class="section-num">3.3</span> Компиляция файлов {#компиляция-файлов}


#### <span class="section-num">3.3.1</span> compile-angel {#compile-angel}

-   Подключим пакет:
    ```emacs-lisp
    ;;; compile-angel.el
    (desire 'compile-angel)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 6:</span>
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
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 7:</span>
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
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 8:</span>
      packages/compile-angel/desire.ecf
    </div>


### <span class="section-num">3.4</span> Системные настройки {#системные-настройки}

```emacs-lisp

;; (desire 'esup)
```


#### <span class="section-num">3.4.1</span> Разные настройки {#разные-настройки}

-   Покидал сюда разные настройки, которые не знаю, куда разместить.
-   Подключение:
    ```emacs-lisp
    (desire-conf 'site-stuff)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 9:</span>
      rc.packages.el
    </div>
-   Подключение:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-

    ;;; Code:
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 10:</span>
      packages/site-stuff.ecf
    </div>
-   Изменение поведения `C-g`:
    ```emacs-lisp
    ;;;; Make C-g a bit more helpful
    ;;;;; https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/

    (defun ecf/keyboard-quit-dwim ()
      "Do-What-I-Mean behaviour for a general `keyboard-quit'.

    The generic `keyboard-quit' does not do the expected thing when
    the minibuffer is open.  Whereas we want it to close the
    minibuffer, even without explicitly focusing it.

    The DWIM behaviour of this command is as follows:

    - When the region is active, disable it.
    ​- When a minibuffer is open, but not focused, close the minibuffer.
    ​- When the Completions buffer is selected, close it.
    ​- In every other case use the regular `keyboard-quit'."
      (interactive)
      (cond
       ((region-active-p)
        (keyboard-quit))
       ((derived-mode-p 'completion-list-mode)
        (delete-completion-window))
       ((> (minibuffer-depth) 0)
        (abort-recursive-edit))
       (t
        (keyboard-quit))))

    (define-key global-map (kbd "C-g") #'ecf/keyboard-quit-dwim)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 11:</span>
      packages/site-stuff.ecf
    </div>
-   Оформление интерфейса:
    ```emacs-lisp
    ;;;; Scroll bar mode
    (set-scroll-bar-mode 'left)
    (scroll-bar-mode -1)

    ;;;; Disable the toolbar
    (tool-bar-mode -1)

    ;;;; Menu bar
    (menu-bar-mode 1)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 12:</span>
      packages/site-stuff.ecf
    </div>

<!--listend-->

```emacs-lisp
;;; Automatic decompression, hooks for tar-mode
;;;
;;(require 'jka-compr)
(auto-compression-mode t)

(require 'icomplete) ; Interactive completion in minibuffer.

;; Strip hostname from domain when posting news
                                      ;(setq gnus-use-generic-from t)

                                      ;(auto-compression-mode t)
;; Time in 24 hour format, plus day and date.
;;
(add-hook 'write-file-hooks 'time-stamp)
                                      ; (require 'mc)


(setq max-specpdl-size 1000)


;;; Set the fringe a little wider to ensure the text isn’t too close to the window border
;; (fringe-mode 16 . nil)

;; Strip iccc encoding when paste from clipboard
                                      ;(defun fix-rus-letter ()
                                      ;  (interactive)
                                      ;  (goto-char (point-min))
                                      ;  (while (search-forward-regexp ".%/1..koi8-r." nil t)
                                      ;    (replace-match ""))
                                      ;)

;;; Показывает пробелы и табы в конце строк
(setq show-trailing-whitespace t)

;;; Prevent horizontal window splitting for Emacs 23
;; (setq split-width-threshold 9999)

(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

;;; Отключить создание резервных копий
(custom-set-variables '(make-backup-files nil "Отключить создание резервных копий"))

;;; Cursor
(custom-set-variables '(cursor-type 'bar "Внешний вид курсора — вертикальная черта"))
;; Отключить мерцание курсора
(blink-cursor-mode 0)

;;; Highlight Current Line
(global-hl-line-mode 1)

;;; Warnings
;;; Disable report warnings and errors from asynchronous native compilation
(setq native-comp-async-report-warnings-errors nil)

;;; Not to warn you about anything except problems
;;; :debug | :warning | :error | :emergency
(setq warning-minimum-level :error)

;;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)

;;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;;; Make searches case insensitive
(setq case-fold-search t)

;;; Tab completion in minibuffer: case insensitive
(setq completion-ignore-case  t)

;;;
```


#### <span class="section-num">3.4.2</span> Разное {#разное}

```emacs-lisp

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
```


### <span class="section-num">3.5</span> Общие настройки мод {#общие-настройки-мод}


### <span class="section-num">3.6</span> Поддержка LSP {#поддержка-lsp}

-   [Emacs. Поддержка LSP]({{< relref "2024-01-14-emacs-lsp" >}})


#### <span class="section-num">3.6.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; LSP mode {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 13:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.6.2</span> emacs-lsp-booster {#emacs-lsp-booster}

-   Включаем поддержку `emacs-lsp-booster`:
    ```emacs-lisp
    (desired 'emacs-lsp-booster :precondition-system-executable "emacs-lsp-booster")
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 14:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.6.3</span> Eglog {#eglog}

<!--list-separator-->

1.  Сам Eglot

    -   Файл `rc.packages.el`:
        ```emacs-lisp
        ;; (desire 'eglot)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 15:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 16:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 17:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 18:</span>
          packages/eglot/emacs-lsp-booster.ecf
        </div>

<!--list-separator-->

2.  Дополнительные пакеты

    <!--list-separator-->

    1.  LaTeX

        -   Загрузим поддержку LSP для LaTeX:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; A client for Language Server Protocol servers
            ;;; https://github.com/joaotavora/eglot

            (require 'eglot)

            ;;; Change order
            (let ((item (assoc '(tex-mode context-mode texinfo-mode bibtex-mode) eglot-server-programs)))
              ;; (setf (car item) '(tex-mode context-mode texinfo-mode bibtex-mode))
              (setf (cdr item) '("texlab")))

            (add-hook 'tex-mode-hook #'eglot-ensure)
            (add-hook 'latex-mode-hook #'eglot-ensure)
            (add-hook 'LaTeX-mode-hook #'eglot-ensure)

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 19:</span>
              packages/auctex/eglot.ecf
            </div>


#### <span class="section-num">3.6.4</span> Lsp-mode {#lsp-mode}

<!--list-separator-->

1.  Собственно lsp-mode

    -   Подключим `lsp-mode`:
        ```emacs-lisp
        (desire 'lsp-mode)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 20:</span>
          rc.packages.el
        </div>
    -   Первоначальная конфигурация:
        ```emacs-lisp
        ;;; Language Server Protocol support for Emacs  -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;; https://emacs-lsp.github.io/
        ;; https://github.com/emacs-lsp/lsp-mode

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 21:</span>
          packages/lsp-mode/loaddefs.ecf
        </div>
    -   Конфигурация:
        ```emacs-lisp
        ;;; Language Server Protocol support for Emacs  -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;; https://emacs-lsp.github.io/
        ;; https://github.com/emacs-lsp/lsp-mode

        (require 'lsp-mode)

        ;;; https://emacs-lsp.github.io/lsp-ui/
        (desire 'lsp-ui)

        ;;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
        (setq lsp-keymap-prefix "C-l")

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 22:</span>
          packages/lsp-mode/desire.ecf
        </div>

<!--list-separator-->

2.  Дополнительные пакеты

    <!--list-separator-->

    1.  LaTeX (texlab)

        -   Загрузим поддержку LSP для LaTeX:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Emacs lsp-mode client for LaTeX, on texlab
            ;; https://github.com/ROCKTAKEY/lsp-latex

            ;;; Code:

            (require 'lsp-mode)
            (desire 'lsp-latex :precondition-system-executable "texlab")

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 23:</span>
              packages/auctex/lsp-mode.ecf
            </div>
        -   Загрузка lsp-latex:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Emacs lsp-mode client for LaTeX, on texlab
            ;; https://github.com/ROCKTAKEY/lsp-latex

            ;;; Code:

            (require 'lsp-latex)

            ;;;; "texlab" executable must be located at a directory contained in `exec-path'.
            ;;;; If you want to put "texlab" somewhere else, you can specify the path to "texlab" as follows:
            ;; (setq lsp-latex-texlab-executable "/path/to/texlab")

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 24:</span>
              packages/lsp-latex/loaddefs.ecf
            </div>
        -   Настройка lsp-latex:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Emacs lsp-mode client for LaTeX, on texlab
            ;;; https://github.com/ROCKTAKEY/lsp-latex

            ;;; Code:

            (add-hook 'tex-mode-hook #'lsp)
            (add-hook 'latex-mode-hook #'lsp)
            (add-hook 'LaTeX-mode-hook #'lsp)
            (add-hook 'LaTeX-mode-hook #'lsp)

            ;;;; For YaTeX
            (with-eval-after-load "yatex"
              (add-hook 'yatex-mode-hook #'lsp))

            ;;;; For bibtex
            (with-eval-after-load "bibtex"
              (add-hook 'bibtex-mode-hook #'lsp))

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 25:</span>
              packages/lsp-latex/desire.ecf
            </div>

    <!--list-separator-->

    2.  lsp-treemacs

        -   Подключение интеграции treemacs и lsp-mode:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; lsp-mode ❤️ treemacs
            ;;; https://github.com/emacs-lsp/lsp-treemacs

            (require 'lsp-mode)

            (desire 'lsp-treemacs)
            (require 'lsp-treemacs)

            ;;; Enable bidirectional synchronization of lsp workspace folders and treemacs projects
            (lsp-treemacs-sync-mode 1)

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 26:</span>
              packages/treemacs/lsp-mode.ecf
            </div>

    <!--list-separator-->

    3.  which-key

        -   Подключение интеграции treemacs и lsp-mode:
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; lsp which-key integration
            ;; https://emacs-lsp.github.io/lsp-mode/page/keybindings/

            ;;; Code:

            (with-eval-after-load 'lsp-mode
              (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 27:</span>
              packages/which-key/lsp-mode.ecf
            </div>


### <span class="section-num">3.7</span> Сессии {#сессии}

```emacs-lisp
;;{{{ Session Management

(desire 'savehist)

;;}}}
```


### <span class="section-num">3.8</span> Утилиты {#утилиты}

```emacs-lisp
(desire 'uniquify)

(desire-conf 'keys)
(desire-conf 'dialog)
(desire-conf 'mouse)
```


#### <span class="section-num">3.8.1</span> xclip {#xclip}

-   [Emacs. xclip]({{< relref "2025-03-12--emacs-xclip" >}})
-   Подключение:
    ```emacs-lisp
    (desire 'xclip)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 28:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Copy&paste GUI clipboard from text terminal
    ;; https://elpa.gnu.org/packages/xclip.html

    ;;; Code:

    (require 'xclip)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 29:</span>
      packages/xclip.ecf
    </div>
-   Какие-то шаманства:
    ```emacs-lisp
    ;; (when (getenv "WAYLAND_DISPLAY")
    ;;   ;; Without this, copy and pasting from other wayland apps into
    ;;   ;; emacs-pgtk doesn't work.
    ;;   ;; https://www.emacswiki.org/emacs/CopyAndPaste#h5o-4
    ;;   (setq wl-copy-process nil)
    ;;   (defun wl-copy (text)
    ;;     (setq wl-copy-process (make-process :name "wl-copy"
    ;;                                         :buffer nil
    ;;                                    :command '("wl-copy" "-f" "-n")
    ;;                                    :connection-type 'pipe
    ;;                                    :noquery t))
    ;;     (process-send-string wl-copy-process text)
    ;;     (process-send-eof wl-copy-process))

    ;;   (defun wl-paste ()
    ;;     (if (and wl-copy-process (process-live-p wl-copy-process))
    ;;         nil ; should return nil if we're the current paste owner
    ;;       (shell-command-to-string "wl-paste -n | tr -d \r")))
    ;;   (setq interprogram-cut-function 'wl-copy)
    ;;   (setq interprogram-paste-function 'wl-paste))
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 30:</span>
      packages/xclip.ecf
    </div>
-   Явное включение для оконного режима (<https://github.com/doomemacs/doomemacs/issues/5219>):
    ```emacs-lisp
    (add-hook 'window-setup-hook #'xclip-mode)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 31:</span>
      packages/xclip.ecf
    </div>
-   Необходима строчка `'text/plain\;charset=utf-8` в `x-select-request-type` (<https://github.com/doomemacs/doomemacs/issues/5219>):
    ```emacs-lisp
    (setq x-select-request-type nil)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 32:</span>
      packages/xclip.ecf
    </div>


#### <span class="section-num">3.8.2</span> which-key {#which-key}

-   Подключение:
    ```emacs-lisp
    (desire 'which-key)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 33:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Emacs package that displays available keybindings in popup
    ;;; https://github.com/justbur/emacs-which-key

    (require 'which-key)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 34:</span>
      packages/which-key/loaddefs.ecf
    </div>
-   Конфигурация:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Emacs package that displays available keybindings in popup
    ;;; https://github.com/justbur/emacs-which-key

    ;;; Key-Based replacement
    (which-key-add-key-based-replacements "C-x C-f" "find files")
    (which-key-add-major-mode-key-based-replacements
     'org-mode
     "C-c C-c" "Org C-c C-c"
     "C-c C-a" "Org Attach")

    ;;; Key and Description replacement
    (add-to-list 'which-key-replacement-alist '(("TAB" . nil) . ("↹" . nil)))
    (add-to-list 'which-key-replacement-alist '(("RET" . nil) . ("⏎" . nil)))
    (add-to-list 'which-key-replacement-alist '(("DEL" . nil) . ("⇤" . nil)))
    (add-to-list 'which-key-replacement-alist '(("SPC" . nil) . ("␣" . nil)))

    ;; Set the special keys. These are automatically truncated to one character and
    ;; have which-key-special-key-face applied. Disabled by default. An example
    ;; setting is
    ;; (setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))
    (setq which-key-special-keys nil)


    ;;; Sorting Options
    ;;;; Default
    (setq which-key-sort-order 'which-key-key-order)
    ;;;; Same as default, except single characters are sorted alphabetically
    ;; (setq which-key-sort-order 'which-key-key-order-alpha)
    ;;;; Same as default, except all prefix keys are grouped together at the end
    ;; (setq which-key-sort-order 'which-key-prefix-then-key-order)
    ;;;; Same as default, except all keys from local maps shown first
    ;; (setq which-key-sort-order 'which-key-local-then-key-order)
    ;;;; Sort based on the key description ignoring case
    ;; (setq which-key-sort-order 'which-key-description-order)

    ;;; Popup Type Options
    ;;; minibuffer | side-window | frame | custom
    (setq which-key-popup-type 'minibuffer)

    ;;; Set the time delay (in seconds) for the which-key popup to appear
    (setq which-key-idle-delay 1.0)

    ;;; Set the maximum length (in characters) for key descriptions (commands or prefixes)
    (setq which-key-max-description-length 27)

    ;;; Use additional padding between columns of keys
    (setq which-key-add-column-padding 0)

    ;;; The maximum number of columns to display in the which-key buffer
    (setq which-key-max-display-columns nil)

    ;;; Set the separator used between keys and descriptions
    (setq which-key-separator " → " )
    (setq which-key-unicode-correction 3)

    ;;; Set the prefix string that will be inserted in front of prefix commands
    (setq which-key-prefix-prefix "+" )

    ;;; Show the key prefix on the left, top, or bottom (nil means hide the prefix)
    (setq which-key-show-prefix 'left)

    ;; Set to t to show the count of keys shown vs. total keys in the mode line
    (setq which-key-show-remaining-keys nil)



    (which-key-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 35:</span>
      packages/which-key/desire.ecf
    </div>


#### <span class="section-num">3.8.3</span> Разное {#разное}

```emacs-lisp
;; (desire 'keycast)

;; ----------------------------------------------------------------------

(desire 'pcache)
(desire 'persistent-soft)

(desire 'alert)

(desire 'rg :precondition-system-executable "rg")
```

-   В файле используется фолдинг по тройной скобке.


### <span class="section-num">3.9</span> Оформление интерфейса {#оформление-интерфейса}

-   Файл `rc.packages.el`:

<!--listend-->

```emacs-lisp
;;;; User interface
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 36:</span>
  rc.packages.el
</div>


#### <span class="section-num">3.9.1</span> Наборы иконок {#наборы-иконок}

```emacs-lisp
;;;;; Icons
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 37:</span>
  rc.packages.el
</div>

<!--list-separator-->

1.  all-the-icons

    ```emacs-lisp
    ;; (desire 'all-the-icons)
    ```

<!--list-separator-->

2.  nerd-icons

    -   Загрузка пакета:
        ```emacs-lisp
        (desire 'nerd-icons)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 38:</span>
          rc.packages.el
        </div>

    <!--list-separator-->

    1.  Интеграция

        <!--list-separator-->

        1.  tab-line

            -   [Emacs. Пакет tab-line]({{< relref "2024-01-08-emacs-tab-line" >}})
            -   Поддержка `nerd-icons` в `tab-line`:
                -   <https://github.com/lucius-martius/tab-line-nerd-icons>
            -   Пакет применяет иконки из `nerd-icons` к вкладкам `tab-line`.
            -   Минорный режим `tab-line-nerd-icons-global-mode` добавляет к функции по умолчанию `tab-line-tab-name-format-default` иконки для форматирования имён вкладок.
                ```emacs-lisp
                ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
                ;;; Emacs package that uses the nerd-icons package to apply appropriate icons to tab-line tabs
                ;;;; https://github.com/lucius-martius/tab-line-nerd-icons

                ;;; Code:

                (desire 'tab-line-nerd-icons)
                (require 'tab-line-nerd-icons)

                ;;;; Enable
                (tab-line-nerd-icons-global-mode)

                ;;;
                ```
                <div class="src-block-caption">
                  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 39:</span>
                  packages/tab-line/nerd-icons.ecf
                </div>

    <!--list-separator-->

    2.  corfu

        -   Nerd-icon для corfu
        -   <https://github.com/LuigiPiucco/nerd-icons-corfu>
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Icons for corfu via nerd-icons
            ;;;; https://github.com/LuigiPiucco/nerd-icons-corfu

            ;;; Code:

            (desire 'nerd-icons-corfu)
            (require 'nerd-icons-corfu)

            (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

            ;;;; Tuning
            (setq nerd-icons-corfu-mapping
                  '((array :style "cod" :icon "symbol_array" :face font-lock-type-face)
                    (boolean :style "cod" :icon "symbol_boolean" :face font-lock-builtin-face)
                 ;; Remember to add an entry for `t', the library uses that as default.
                    (t :style "cod" :icon "code" :face font-lock-warning-face)))

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 40:</span>
              packages/corfu/nerd-icons.ecf
            </div>

    <!--list-separator-->

    3.  marginalia

        -   Nerd-icon для дополнения
        -   <https://github.com/LuigiPiucco/nerd-icons-corfu>
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Use nerd-icons for completion
            ;;;; https://github.com/rainstormstudio/nerd-icons-completion

            ;;; Code:

            (desire 'nerd-icons-completion)
            (require 'nerd-icons-completion)

            (nerd-icons-completion-mode)
            (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup)

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 41:</span>
              packages/marginalia/nerd-icons.ecf
            </div>

    <!--list-separator-->

    4.  dired

        -   Nerd-icon для dired
        -   <https://github.com/rainstormstudio/nerd-icons-dired>
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Use nerd-icons for Dired
            ;;;; https://github.com/rainstormstudio/nerd-icons-dired

            (desire 'nerd-icons-dired)
            (require 'nerd-icons-dired)

            (add-hook 'dired-mode-hook 'nerd-icons-dired-mode)

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 42:</span>
              packages/dired/nerd-icons.ecf
            </div>


#### <span class="section-num">3.9.2</span> Табы {#табы}

```emacs-lisp
;;; Tabs
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 43:</span>
  rc.packages.el
</div>

<!--list-separator-->

1.  centaur-tabs

    -   [Emacs. Пакет Centaur tabs]({{< relref "2024-01-08-emacs-centaur-tabs" >}})
    -   Подключение:
        ```emacs-lisp
        ;; (desire 'centaur-tabs)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 44:</span>
          rc.packages.el
        </div>

<!--list-separator-->

2.  tab-bar

    -   Подключение:
        ```emacs-lisp
        (desire 'tab-bar)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 45:</span>
          rc.packages.el
        </div>

<!--list-separator-->

3.  tab-line

    -   [Emacs. Пакет tab-line]({{< relref "2024-01-08-emacs-tab-line" >}})
    -   Подключение:
        ```emacs-lisp
        (desire 'tab-line)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 46:</span>
          rc.packages.el
        </div>
    -   Загрузка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Emacs Tab Bar

        (require 'tab-line)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 47:</span>
          packages/tab-line/loaddefs.ecf
        </div>
    -   Настройка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Emacs Tab Line

        ;;; Show the tabline in the top of the frame
        (global-tab-line-mode t)

        ;;; Do not show add-new button
        ;; (setq tab-line-new-button-show nil)

        ;;; Do not show close button
        ;; (setq tab-line-close-button-show nil)

        ;;; Change the separator between tabs
        ;; (setq tab-line-separator "")

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 48:</span>
          packages/tab-line/desire.ecf
        </div>


#### <span class="section-num">3.9.3</span> Нумерация строк {#нумерация-строк}

-   [Emacs. Нумерация строк]({{< relref "2024-11-28-emacs-line-numbering" >}})

<!--list-separator-->

1.  display-line-numbers

    -   Подключаем моду:
        ```emacs-lisp
        (desire 'display-line-numbers)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 49:</span>
          rc.packages.el
        </div>
    -   Файл настройки:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Interface for display-line-numbers
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 50:</span>
          packages/display-line-numbers.ecf
        </div>
    -   Глобальная настройка:
        ```emacs-lisp
        ;;; Global
        ;; (global-display-line-numbers-mode 1)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 51:</span>
          packages/display-line-numbers.ecf
        </div>
    -   Глобальная настройка:
        ```emacs-lisp
        ;;; Per mode
        (add-hook 'prog-mode-hook #'display-line-numbers-mode)
        (add-hook 'text-mode-hook #'display-line-numbers-mode)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 52:</span>
          packages/display-line-numbers.ecf
        </div>
    -   Завершение:
        ```emacs-lisp
        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 53:</span>
          packages/display-line-numbers.ecf
        </div>

<!--list-separator-->

2.  nlinum

    -   Подключаем моду:
        ```emacs-lisp
        ;; (desire 'nlinum)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 54:</span>
          rc.packages.el
        </div>
    -   Загрузка пакета:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Show line numbers in the margin
        ;;; https://elpa.gnu.org/packages/nlinum.html

        (require 'nlinum)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 55:</span>
          packages/nlinum.ecf
        </div>
    -   Глобальная настройка:
        ```emacs-lisp
        ;;; Global settings
        ;; (global-nlinum-mode 1)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 56:</span>
          packages/nlinum.ecf
        </div>
    -   Настройка по модам:
        ```emacs-lisp
        ;;; Per mode configuration
        (add-hook 'prog-mode-hook #'nlinum-mode)
        (add-hook 'text-mode-hook #'nlinum-mode)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 57:</span>
          packages/nlinum.ecf
        </div>
    -   Завершение:
        ```emacs-lisp
        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 58:</span>
          packages/nlinum.ecf
        </div>


#### <span class="section-num">3.9.4</span> Завершение {#завершение}

```emacs-lisp
;;;}}}
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 59:</span>
  rc.packages.el
</div>


### <span class="section-num">3.10</span> Автодополнение {#автодополнение}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;; Completion

    ;; (desire 'company)
    (desire 'corfu)
    ```


### <span class="section-num">3.11</span> Автодополнение в минибуфере {#автодополнение-в-минибуфере}


#### <span class="section-num">3.11.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;; Minibuffer completion
    ```


#### <span class="section-num">3.11.2</span> Ido {#ido}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'ido)
    ```


#### <span class="section-num">3.11.3</span> Helm {#helm}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'helm-posframe)
    ;; (desire 'helm)
    ```


#### <span class="section-num">3.11.4</span> Ivy {#ivy}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'ivy)
    ```


#### <span class="section-num">3.11.5</span> Selectrum {#selectrum}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'selectrum)
    ```


#### <span class="section-num">3.11.6</span> Vertico {#vertico}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'vertico)
    ```


### <span class="section-num">3.12</span> Transient {#transient}


#### <span class="section-num">3.12.1</span> transient {#transient}

-   [Emacs. Пакет transient]({{< relref "2024-10-26-emacs-transient" >}})
-   Подключение:
    ```emacs-lisp
    ;;;;; Transient
    (desire 'transient)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 60:</span>
      rc.packages.el
    </div>
-   Дополнительные объявления:
    ```emacs-lisp
    ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Transient command menus
    ;; https://github.com/magit/transient

    ;;; Code:

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 61:</span>
      packages/transient/loaddefs.ecf
    </div>
-   Загрузка:
    ```emacs-lisp
    ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Transient command menus
    ;; https://github.com/magit/transient

    ;;; Code:

    (require 'transient)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 62:</span>
      packages/transient/desire.ecf
    </div>


#### <span class="section-num">3.12.2</span> Casual Suite {#casual-suite}

-   [Emacs. Пакет casual]({{< relref "2024-10-26-emacs-casual" >}})

<!--list-separator-->

1.  Начало

    -   Подключение:
        ```emacs-lisp
        ;;;;; Casual Suite
        (desire 'casual)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 63:</span>
          rc.packages.el
        </div>

<!--list-separator-->

2.  Основная библиотека

    -   Файл `packages/casual/loaddefs.ecf`:
        ```emacs-lisp
        ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; A collection of opinionated keyboard-driven user interfaces for various built-in Emacs modes
        ;;; https://github.com/kickingvegas/casual

        (require 'casual)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 64:</span>
          packages/casual/loaddefs.ecf
        </div>
    -   Файл `packages/casual/desire.ecf`:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; A collection of opinionated keyboard-driven user interfaces for various built-in Emacs modes
        ;; https://github.com/kickingvegas/casual

        ;;; Code:

        (require 'casual-calc)
        (require 'casual-dired)
        (require 'casual-isearch)
        (require 'casual-ibuffer)
        (require 'casual-image)
        (require 'casual-info)
        (require 'casual-re-builder)
        (require 'casual-bookmarks)
        (require 'casual-editkit)
        (require 'casual-make)

        (keymap-set calc-mode-map "C-o" #'casual-calc-tmenu)
        (keymap-set dired-mode-map "C-o" #'casual-dired-tmenu)
        (keymap-set isearch-mode-map "C-o" #'casual-isearch-tmenu)
        (keymap-set ibuffer-mode-map "C-o" #'casual-ibuffer-tmenu)
        (keymap-set ibuffer-mode-map "F" #'casual-ibuffer-filter-tmenu)
        (keymap-set ibuffer-mode-map "s" #'casual-ibuffer-sortby-tmenu)
        (keymap-set image-mode-map "C-o" #'casual-image-tmenu)
        (keymap-set Info-mode-map "C-o" #'casual-info-tmenu)
        (keymap-set reb-mode-map "C-o" #'casual-re-builder-tmenu)
        (keymap-set reb-lisp-mode-map "C-o" #'casual-re-builder-tmenu)
        (keymap-set bookmark-bmenu-mode-map "C-o" #'casual-bookmarks-tmenu)
        (keymap-global-set "C-o" #'casual-editkit-main-tmenu)
        (keymap-set makefile-mode-map "M-m" #'casual-make-tmenu)

        ;;;; Use Unicode symbols whenever appropriate for labels
        (setq casual-lib-use-unicode t)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 65:</span>
          packages/casual/desire.ecf
        </div>
    -   Файл сделан под все элементы пакета.
    -   Необходимо будет разделить всё это по разным пакетам.

<!--list-separator-->

3.  Поддержка Avy

    -   Файл `packages/avy/casual.ecf`:
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 66:</span>
          packages/avy/casual.ecf
        </div>

<!--list-separator-->

4.  Поддержка Symbol Overlay

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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 67:</span>
          packages/casual/symbol-overlay.ecf
        </div>

<!--list-separator-->

5.  Поддержка Org-agenda

    -   Файл `packages/org/casual.ecf`:
        ```emacs-lisp
        ;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; A collection of opinionated keyboard-driven user interfaces for various built-in Emacs modes
        ;; https://github.com/kickingvegas/casual

        ;;; Code:

        (require 'casual-agenda)

        ;;;; Load menu
        (keymap-set org-agenda-mode-map "C-o" #'casual-agenda-tmenu)

        ;;;; Configure Org Agenda to be consistent with bindings used by Casual Agenda
        (keymap-set org-agenda-mode-map "M-j" #'org-agenda-clock-goto)
        (keymap-set org-agenda-mode-map "J" #'bookmark-jump)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 68:</span>
          packages/org/casual.ecf
        </div>


### <span class="section-num">3.13</span> Навигация {#навигация}

-   Заголовок:
    ```emacs-lisp
    ;;;; Navigation
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 69:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.13.1</span> Avy {#avy}

-   Подключение:
    ```emacs-lisp
    (desire 'avy)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 70:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Jump to things in Emacs tree-style
    ;; https://github.com/abo-abo/avy

    ;;; Code:

    (require 'avy)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 71:</span>
      packages/avy/loaddefs.ecf
    </div>
-   Настройка клавиатуры:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Jump to things in Emacs tree-style
    ;; https://github.com/abo-abo/avy

    ;;; Code:


    ;;;; Input one char, jump to it with a tree
    (global-set-key (kbd "C-:") 'avy-goto-char)

    ;;;; Input two consecutive chars, jump to the first one with a tree
    (global-set-key (kbd "C-'") 'avy-goto-char-2)

    ;;;; Input zero chars, jump to a line start with a tree
    (global-set-key (kbd "M-g f") 'avy-goto-line)

    ;;;; Input one char at word start, jump to a word start with a tree
    (global-set-key (kbd "M-g w") 'avy-goto-word-1)

    ;;;; Input zero chars, jump to a word start with a tree
    (global-set-key (kbd "M-g e") 'avy-goto-word-0)

    ;;;; You add this to your config to bind some stuff
    (avy-setup-default)
    (global-set-key (kbd "C-c C-j") 'avy-resume)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 72:</span>
      packages/avy/desire.ecd/keybinding.ecf
    </div>


### <span class="section-num">3.14</span> Навигация по окнам {#навигация-по-окнам}

-   [Emacs. Окна]({{< relref "2024-10-15-emacs-window" >}})


#### <span class="section-num">3.14.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Window navigation {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 73:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.14.2</span> Windmove {#windmove}

-   [Emacs. Окна. Windmove]({{< relref "2024-10-20-emacs-window-windmove" >}})
-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'windmove)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 74:</span>
      rc.packages.el
    </div>
-   Настройка пакета:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Directional window-selection routinesdirectional window-selection routines
    ;;; https://www.emacswiki.org/emacs/WindMove
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 75:</span>
      packages/windmove.ecf
    </div>

-   По умолчанию используется комбинация `Shift` + стрелки. Но это конфликтует с _org-mode_:
    ```emacs-lisp
    ;;; Shifted arrow keys
    ;; (windmove-default-keybindings)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 76:</span>
      packages/windmove.ecf
    </div>
-   Будем использовать  `Ctrl` + стрелки:
    ```emacs-lisp
    ;;; Ctrl + arrow keys
    (windmove-default-keybindings 'ctrl)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 77:</span>
      packages/windmove.ecf
    </div>

-   Что-то делает:
    ```emacs-lisp
    ;;; Wrap around at edges
    (setq windmove-wrap-around t)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 78:</span>
      packages/windmove.ecf
    </div>

-   Завершим файл:
    ```emacs-lisp
    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 79:</span>
      packages/windmove.ecf
    </div>


#### <span class="section-num">3.14.3</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 80:</span>
      rc.packages.el
    </div>


### <span class="section-num">3.15</span> Сворачивание {#сворачивание}


#### <span class="section-num">3.15.1</span> origami {#origami}

-   [Emacs. Сворачивание (folding)]({{< relref "2025-01-28--emacs-folding" >}})
-   Подключение:
    ```emacs-lisp
    ;; (desire 'origami)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 81:</span>
      rc.packages.el
    </div>
-   Подключение:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; A folding minor mode for Emacs
    ;;; https://github.com/gregsexton/origami.el

    (require 'origami)

    (define-prefix-command 'origami-mode-map)
    (define-key ctl-x-map (kbd "z") 'origami-mode-map)
    (define-key origami-mode-map "o" 'origami-open-node)
    (define-key origami-mode-map "O" 'origami-open-node-recursively)
    (define-key origami-mode-map "c" 'origami-close-node)
    (define-key origami-mode-map "C" 'origami-close-node-recursively)
    (define-key origami-mode-map "a" 'origami-toggle-node)
    (define-key origami-mode-map "A" 'origami-recursively-toggle-node)
    (define-key origami-mode-map "R" 'origami-open-all-nodes)
    (define-key origami-mode-map "M" 'origami-close-all-nodes)
    (define-key origami-mode-map "v" 'origami-show-only-node)
    (define-key origami-mode-map "k" 'origami-previous-fold)
    (define-key origami-mode-map "j" 'origami-forward-fold)
    (define-key origami-mode-map "x" 'origami-reset)

    (global-origami-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 82:</span>
      packages/origami.ecf
    </div>


#### <span class="section-num">3.15.2</span> outli {#outli}

-   [Emacs. Пакет outli]({{< relref "2025-01-28--emacs-outli" >}})
-   Подключение:
    ```emacs-lisp
    (desire 'outli :recipe '(:fetcher github :repo "jdtsmith/outli" :branch "main"))
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 83:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Simple comment-based outline folding for Emacs
    ;;; https://github.com/jdtsmith/outli

    (require 'outli)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 84:</span>
      packages/outli/loaddefs.ecf
    </div>
-   Настройка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Simple comment-based outline folding for Emacs
    ;;; https://github.com/jdtsmith/outli

    (general-define-key
     :keymaps 'outli-mode-map
     ;; convenience key to get back to containing heading
     "C-c C-p"  '(lambda () (interactive) (outline-back-to-heading)))

    (add-hook 'prog-mode-hook #'outli-mode)
    (add-hook 'text-mode-hook #'outli-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 85:</span>
      packages/outli/desire.ecf
    </div>


#### <span class="section-num">3.15.3</span> hideshow {#hideshow}

-   Подключение:
    ```emacs-lisp
    (desire 'hideshow)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 86:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Hideshow minor mode
    ;;;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Hideshow.html
    ;;;; https://www.emacswiki.org/emacs/HideShow

    ;;; Code:

    (require 'hideshow)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 87:</span>
      packages/hideshow/loaddefs.ecf
    </div>
-   Настройка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Hideshow minor mode
    ;;;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Hideshow.html
    ;;;; https://www.emacswiki.org/emacs/HideShow

    ;;; Code:

    (add-hook 'prog-mode-hook #'hs-minor-mode)
    (add-hook 'c-mode-common-hook #'hs-minor-mode)
    (add-hook 'emacs-lisp-mode-hook #'hs-minor-mode)
    (add-hook 'java-mode-hook #'hs-minor-mode)
    (add-hook 'lisp-mode-hook #'hs-minor-mode)
    (add-hook 'perl-mode-hook #'hs-minor-mode)
    (add-hook 'sh-mode-hook #'hs-minor-mode)

    ;;;; Hide the comments too when you do a 'hs-hide-all'
    (setq hs-hide-comments nil)
    ;;;; Set whether isearch opens folded comments, code, or both code, comments, t (both), or nil (neither)
    (setq hs-isearch-open 'code)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 88:</span>
      packages/hideshow/desire.ecf
    </div>


#### <span class="section-num">3.15.4</span> bicycle {#bicycle}

-   Переключение режима структуры.
-   <https://github.com/tarsius/bicycle>
-   Подключение:
    ```emacs-lisp
    (desire 'bicycle)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 89:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Cycle outline and code visibility
    ;;;; https://github.com/tarsius/bicycle

    ;;; Code:

    (require 'bicycle)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 90:</span>
      packages/bicycle/loaddefs.ecf
    </div>
-   Настройка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Cycle outline and code visibility
    ;;;; https://github.com/tarsius/bicycle

    ;;; Code:

    (require 'outline)
    (require 'bicycle)

    (general-define-key
     :keymaps 'outline-minor-mode-map
     [C-tab] 'bicycle-cycle
     [S-tab] 'bicycle-cycle-global)
     ;; (define-key outline-minor-mode-map (kbd "<backtab>") #'bicycle-cycle-global)

    (add-hook 'prog-mode-hook #'outline-minor-mode)
    (add-hook 'markdown-mode-hook #'outline-minor-mode)
    (add-hook 'TeX-mode-hook #'outline-minor-mode)
    (add-hook 'LaTeX-mode-hook #'outline-minor-mode)
    (add-hook 'rst-mode-hook #'outline-minor-mode)
    (add-hook 'prog-mode-hook #'outline-minor-mode)
    (add-hook 'prog-mode-hook #'hs-minor-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 91:</span>
      packages/bicycle/desire.ecf
    </div>


### <span class="section-num">3.16</span> Разное {#разное}

-   Файл `rc.packages.el`:

<!--listend-->

```emacs-lisp
;;

(desire 'tree-sitter)

(desire 'hydra)

(desire-conf 'show-paren)
;; (desire-conf 'folding)
;; (desire-conf 'outline)

;;

(desire 'imenu)

(desire 'ace-window)


;; (desire-conf 'toolbar)

;; Parentesis
(desire 'smartparens)
```


### <span class="section-num">3.17</span> Проверка правописания {#проверка-правописания}

```emacs-lisp
;;; Spell {{{

;; (desire-conf 'spell)
(desire 'ispell)
;; (desire 'flyspell)
;;(desire-conf 'speck)
;;(desire-conf 'wcheck)
```


#### <span class="section-num">3.17.1</span> jinx {#jinx}

-   <https://github.com/minad/jinx>
-   Подключение:
    ```emacs-lisp
    (desire 'jinx)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 92:</span>
      rc.packages.el
    </div>
-   Начальная загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Enchanted Spell Checker
    ;;; https://github.com/minad/jinx

    (require 'jinx)

    ;;; Alternative 1: Enable Jinx globally
    ;; (add-hook 'emacs-startup-hook #'global-jinx-mode)

    ;;; Alternative 2: Enable Jinx per mode
    (dolist (hook '(text-mode-hook prog-mode-hook conf-mode-hook))
      (add-hook hook #'jinx-mode))

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 93:</span>
      packages/jinx/loaddefs.ecf
    </div>
-   Настройки:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Enchanted Spell Checker
    ;;; https://github.com/minad/jinx


    ;;; M-$ triggers correction for the misspelled word before point.
    ;;; C-u M-$ triggers correction for the entire buffer.
    ;;; C-u C-u M-$ forces correction of the word at point, even if it is not misspelled.
    (keymap-global-set "M-$" #'jinx-correct)
    (keymap-global-set "C-M-$" #'jinx-languages)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 94:</span>
      packages/jinx/desire.ecf
    </div>
-   Поддержка vertico:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Enchanted Spell Checker
    ;;; https://github.com/minad/jinx

    (require 'vertico-multiform)
    (add-to-list 'vertico-multiform-categories
                 '(jinx grid (vertico-grid-annotate . 20)))

    (vertico-multiform-mode 1)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 95:</span>
      packages/jinx/vertico.ecf
    </div>


#### <span class="section-num">3.17.2</span> Langtool {#langtool}

```emacs-lisp
;; (desire 'langtool)
;; (desire 'flycheck-languagetool)
;; (desire 'lsp-ltex :recipe '(:fetcher github :repo "emacs-languagetool/lsp-ltex" :branch "master" :files ("*.el")))
;; (desire 'eglot-ltex :recipe '(:fetcher github :repo "emacs-languagetool/eglot-ltex" :branch "master" :files ("*.el")))
```


#### <span class="section-num">3.17.3</span> Завершение {#завершение}

```emacs-lisp
;;;}}}
```


### <span class="section-num">3.18</span> Адресная книга {#адресная-книга}

```emacs-lisp
;;; Adress book {{{

(desired 'vcard)
(desire 'khardel :precondition-system-executable "khard")
(desire 'khalel :precondition-system-executable "khal")
;; (desire 'org-vcard)
;; (desire 'vdirel)
;; (desire 'bbdb)

;;;}}}
```


### <span class="section-num">3.19</span> Библиография {#библиография}


#### <span class="section-num">3.19.1</span> Начало {#начало}

```emacs-lisp
;;; Bibliography {{{
```


#### <span class="section-num">3.19.2</span> Доступ к библиографическим базам данных {#доступ-к-библиографическим-базам-данных}

-   Пакет _biblio_.
-   Подключение:
    ```emacs-lisp
    (desire 'biblio)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 96:</span>
      rc.packages.el
    </div>
-   Настройка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Browse and import bibliographic references from CrossRef, DBLP, HAL, arXiv, Dissemin, and doi.org from Emacs
    ;; https://github.com/cpitclaudel/biblio.el

    (require 'biblio)

    ;;; To get better response times from CrossRef
    ;;; https://github.com/CrossRef/rest-api-doc#etiquette
    (setq biblio-crossref-user-email-address user-mail-address)

    ;;; Which header to use for BibTeX entries generated from arXiv metadata
    (setq biblio-arxiv-bibtex-header "misc")

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 97:</span>
      packages/biblio.ecf
    </div>


#### <span class="section-num">3.19.3</span> Настройки bibtex {#настройки-bibtex}

-   Подключение:
    ```emacs-lisp
    (desire 'bibtex)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 98:</span>
      rc.packages.el
    </div>

<!--list-separator-->

1.  Расположение файлов

    -   Персональные настройки расположения файлов.
    -   [Организация рабочего каталога]({{< relref "2021-08-01-organization-working-directory" >}})
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 99:</span>
          packages/bibtex/personal.ecf
        </div>
    -   Основной файл библиографии:
        ```emacs-lisp
        ;;; Where bibliographies can be found
        (setq personal-bibliography '("~/work/bib/bib/main.bib"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 100:</span>
          packages/bibtex/personal.ecf
        </div>
    -   Файлы книг и статей:
        ```emacs-lisp
        ;;; Where PDFs can be found
        ;; (setq bibtex-completion-library-path (directory-files-recursively "~/data/bib/pdf" "\\`[^.]*\\'" 't))
        (setq personal-library-path '("~/work/bib/data/pdf"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 101:</span>
          packages/bibtex/personal.ecf
        </div>
    -   Расположение литературных заметок:
        ```emacs-lisp
        ;;; Notes
        ;;; Store all notes in one file
        ;; (setq personal-notes-path "/path/to/notes.org")
        ;;; Store notes in multiple files, one file per publication
        ;; (setq personal-notes-path (expand-file-name "~/work/org/notes/literature"))
        (setq personal-notes-path '())
        (add-to-list 'personal-notes-path (expand-file-name "~/work/org/notes/literature"))

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 102:</span>
          packages/bibtex/personal.ecf
        </div>


#### <span class="section-num">3.19.4</span> Завершение {#завершение}

```emacs-lisp
;;;}}}
```


### <span class="section-num">3.20</span> Сниппеты {#сниппеты}

```emacs-lisp

;;(desire-conf 'yasnippet)
```


### <span class="section-num">3.21</span> Текстовые режимы {#текстовые-режимы}

-   Декларация секции:
    ```emacs-lisp
    ;;;; Work with text
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 103:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.21.1</span> Таблицы {#таблицы}

-   Декларация секции:
    ```emacs-lisp
    ;;;;; Tables
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 104:</span>
      rc.packages.el
    </div>

<!--list-separator-->

1.  lte.el

    -   Large Table Edition in Org and Markdown buffers
    -   <https://github.com/fredericgiquel/lte.el>
    -   Подключение:
        ```emacs-lisp
        (desire 'lte)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 105:</span>
          rc.packages.el
        </div>
    -   Настройка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Large Table Edition in Org and Markdown buffers for Emacs
        ;;; https://github.com/fredericgiquel/lte.el

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 106:</span>
          packages/lte.ecf
        </div>
    -   Поддержка markdown-mode:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Large Table Edition in Org and Markdown buffers for Emacs
        ;;; https://github.com/fredericgiquel/lte.el

        (require 'lte)
        (add-hook 'markdown-mode-hook #'lte-truncate-table-mode)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 107:</span>
          packages/markdown-mode/lte.ecf
        </div>
    -   Поддержка org-mode:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Large Table Edition in Org and Markdown buffers for Emacs
        ;;; https://github.com/fredericgiquel/lte.el

        (require 'lte)
        (add-hook 'org-mode-hook #'lte-truncate-table-mode)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 108:</span>
          packages/org/lte.ecf
        </div>


#### <span class="section-num">3.21.2</span> Отображение текста {#отображение-текста}

-   Декларация секции:
    ```emacs-lisp
    ;;;;; Text view
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 109:</span>
      rc.packages.el
    </div>

<!--listend-->

```emacs-lisp
(desire 'texfrag)

;; (desire 'adaptive-wrap)
(desired 'visual-line-mode)

;; (desired 'prettify-symbols-mode)
;; (desire 'pretty-mode)
;; (desire 'prettify-math)
;; (desire 'math-preview)
```


#### <span class="section-num">3.21.3</span> move-text {#move-text}

-   [Emacs. Работа с текстом]({{< relref "2025-01-27--emacs-working-text" >}})
-   Позволяет перемещать строки текста.
-   Подключение:
    ```emacs-lisp
    (desire 'move-text)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 110:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Move current line or region up or down
    ;;; https://github.com/emacsfodder/move-text

    (require 'move-text)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 111:</span>
      packages/move-text/loaddefs.ecf
    </div>
-   Настройка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Move current line or region up or down
    ;;; https://github.com/emacsfodder/move-text

    ;;; Use the default bindings
    (move-text-default-bindings)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 112:</span>
      packages/move-text/desire.ecf
    </div>
-   Перестройка отступов:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Move current line or region up or down
    ;;; https://github.com/emacsfodder/move-text

    ;;; Indent after moving

    (defun indent-region-advice (&rest ignored)
      (let ((deactivate deactivate-mark))
        (if (region-active-p)
            (indent-region (region-beginning) (region-end))
          (indent-region (line-beginning-position) (line-end-position)))
        (setq deactivate-mark deactivate)))

    (advice-add 'move-text-up :after 'indent-region-advice)
    (advice-add 'move-text-down :after 'indent-region-advice)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 113:</span>
      packages/move-text/desire.ecd/reindent.ecf
    </div>


#### <span class="section-num">3.21.4</span> delsel {#delsel}

-   В дереве emacs.
-   При вставке текста в выделенную область вставленный текст заменяет исходный.
-   Подключение:
    ```emacs-lisp
    (desire 'delsel)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 114:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Delete the selected text upon text insertion

    ;;; Code:

    (require 'delsel)
    (add-hook 'after-init-hook 'delete-selection-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 115:</span>
      packages/delsel.ecf
    </div>


#### <span class="section-num">3.21.5</span> markdown {#markdown}

```emacs-lisp
(desire 'pandoc-mode)

(desire' mermaid-mode :precondition-system-executable "mmdc")

(desire-conf 'text)
(desire-conf 'markdown-mode nil "markdown-mode" t)

(desire 'plantuml-mode)

(desire 'pdf-tools)
(desire 'nov)
(desire 'fb2-reader)

;; (desire 'valign)
```


#### <span class="section-num">3.21.6</span> quarto {#quarto}

-   Поддержка quarto.
-   Подключение:
    ```emacs-lisp
    ;;;; Quarto mode
    (desire 'quarto-mode)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 116:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; An emacs mode for quarto
    ;; https://github.com/quarto-dev/quarto-emacs

    ;;; Code:

    (desire' polymode)
    (desire 'poly-markdown)

    (require 'quarto-mode)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 117:</span>
      packages/quarto-mode.ecf
    </div>


#### <span class="section-num">3.21.7</span> calibredb {#calibredb}

-   Клиент для Calibre (см. [Каталогизатор книг Calibre]({{< relref "2025-02-04--calibre-book-cataloger" >}})).
-   <https://github.com/chenyanming/calibredb.el>
-   Подключение:
    ```emacs-lisp
    (desire 'calibredb)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 118:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;; Emacs calibre client - A Document Management Solution in Emacs
    ;; https://github.com/chenyanming/calibredb.el

    ;;; Code:

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 119:</span>
      packages/calibredb/loaddefs.ecf
    </div>
-   Конфигурация:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;; Emacs calibre client - A Document Management Solution in Emacs
    ;; https://github.com/chenyanming/calibredb.el

    ;;; Code:

    (require 'calibredb)

    ;;;; Size indicator
    (setq calibredb-size-show t)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 120:</span>
      packages/calibredb/desire.ecf
    </div>
-   Персональные настройки:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;; Emacs calibre client - A Document Management Solution in Emacs
    ;; https://github.com/chenyanming/calibredb.el

    ;;; Code:

    (setq calibredb-root-dir "/data/book/calibre")
    ;;;; for folder driver metadata: it should be .metadata.calibre
    (setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
    (setq calibredb-library-alist '(("/data/book/calibre" (name . "Calibre")) ;; with name
                                    ;; ("/Users/damonchan/Documents/Books Library") ;; no name
                                    ;; ("/Users/damonchan/Documents/HELLO")
                                    ;; ("/Users/damonchan/Documents/Books")
                                    ;; ("/Users/damonchan/Documents/World"))
          ))

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 121:</span>
      packages/calibredb/personal.ecf
    </div>
-   Поддержка `nerd-icons`:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;; Emacs calibre client - A Document Management Solution in Emacs
    ;; https://github.com/chenyanming/calibredb.el

    ;;; Code:

    (setq calibredb-format-nerd-icons t)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 122:</span>
      packages/calibredb/nerd-icons.ecf
    </div>
-   Поддержка `all-the-icons`:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;; Emacs calibre client - A Document Management Solution in Emacs
    ;; https://github.com/chenyanming/calibredb.el

    ;;; Code:

    (setq calibredb-format-all-the-icons t)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 123:</span>
      packages/calibredb/all-the-icons.ecf
    </div>


### <span class="section-num">3.22</span> Управление временем {#управление-временем}

-   Разделитель:
    ```emacs-lisp
    ;;;; Time management
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 124:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.22.1</span> pomm {#pomm}

-   [Emacs. Метод pomodoro]({{< relref "2025-01-16--emacs-pomodoro-method" >}})
-   Подключение:
    ```emacs-lisp
    (desire 'pomm)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 125:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Implementation of Pomodoro and Third Time techniques for Emacs
    ;;;; https://github.com/SqrtMinusOne/pomm.el

    ;;; Code:

    (require 'pomm)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 126:</span>
      packages/pomm/loaddefs.ecf
    </div>
-   Настройка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Implementation of Pomodoro and Third Time techniques for Emacs
    ;;;; https://github.com/SqrtMinusOne/pomm.el

    ;;; Code:

    ;;;; If you want an actual notification
    (setq alert-default-style 'libnotify)

    ;;;; Display in the modeline
    (pomm-mode-line-mode)

    ;;;; By default sounds are disabled
    (setq pomm-audio-enabled t)

    ;;;; Ticking sound
    ;; (setq pomm-audio-tick-enabled t)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 127:</span>
      packages/pomm/desire.ecf
    </div>
-   Интерфейс к polybar (разным реализациям):
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Implementation of Pomodoro and Third Time techniques for Emacs
    ;;;; https://github.com/SqrtMinusOne/pomm.el

    ;;; Code:

    (add-hook 'pomm-on-tick-hook 'pomm-update-mode-line-string)
    (add-hook 'pomm-on-status-changed-hook 'pomm-update-mode-line-string)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 128:</span>
      packages/pomm/desire.ecd/polybar.ecf
    </div>
-   Сохранение истории:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Log history in CSV format
    ;;;; https://github.com/SqrtMinusOne/pomm.el


    ;;; Code:

    ;;;; Save timer history in a CSV format
    (setq pomm-csv-history-file (expand-file-name "pomm.csv" user-emacs-directory))

    ;;;; Customize timestamp (for traditional YYYY-MM-DD HH:mm:ss)
    (setq pomm-csv-history-file-timestamp-format "%F %T")

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 129:</span>
      packages/pomm/desire.ecd/history.ecf
    </div>

<!--list-separator-->

1.  Интеграция

    -   Интеграция с `org-mode`:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Log history in CSV format
        ;;;; https://github.com/SqrtMinusOne/pomm.el

        ;;; Code:

        (require 'pomm)

        (add-hook 'pomm-on-status-changed-hook #'pomm--sync-org-clock)
        (add-hook 'pomm-third-time-on-status-changed-hook #'pomm-third-time--sync-org-clock)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 130:</span>
          packages/org/pomm.ecf
        </div>


#### <span class="section-num">3.22.2</span> org-pomodoro {#org-pomodoro}

```emacs-lisp
(desire 'org-pomodoro)
;; (desire 'hammy)
```


### <span class="section-num">3.23</span> LaTeX {#latex}

```emacs-lisp
;;; LaTeX

(desire 'xenops)

(desire 'cdlatex)

(desire-conf 'xdvi nil "xdvi-search")
(desired 'reftex)
;; (desire-conf 'tex)
(desired 'preview-latex)
```


#### <span class="section-num">3.23.1</span> Auctex {#auctex}

-   Подключение
    ```emacs-lisp
    (desire 'auctex)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 131:</span>
      rc.packages.el
    </div>

<!--list-separator-->

1.  Парсинг файлов TeX

    -   Заголовок:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Automatic Parsing of TeX Files
        ;; http://www.gnu.org/software/auctex/

        ;;; Code:
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 132:</span>
          packages/auctex/desire.ecd/parsing.ecf
        </div>
    -   Автопарсинг:
        ```emacs-lisp
        ;;;; Automatic Parsing of TeX Files
        (setq TeX-parse-self t)                 ; Enable parse on load
        (setq TeX-auto-save t)                  ; Enable parse on save
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 133:</span>
          packages/auctex/desire.ecd/parsing.ecf
        </div>
    -   Убрать символы табуляции:
        ```emacs-lisp
        ;;;; Automatically remove all tabs from a file before saving it
        (setq TeX-auto-untabify t)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 134:</span>
          packages/auctex/desire.ecd/parsing.ecf
        </div>
    -   Финал:
        ```emacs-lisp
        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 135:</span>
          packages/auctex/desire.ecd/parsing.ecf
        </div>


### <span class="section-num">3.24</span> Org-mode {#org-mode}

-   [Org-mode]({{< relref "2021-10-14-org-mode" >}})
-   Конфигурация для `org-mode`:
    ```emacs-lisp
    ;;; Org-mode {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 136:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.24.1</span> Babel {#babel}

-   [Emacs. Org Babel]({{< relref "2022-10-15-emacs-org-babel" >}})
-   Общие настройки babel:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Org-Babel
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 137:</span>
      packages/org/desire.ecd/babel.ecf
    </div>
-   Отключим подтверждение запутывания:
    ```emacs-lisp
    ;;; Org-babel confirm before evaluation
    (setq org-confirm-babel-evaluate nil)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 138:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 139:</span>
          packages/org/desire.ecd/babel.ecf
        </div>

<!--list-separator-->

2.  Поддержка языков

    -   Включим поддержку разных языков программирования:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-

        ;;; Scripts
        (require 'ob-awk)
        (require 'ob-eshell)
        (require 'ob-sed)
        (require 'ob-shell)

        ;;; Diagrams
        (require 'ob-ditaa)
        (require 'ob-dot)
        (require 'ob-plantuml)

        ;;; Programming languages
        (require 'ob-calc)
        (require 'ob-C)
        (require 'ob-clojure)
        (require 'ob-comint)
        (require 'ob-core)
        (require 'ob-css)
        (require 'ob-emacs-lisp)
        (require 'ob-eval)
        (require 'ob-exp)
        (require 'ob-forth)
        (require 'ob-fortran)
        (require 'ob-gnuplot)
        (require 'ob-groovy)
        (require 'ob-haskell)
        (require 'ob-java)
        (require 'ob-js)
        (require 'ob-julia)
        (require 'ob-latex)
        (require 'ob-lilypond)
        (require 'ob-lisp)
        (require 'ob-lob)
        (require 'ob-lua)
        (require 'ob-makefile)
        (require 'ob-matlab)
        (require 'ob-maxima)
        (require 'ob-ocaml)
        (require 'ob-octave)
        (require 'ob-org)
        (require 'ob-perl)
        (require 'ob-processing)
        (require 'ob-python)
        (require 'ob-ref)
        (require 'ob-R)
        (require 'ob-ruby)
        (require 'ob-sass)
        (require 'ob-scheme)
        (require 'ob-screen)
        (require 'ob-sql)
        (require 'ob-sqlite)
        (require 'ob-table)
        (require 'ob-tangle)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 140:</span>
          packages/org/desire.ecd/ob.ecf
        </div>

<!--list-separator-->

3.  Конец

    ```emacs-lisp
    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 141:</span>
      packages/org/desire.ecd/babel.ecf
    </div>


#### <span class="section-num">3.24.2</span> Разное {#разное}

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
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 142:</span>
  rc.packages.el
</div>


#### <span class="section-num">3.24.3</span> Повестка дня {#повестка-дня}

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
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 143:</span>
  rc.packages.el
</div>


#### <span class="section-num">3.24.4</span> org-gtd {#org-gtd}

-   [Emacs. Пакеты. Org-gtd]({{< relref "2023-07-31-emacs-packages-org-gtd" >}})
-   Подключение для загрузки:
    ```emacs-lisp
    ;;; GTD
    (desire 'org-gtd)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 144:</span>
      rc.packages.el
    </div>

<!--list-separator-->

1.  Клавиатурные сочетания


#### <span class="section-num">3.24.5</span> mobileorg {#mobileorg}

```emacs-lisp
(desired 'mobileorg)
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 145:</span>
  rc.packages.el
</div>


#### <span class="section-num">3.24.6</span> org-mode {#org-mode}

```emacs-lisp
(desire 'org)

;;; For messaging
;; (desire 'org-msg)

;;;}}}
```
<div class="src-block-caption">
  <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 146:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 147:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>
    -   Зададим каталог для создаваемых изображений (по умолчанию они создаются в рабочем каталоге):
        ```emacs-lisp
        ;;; LaTeX image directory
        (setq org-preview-latex-image-directory (concat home-cache-path "org-latex/"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 148:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 149:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 150:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 151:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 152:</span>
          packages/org/desire.ecd/preview-latex.ecf
        </div>


### <span class="section-num">3.25</span> Заметочники {#заметочники}

-   [Emacs. Персональная база знаний]({{< relref "2023-11-07-emacs-personal-knowledge-base" >}})
-   Разные заметочники:
    ```emacs-lisp
    ;;; Notes {{{
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 153:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.25.1</span> Org-roam {#org-roam}

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

<!--list-separator-->

1.  Org-daily

    -   Загрузка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Daily-notes

        ;;; Code:

        (require 'org-roam-dailies)

        ;;;; Excluding Nodes and Edges
        (setq org-roam-graph-exclude-matcher '("private" "dailies"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 154:</span>
          packages/org-roam/desire.ecd/dailies.ecf
        </div>
    -   Каталог для записей:
        ```emacs-lisp
        ;;;; Path to daily-notes
        (setq org-roam-dailies-directory "daily/")
        (unless (file-directory-p (concat org-roam-directory "/" org-roam-dailies-directory))
          (make-directory (concat org-roam-directory "/" org-roam-dailies-directory) t))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 155:</span>
          packages/org-roam/desire.ecd/dailies.ecf
        </div>
    -   Шаблон записи:
        ```emacs-lisp
        ;;;; Capture templates for daily-notes in Org-roam
        (setq org-roam-dailies-capture-templates
              '(("d" "default" entry
                 "* %?"
                 :target (file+head "%<%Y-%m-%d>.org"
                                    "#+title: %<%Y-%m-%d>
        :SETUP_LOCAL:
        #+startup: overview hidestars showblocks num inlineimages latexpreview
        #+options: ^:{} num:t tex:t
        :END:

        "))))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 156:</span>
          packages/org-roam/desire.ecd/dailies.ecf
        </div>
    -   Сочетания клавиш:
        ```emacs-lisp
        ;;;; Define key bindings

        ;;;;; Capture a note for today (C-c n d n)
        (define-key org-roam-dailies-map (kbd "n") #'org-roam-dailies-capture-today)

        ;;;;; Capture a note for yesterday (C-c n d Y)
        (define-key org-roam-dailies-map (kbd "Y") #'org-roam-dailies-capture-yesterday)

        ;;;;; Capture a note for tomorrow (C-c n d T)
        (define-key org-roam-dailies-map (kbd "T") #'org-roam-dailies-capture-tomorrow)

        ;;;;; Go to the file for yesterday (C-c n d y)
        (define-key org-roam-dailies-map (kbd "y") #'org-roam-dailies-goto-yesterday)

        ;;;;; Go to the file for tomorrow (C-c n d t)
        (define-key org-roam-dailies-map (kbd "t") #'org-roam-dailies-goto-tomorrow)

        ;;;;; Capture a note for a specific date (C-c n d v)
        (define-key org-roam-dailies-map (kbd "v") #'org-roam-dailies-capture-date)

        ;;;;; Go to the file for a specific date (C-c n d c)
        (define-key org-roam-dailies-map (kbd "c") #'org-roam-dailies-goto-date)

        ;;;;; Go back one existing date file (C-c n d b)
        (define-key org-roam-dailies-map (kbd "b") #'org-roam-dailies-goto-next-note)

        ;;;;; Go forward one existing date file (C-c n d f)
        (define-key org-roam-dailies-map (kbd "f") #'org-roam-dailies-goto-previous-note)

        (fset 'org-roam-dailies-map org-roam-dailies-map)
        (global-set-key (kbd "C-c n d") #'org-roam-dailies-map)

        ;; (global-set-key (kbd "C-c n d") #'org-roam-dailies-capture-today)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 157:</span>
          packages/org-roam/desire.ecd/dailies.ecf
        </div>


#### <span class="section-num">3.25.2</span> Denote {#denote}

```emacs-lisp

(desire 'deft)
;; (desire-conf 'zetteldeft nil "zetteldeft" t)

;; (desire 'denote)

;;}}}
```


### <span class="section-num">3.26</span> Диаграммы {#диаграммы}


#### <span class="section-num">3.26.1</span> Диаграммы Ганта {#диаграммы-ганта}

-   [Emacs. Диаграммы Ганта]({{< relref "2024-12-10-emacs-gantt-charts" >}})

<!--list-separator-->

1.  org-gantt-mode

    -   Добавим пакет:
        ```emacs-lisp
        ;; (desire 'org-gantt-mode :recipe '(:fetcher gitlab :repo "joukeHijlkema/org-gantt-mode" :branch "master"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 158:</span>
          rc.packages.el
        </div>
    -   Загрузка пакета:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Create SVG gantt charts from an org-mode subtree
        ;;; https://gitlab.com/joukeHijlkema/org-gantt-mode

        (autoload 'org-gantt-mode "org-gantt-mode" "Create SVG gantt charts" t)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 159:</span>
          packages/org-gantt-mode.ecf
        </div>

<!--list-separator-->

2.  elgantt

    -   Добавим пакет:
        ```emacs-lisp
        (desire 'elgantt :recipe '(:fetcher github :repo "legalnonsense/elgantt" :branch "master"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 160:</span>
          rc.packages.el
        </div>
    -   Загрузка пакета:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;;  A Gantt Chart (Calendar) for Org Mode
        ;;; https://github.com/legalnonsense/elgantt

        (require 'elgantt)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 161:</span>
          packages/elgantt/loaddefs.ecf
        </div>

<!--list-separator-->

3.  taskjuggler

    -   Загрузка пакета:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;;  Exporting Gantt charts with Taskjuggler

        (require 'ox-taskjuggler)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 162:</span>
          packages/org/desire.ecd/ox-taskjuggler.ecf
        </div>


### <span class="section-num">3.27</span> Разное {#разное}

```emacs-lisp
;; XML, XHTML, HTML {{{

;;(desire-conf 'nxml nil "rng-auto")
                                      ; (desire-conf 'psgml)

;;;}}}
;;;{{{ Palm pilot support

                                      ;(desire-conf 'palm)

;;;}}}
```


### <span class="section-num">3.28</span> Управление сессиями {#управление-сессиями}

```emacs-lisp
;;; Desktop {{{
```


#### <span class="section-num">3.28.1</span> Сохранение состояния {#сохранение-состояния}

```emacs-lisp
;; (desire-conf 'desktop)
(desire-conf 'session nil "session")
(desire-conf 'saveplace nil "saveplace")
```


#### <span class="section-num">3.28.2</span> Организация рабочего пространства {#организация-рабочего-пространства}

<!--list-separator-->

1.  one-tab-per-project

    -   [Emacs. Пакет otpp]({{< relref "2025-02-03--emacs-otpp" >}})
    -   Автоматическое создание вкладки для каждого проекта, обеспечивающее управление рабочим пространством на основе панели вкладок для Emacs.
    -   <https://github.com/abougouffa/one-tab-per-project>
    -   Подключение пакета:
        ```emacs-lisp
        (desire 'otpp)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 163:</span>
          rc.packages.el
        </div>
    -   Предварительные настройки:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Automatically create a tab per project, providing a light tab-bar based workspace management for Emacs
        ;;;; https://github.com/abougouffa/one-tab-per-project

        ;;; Code:

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 164:</span>
          packages/otpp/loaddefs.ecf
        </div>
    -   Загрузка пакета:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Automatically create a tab per project, providing a light tab-bar based workspace management for Emacs
        ;;;; https://github.com/abougouffa/one-tab-per-project

        ;;; Code:

        (require 'otpp)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 165:</span>
          packages/otpp/desire.ecf
        </div>
    -   Задание параметров:
        ```emacs-lisp
        ;;;; If you like to define some aliases for better user experience
        (defalias 'one-tab-per-project-mode 'otpp-mode)
        (defalias 'one-tab-per-project-override-mode 'otpp-override-mode)

        ;;;; Keybindings
        (general-define-key
         :prefix "C-x t"
         "D" 'otpp-detach-buffer-to-tab
         "C" 'otpp-change-tab-root-dir
         "P" 'otpp-prefix)

        ;;;; Enable `otpp-mode` globally
        (otpp-mode 1)

        ;;;; If you want to advice the commands in `otpp-override-commands` to be run in the current's tab (so, current project's) root directory
        (otpp-override-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 166:</span>
          packages/otpp/desire.ecf
        </div>
    -   Подключение к project.el:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Automatically create a tab per project, providing a light tab-bar based workspace management for Emacs
        ;;; https://github.com/abougouffa/one-tab-per-project

        (require 'otpp)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 167:</span>
          packages/project/otpp.ecf
        </div>

<!--list-separator-->

2.  iBuffer

    ```emacs-lisp
    (desire 'ibuffer)
    ;; (desire 'persp-mode)
    ;; (desire 'perspective)
    ;; (desire 'bufler)
    ;; (desire 'tabspaces)

    ;;}}}
    ```


### <span class="section-num">3.29</span> Проекты {#проекты}


#### <span class="section-num">3.29.1</span> Начало {#начало}

```emacs-lisp
;;; Project management
```


#### <span class="section-num">3.29.2</span> projection {#projection}

-   Projectile-подобная библиотека управления проектами для project.el
-   <https://github.com/mohkale/projection>
-   Подключение:
    ```emacs-lisp
    (desire 'projection)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 168:</span>
      rc.packages.el
    </div>
-   Подготовка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Projectile like project management library built on Emacs project.el
    ;;;; https://github.com/mohkale/projection

    ;;; Code:

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 169:</span>
      packages/projection/loaddefs.ecf
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Projectile like project management library built on Emacs project.el
    ;;;; https://github.com/mohkale/projection

    ;;; Code:

    (require 'projection)

    ;;;; Keymap


    ;;;; Enable `projection-hook', adds the possibility to run functions in per-project basis
    (global-projection-hook-mode 1)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 170:</span>
      packages/projection/desire.ecf
    </div>

<!--list-separator-->

1.  Интеграция

    -   Интеграция с `compile-multi`:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Projectile like project management library built on Emacs project.el
        ;;;; https://github.com/mohkale/projection

        ;;; Code:

        (desire 'projection-multi)
        (require 'projection-multi)

        ;;;; Allow interactively selecting available compilation targets from the current project type
        (general-define-key
         :keymaps 'project-prefix-map
         "RET" 'projection-multi-compile)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 171:</span>
          packages/projection/compile-multi.ecf
        </div>
    -   Интеграция с `ibuffer`:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Projectile like project management library built on Emacs project.el
        ;;;; https://github.com/mohkale/projection

        ;;; Code:

        (add-hook 'ibuffer-hook 'ibuffer-projection-set-filter-groups)
        ;;;; This ensures that `ibuffer-projection-set-filter-groups' takes effect
        (add-hook 'ibuffer-hook (lambda () (run-at-time 0.1 nil (lambda () (call-interactively #'ibuffer-update)))))

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 172:</span>
          packages/projection/ibuffer.ecf
        </div>
    -   Загрузка при использовании `project`:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Projectile like project management library built on Emacs project.el
        ;;;; https://github.com/mohkale/projection

        ;;; Code:

        (require 'projection)

        ;;;; Enable `projection-hook', adds the possibility to run functions in per-project basis
        (global-projection-hook-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 173:</span>
          packages/project/projection.ecf
        </div>


#### <span class="section-num">3.29.3</span> project {#project}

-   Подключение:
    ```emacs-lisp
    (desire 'project)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 174:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.29.4</span> projectile {#projectile}

```emacs-lisp
;; (desire 'projectile)
```


### <span class="section-num">3.30</span> Календарь {#календарь}

```emacs-lisp
;;; Appointments, diary, calendar {{{

;; Use "M-x calendar RET" to display the calendar and start
;; appointment warnings.

;; (desire-conf 'appt)
(desire 'calendar)
;; (desire-conf 'todo-mode)
;; (desire-conf 'diary "diary-lib")

;;;}}}
```


### <span class="section-num">3.31</span> Почта {#почта}


#### <span class="section-num">3.31.1</span> Общие опции {#общие-опции}

```emacs-lisp
;;; These provide options for the various message handling packages {{{

(desire 'browse-url)
;; (desire-conf 'mailcrypt)
;; (desire 'supercite)

;;;}}}
```


#### <span class="section-num">3.31.2</span> Работа с почтой {#работа-с-почтой}

```emacs-lisp
;;; Message {{{

(desire 'smtpmail)
;; (desire 'gnus)
(desire 'message)
;; (desire-conf 'vm)
;; (desire 'wl :ensurename 'wanderlust)
;; (desire-conf 'sendmail)
```


#### <span class="section-num">3.31.3</span> mu4e {#mu4e}

-   Подключение:
    ```emacs-lisp
    ;; (desire 'mu4e-dashboard :recipe '(:fetcher github :repo "rougier/mu4e-dashboard"))
    (desire 'mu4e :precondition-system-executable "mu")
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 175:</span>
      rc.packages.el
    </div>
-   Использование интерфейса transient:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Mu4e mail client, a transient menu
    ;; https://www.djcbsoftware.nl/code/mu/

    ;;; Code:

    (require 'mu4e-transient)
    (global-set-key (kbd "C-c m") #'mu4e-transient-menu)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 176:</span>
      packages/mu4e/transient.ecf
    </div>


### <span class="section-num">3.32</span> Блоги {#блоги}

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
```


### <span class="section-num">3.33</span> Мессенджеры {#мессенджеры}

```emacs-lisp
(desire 'telega)
```


### <span class="section-num">3.34</span> Отложенное чтение {#отложенное-чтение}


#### <span class="section-num">3.34.1</span> Pocket reader {#pocket-reader}

-   [Emacs. Pocket reader]({{< relref "2023-09-06-emacs_pocket_reader" >}})

<!--listend-->

```emacs-lisp
(desire 'pocket-reader)
```


#### <span class="section-num">3.34.2</span> Wallabag {#wallabag}

-   Подключение пакета:
    ```emacs-lisp
    (desire 'wallabag :recipe '(:fetcher github :repo "chenyanming/wallabag.el" :branch "master" :files ("*.el" "*.alist" "*.css")))
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 177:</span>
      rc.packages.el
    </div>
-   Начальные настройки:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Emacs wallabag client - A Read It Later/Web Archiving Solution in Emacs
    ;;; https://github.com/chenyanming/wallabag.el


    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 178:</span>
      packages/wallabag/loaddefs.ecf
    </div>
-   Загрузка пакета:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Emacs wallabag client - A Read It Later/Web Archiving Solution in Emacs
    ;;; https://github.com/chenyanming/wallabag.el

    (require 'wallabag)

    ;;; Retrieve new entries after `M-x wallabag`
    (add-hook 'wallabag-after-render-hook 'wallabag-search-update-and-clear-filter)

    ;;; Image Caching. Setting url-automatic-caching non-nil causes documents to be cached automatically
    (setq url-automatic-caching t)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 179:</span>
      packages/wallabag/desire.ecf
    </div>
-   Шаблон настройки параметров для пользователя:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Emacs wallabag client - A Read It Later/Web Archiving Solution in Emacs
    ;;; https://github.com/chenyanming/wallabag.el

    ;;; Wallabag server host name
    ;; (setq wallabag-host "https://xx.xx.xx")

    ;;; Username
    ;; (setq wallabag-username "xx")

    ;;; Password
    ;; (setq wallabag-password "xx")

    ;;; Created with API clients management
    ;; (setq wallabag-clientid "xx")

    ;;; Created with API clients management
    ;; (setq wallabag-secret "xx")

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 180:</span>
      packages/wallabag/personal.ecf
    </div>


### <span class="section-num">3.35</span> Dashboard {#dashboard}

```emacs-lisp

;;;}}}

;; (desire 'grammarly)

;; (desire 'flycheck-grammarly)

(desire 'dashboard)

;; PERSONAL

;; (require 'chord-mode)  ; edit guitar music.
;; (require 'discography) ; variant of BibTeX mode for discographies.
```


### <span class="section-num">3.36</span> Разные программные режимы {#разные-программные-режимы}


#### <span class="section-num">3.36.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Different program modes {{{
    ```


#### <span class="section-num">3.36.2</span> Пакет csv-mode {#пакет-csv-mode}

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


#### <span class="section-num">3.36.3</span> Поддержка ebuild-файлов {#поддержка-ebuild-файлов}

-   Сайт: <https://wiki.gentoo.org/wiki/Project:Emacs>
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Ebuild files
    (desire 'ebuild-mode :recipe '(:fetcher github :repo "emacsmirror/ebuild-mode" :branch "master"))
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 181:</span>
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
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 182:</span>
      packages/ebuild-mode/loaddefs.ecf
    </div>


#### <span class="section-num">3.36.4</span> Asymptote {#asymptote}

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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 183:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 184:</span>
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
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 185:</span>
      packages/org/desire.ecd/ob-asymptote.ecf
    </div>


#### <span class="section-num">3.36.5</span> kmonad-файлы {#kmonad-файлы}

-   Поддержка синтаксиса конфигурационных файлов kmonad.
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; kbd-mode
    ;; (desire 'kbd-mode :recipe '(:fetcher github :repo "kmonad/kbd-mode" :branch "master"))
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 186:</span>
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
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 187:</span>
      packages/kbd-mode.ecf
    </div>


#### <span class="section-num">3.36.6</span> Julia {#julia}

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


#### <span class="section-num">3.36.7</span> Поддержка командной оболочки fish {#поддержка-командной-оболочки-fish}

-   Загрузка пакета:
    ```emacs-lisp
    ;;; https://github.com/wwwjfy/emacs-fish
    (desire 'fish-mode)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 188:</span>
      rc.packages.el
    </div>
-   Настройка пакета:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; fish-mode for emacs
    ;;; https://github.com/wwwjfy/emacs-fish

    ;;; run fish_indent before save
    (add-hook 'fish-mode-hook (lambda ()
                            (add-hook 'before-save-hook 'fish_indent-before-save)))

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 189:</span>
      packages/fish-mode.ecf
    </div>


#### <span class="section-num">3.36.8</span> Разное {#разное}

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


#### <span class="section-num">3.36.9</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```


### <span class="section-num">3.37</span> Редактирование текста в броузере {#редактирование-текста-в-броузере}

-   [Emacs. Редактирование текста в броузере]({{< relref "2024-08-28-emacs-edit-text-area-browser" >}})


#### <span class="section-num">3.37.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Edit text areas in browsers {{{
    ```


#### <span class="section-num">3.37.2</span> Edit with Emacs {#edit-with-emacs}

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


#### <span class="section-num">3.37.3</span> Ghost Text {#ghost-text}

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


#### <span class="section-num">3.37.4</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```


### <span class="section-num">3.38</span> Навигация по файлам {#навигация-по-файлам}

-   [Emacs. Просмотр каталогов]({{< relref "2021-10-03-emacs-directory-browsing" >}})


#### <span class="section-num">3.38.1</span> dired {#dired}

<!--list-separator-->

1.  dired

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
        ;;;}}}
        ```

<!--list-separator-->

2.  diredc

    -   Репозиторий: <https://github.com/Boruch-Baum/emacs-diredc>
    -   Двупанельный (как в midnight commander) режим.
    -   Подключение:
        ```emacs-lisp
        ;;; Midnight Commander features (plus) for emacs dired-mode
        ;; (desire 'diredc)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 190:</span>
          rc.packages.el
        </div>


#### <span class="section-num">3.38.2</span> Neotree {#neotree}

-   [Emacs. Neotree]({{< relref "2022-03-23-emacs-neotree" >}})
-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;; (desire 'neotree)
    ```


#### <span class="section-num">3.38.3</span> Treemacs {#treemacs}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    (desire 'treemacs)
    ```


### <span class="section-num">3.39</span> Навигация по тексту {#навигация-по-тексту}


#### <span class="section-num">3.39.1</span> Начало {#начало}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;; Text navigation {{{
    ```


#### <span class="section-num">3.39.2</span> line-reminder {#line-reminder}

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


#### <span class="section-num">3.39.3</span> Конец {#конец}

-   Файл `rc.packages.el`:
    ```emacs-lisp
    ;;;}}}
    ```


### <span class="section-num">3.40</span> Перевод {#перевод}


#### <span class="section-num">3.40.1</span> go-translate {#go-translate}

-   Подключаем:
    ```emacs-lisp
    ;;; Translator on Emacs
    (desire 'go-translate)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 191:</span>
      rc.packages.el
    </div>
-   Загрузка:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Translator on Emacs. Supports multiple engines such as Google, Bing, deepL, ChatGPT, StarDict, Youdao and so on
    ;;; https://github.com/lorniu/go-translate

    (require 'go-translate)

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 192:</span>
      packages/go-translate/loaddefs.ecf
    </div>
-   Конфигурация:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Translator on Emacs. Supports multiple engines such as Google, Bing, deepL, ChatGPT, StarDict, Youdao and so on
    ;;; https://github.com/lorniu/go-translate


    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 193:</span>
      packages/go-translate/desire.ecf
    </div>
-   Простейшая конфигурация:
    ```emacs-lisp
    ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
    ;;; Translator on Emacs. Supports multiple engines such as Google, Bing, deepL, ChatGPT, StarDict, Youdao and so on
    ;;; https://github.com/lorniu/go-translate

    ;;; Initialize the default translator, let it translate between en and ru via Google Translate, and the result will be displayed in the Echo Area.
    (setq gt-langs '(en ru))
    (setq gt-default-translator (gt-translator :engines (gt-google-engine)))

    ;;;
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 194:</span>
      packages/go-translate/desire.ecd/google-simple.ecf
    </div>


### <span class="section-num">3.41</span> UI {#ui}

-   Раздел:
    ```emacs-lisp
    ;;;; UI
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 195:</span>
      rc.packages.el
    </div>


#### <span class="section-num">3.41.1</span> Шрифты {#шрифты}

-   [Emacs. Шрифты]({{< relref "2025-04-01--emacs-fonts" >}})
-   Раздел:
    ```emacs-lisp
    ;;;;; Fonts
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 196:</span>
      rc.packages.el
    </div>

<!--list-separator-->

1.  Выбор шрифта

    Подключение:

    ```emacs-lisp
    (desired 'iosevka)
    ```
    <div class="src-block-caption">
      <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 197:</span>
      rc.packages.el
    </div>

<!--list-separator-->

2.  Fontset

    -   Подключение:
        ```emacs-lisp
        (desire 'fontset)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 198:</span>
          rc.packages.el
        </div>
    -   Загрузка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Set fontset
        ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Modifying-Fontsets.html

        ;;; Code:

        ;;; Set default font
        ;; (cl-loop for font in '("SF Mono" "Hack" "Source Code Pro" "Fira Code"
        ;; 		       "Menlo" "Monaco" "DejaVu Sans Mono" "Consolas")
        ;; 	 when (font-installed-p font)
        ;; 	 return (set-face-attribute 'default nil
        ;; 				    :font font
        ;; 				    :height (cond (sys/mac-x-p 130)
        ;; 						  (sys/win32p 110)
        ;; 						  (t 100))))

        ;; ;;; Specify font for all unicode characters
        ;; (cl-loop for font in '("Apple Color Emoji" "Segoe UI Symbol" "Symbola" "Symbol")
        ;; 	 when (font-installed-p font)
        ;; 	 return (set-fontset-font t 'unicode font nil 'prepend))

        ;;; Specify font for Chinese characters
        ;; (cl-loop for font in '("WenQuanYi Micro Hei" "Microsoft Yahei")
        ;; 	 when (font-installed-p font)
        ;; 	 return (set-fontset-font t '(#x4e00 . #x9fff) font)))

        ;; (cond
        ;;  ((find-font (font-spec :name "Iosevka"))
        ;;   (add-to-list 'default-frame-alist '(font . "Iosevka-12" ))
        ;;   (set-face-attribute 'default t :font "Iosevka-12" ))
        ;;  ((find-font (font-spec :name "Hack"))
        ;;   (add-to-list 'default-frame-alist '(font . "Hack-12" ))
        ;;   (set-face-attribute 'default t :font "Hack-12" ))
        ;;  ((find-font (font-spec :name "IBM Plex Mono"))
        ;;   (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-12" ))
        ;;   (set-face-attribute 'default t :font "IBM Plex Mono-12" ))
        ;;  ((find-font (font-spec :name "Source Code Pro"))
        ;;   (add-to-list 'default-frame-alist '(font . "Source Code Pro-12" ))
        ;;   (set-face-attribute 'default t :font "Source Code Pro-12" ))
        ;;  ((find-font (font-spec :name "AnonymousPro"))
        ;;   (add-to-list 'default-frame-alist '(font . "AnonymousPro-12" ))
        ;;   (set-face-attribute 'default t :font "AnonymousPro-12" ))
        ;;  ((find-font (font-spec :name "Victor Mono"))
        ;;   (add-to-list 'default-frame-alist '(font . "Victor Mono-12" ))
        ;;   (set-face-attribute 'default t :font "Victor Mono-12" ))
        ;;  ((find-font (font-spec :name "Hermit"))
        ;;   (add-to-list 'default-frame-alist '(font . "Hermit-12" ))
        ;;   (set-face-attribute 'default t :font "Hermit-12" ))
        ;;  ((find-font (font-spec :name "Fira Code"))
        ;;   (add-to-list 'default-frame-alist '(font . "Fira Code-12" ))
        ;;   (set-face-attribute 'default t :font "Fira Code-12" ))
        ;;  ((find-font (font-spec :name "Inconsolata"))
        ;;   (add-to-list 'default-frame-alist '(font . "Inconsolata-12" ))
        ;;   (set-face-attribute 'default t :font "Inconsolata-12" ))
        ;;  ((find-font (font-spec :name "DejaVu Sans Mono"))
        ;;   (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12" ))
        ;;   (set-face-attribute 'default t :font "DejaVu Sans Mono-12" ))
        ;;  ((find-font (font-spec :name "Lucida Console"))
        ;;   (add-to-list 'default-frame-alist '(font . "Lucida Console-12" ))
        ;;   (set-face-attribute 'default t :font "Lucida Console-12" ))
        ;;  ((find-font (font-spec :name "Courier"))
        ;;   (add-to-list 'default-frame-alist '(font . "Courier-12" ))
        ;;   (set-face-attribute 'default t :font "Courier-12" ))
        ;;  )

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 199:</span>
          packages/fontset/loaddefs.ecf
        </div>
    -   Эмодзи:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Set emoji

        ;;; Code:

        ;;;; Use "Noto Color Emoji" for the emoji script (this is the default).
        (set-fontset-font "fontset-default" 'emoji
                          '("Noto Color Emoji" . "iso10646-1")
                          nil 'prepend)

        ;;;; Display the "heart" character using a color font.
        (set-fontset-font "fontset-default"
                          #x2764 "Noto Color Emoji")

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 200:</span>
          packages/fontset/desire.ecd/emoji.ecf
        </div>
    -   Unicode:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Font for all unicode characters

        ;;; Code:

        (set-fontset-font "fontset-default" 'unicode
                          (font-spec :family "Symbola")
                          nil 'prepend)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 201:</span>
          packages/fontset/desire.ecd/unicode.ecf
        </div>
    -   Шрифты
        -   Iosevka
            ```emacs-lisp
            ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
            ;;; Set Iosevka font
            ;; https://be5invis.github.io/Iosevka/

            ;;; Code:

            ;;;; Set default font

            (add-to-list 'default-frame-alist '(font . "Iosevka Term-12" ))
            (add-to-list 'initial-frame-alist '(font . "Iosevka Term-12" ))
            (set-face-attribute 'default nil :font "Iosevka Term-12" )

            ;;;; Set font
            (dolist (charset '(latin cyrillic greek))
              (set-fontset-font "fontset-default" charset
                                (font-spec :family "Iosevka Term" :size 12)
                                nil 'prepend))

            ;;;
            ```
            <div class="src-block-caption">
              <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 202:</span>
              packages/fontset/iosevka.ecf
            </div>

<!--list-separator-->

3.  Разное

    ```emacs-lisp
    ;; (desire 'mixed-pitch)
    ;; (desire-conf 'font-lock)
    ;; (desire-conf 'font-lock-jit)
    ;; (desire-conf 'font-lock-lazy)
    ;; (desire-conf 'font-lock-fast)
    ;; (desire-conf 'faces)
    ;; (desire-conf 'color-theme nil "color-theme")
    ;; (desire-conf 'fira-code-mode nil "fira-code-mode" t) ;; Simple minor mode for Fira Code ligatures
    ```

<!--list-separator-->

4.  Лигатуры

    ```emacs-lisp
    ;; (desire 'ligature)
    ```

<!--list-separator-->

5.  unicode-fonts

    ```emacs-lisp
    (desire 'unicode-fonts)
    ```

    -   Загрузка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Configure Unicode fonts for Emacs
        ;; https://github.com/rolandwalker/unicode-fonts

        ;;; Code:

        ;;;; Requires font-utils
        (desire 'font-utils)

        ;;;; Requires ucs-utils
        (desire 'ucs-utils)

        ;;;; Uses if present
        (desire 'persistent-soft)

        ;;;; Load package
        (require 'unicode-fonts)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 203:</span>
          packages/unicode-fonts/loaddefs.ecf
        </div>
    -   Настройка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Configure Unicode fonts for Emacs
        ;; https://github.com/rolandwalker/unicode-fonts

        ;;; Code:

        ;;; ligature support
        (setq unicode-fonts-enable-ligatures t)

        ;;; By default ligatures will be enabled in all programing modes.
        (setq unicode-fonts-ligature-modes '(prog-mode))

        ;;; You can enable ligatures for specific modes.
        ;; (setq unicode-fonts-ligature-modes '(php-mode js-mode))

        ;;; To enable only for text modes you can use text-mode
        ;; (setq unicode-fonts-ligature-modes '(text-mode))

        ;;; Configure the ligature set
        (setq unicode-fonts-ligature-set '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                           ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                           "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                           "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                           "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                           "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                           "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                           "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                           ">=" ">>" ">-" "-~" "-|" "->" "-<" "<~" "<*" "<|" "<:" "<$"
                                           "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!" "##"
                                           "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:" "?="
                                           "?." "??" ";;" "/*" "/**" "/=" "/>" "__" "~~" "(*" "*)"
                                           "://"))

        (setq ecf-unicode-font (font-spec :family "Iosevka" :size 12))

        (when ecf-unicode-font
          (let ((ecf-unicode-font-family (plist-get (font-face-attributes ecf-unicode-font) :family)))
            (dolist (unicode-block unicode-fonts-block-font-mapping)
              (push ecf-unicode-font-family (cadr unicode-block)))))

        (unicode-fonts-setup)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 204:</span>
          packages/unicode-fonts/desire.ecf
        </div>


#### <span class="section-num">3.41.2</span> Modeline {#modeline}

<!--list-separator-->

1.  Начало

    -   Файл `rc.packages.el`:
        ```emacs-lisp
        ;;; Modeline {{{
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 205:</span>
          rc.packages.el
        </div>

<!--list-separator-->

2.  Общие настройки modeline

    -   Загрузим только конфигурационный файл:
        ```emacs-lisp
        (desire-conf 'modeline)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 206:</span>
          rc.packages.el
        </div>

    -   Заголовок файла:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Configure modeline
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 207:</span>
          packages/modeline.ecf
        </div>
    -   Показывать столбец, в котором находится курсор (<https://www.gnu.org/software/emacs/manual/html_node/efaq/Displaying-the-current-line-or-column.html>):
        ```emacs-lisp
        ;;; Show column number
        (setq column-number-mode t)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 208:</span>
          packages/modeline.ecf
        </div>
    -   Задаём 24-часовой формат времени:
        ```emacs-lisp
        ;;; Time in 24 hour format, plus day and date.
        (setq display-time-day-and-date t)
        (setq display-time-24hr-format t)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 209:</span>
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
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 210:</span>
          packages/modeline.ecf
        </div>

    -   Разрешим показывать время в модлайн:
        ```emacs-lisp
        ;;; Enable the display of time and CPU load average in the modeline
        (display-time-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 211:</span>
          packages/modeline.ecf
        </div>

<!--list-separator-->

3.  Конец

    -   Файл `rc.packages.el`:
        ```emacs-lisp
        ;;;}}}
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 212:</span>
          rc.packages.el
        </div>


#### <span class="section-num">3.41.3</span> Темы {#темы}

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

<!--list-separator-->

1.  Modus-themes

    -   [Emacs. Темы. Modus-themes]({{< relref "2023-02-15-emacs-themes-modus-themes" >}})
    -   Подключаем темы в файле `rc.packages.el`:
        ```emacs-lisp
        ;; (desire 'modus-themes)
        ```

<!--list-separator-->

2.  Ef-themes

    -   [Emacs. Темы. Ef-themes]({{< relref "2023-06-13-emacs-themes-ef-themes" >}})
    -   Подключаем темы в файле `rc.packages.el`:
        ```emacs-lisp
        (desire 'ef-themes)
        ```

<!--list-separator-->

3.  Финализирование

    -   Финализируем раздел в `rc.packages.el`:
        ```emacs-lisp

        ;;;}}}
        ```


#### <span class="section-num">3.41.4</span> Внешний вид {#внешний-вид}

<!--list-separator-->

1.  Posframe

    -   Дочерний фрейм в точке.
    -   <https://github.com/tumashu/posframe>
    -   Подключение:
        ```emacs-lisp
        ;; (desire 'posframe)
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 213:</span>
          rc.packages.el
        </div>
    -   Загрузка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Pop a posframe (just a child-frame) at point
        ;; https://github.com/tumashu/posframe

        ;;; Code:

        (require 'posframe)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 214:</span>
          packages/posframe/loaddefs.ecf
        </div>
    -   Настройка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Pop a posframe (just a child-frame) at point
        ;; https://github.com/tumashu/posframe

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 215:</span>
          packages/posframe/desire.ecf
        </div>
    -   Поддержка _vertico_:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Vertico-posframe is an vertico extension, which lets vertico use posframe to show its candidate menu
        ;; https://github.com/tumashu/vertico-posframe

        (desire 'vertico-posframe)

        (require 'vertico-posframe)
        ;; (vertico-posframe-mode 1)

        (setq vertico-multiform-commands
              '((consult-line
                 posframe
                 (vertico-posframe-poshandler . posframe-poshandler-frame-top-center)
                 (vertico-posframe-border-width . 10)
                 ;; NOTE: This is useful when emacs is used in both in X and
                 ;; terminal, for posframe do not work well in terminal, so
                 ;; vertico-buffer-mode will be used as fallback at the
                 ;; moment.
                 (vertico-posframe-fallback-mode . vertico-buffer-mode))
                (t posframe)))
        (vertico-multiform-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 216:</span>
          packages/posframe/vertico.ecf
        </div>

<!--list-separator-->

2.  Nova

    -   Репозиторий: <https://github.com/thisisran/nova>
    -   Прорисовка дочерних фреймов с помощью SVG.
    -   Подключение:
        ```emacs-lisp
        (desire 'eldoc-box)
        ;; (desire 'nova :recipe '(:fetcher github :repo "thisisran/nova" :branch "main"))
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 217:</span>
          rc.packages.el
        </div>
    -   Загрузка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Emacs SVG Child Frames
        ;;;; https://github.com/thisisran/nova

        (require 'nova)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 218:</span>
          packages/nova/loaddefs.ecf
        </div>
    -   Настройка:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Emacs SVG Child Frames
        ;;;; https://github.com/thisisran/nova

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 219:</span>
          packages/nova/desire.ecf
        </div>
    -   Поддержка _vertico_:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Emacs SVG Child Frames
        ;;;; https://github.com/thisisran/nova

        (require 'nova-vertico)
        (nova-vertico-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 220:</span>
          packages/nova/vertico.ecf
        </div>
    -   Поддержка _corfu_:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Emacs SVG Child Frames
        ;;;; https://github.com/thisisran/nova

        (require 'nova-corfu)
        (require 'nova-corfu-popupinfo)

        (nova-corfu-mode 1)
        (nova-corfu-popupinfo-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 221:</span>
          packages/nova/corfu.ecf
        </div>
    -   Поддержка _eldoc-box_:
        ```emacs-lisp
        ;;; -*- mode: emacs-lisp; lexical-binding: t; coding: utf-8-unix; -*-
        ;;; Emacs SVG Child Frames
        ;;;; https://github.com/thisisran/nova

        ;; (require 'nova-eldoc)
        ;; (nova-eldoc-mode 1)

        ;;;
        ```
        <div class="src-block-caption">
          <span class="src-block-number">&#1056;&#1072;&#1089;&#1087;&#1077;&#1095;&#1072;&#1090;&#1082;&#1072; 222:</span>
          packages/nova/eldoc-box.ecf
        </div>

<!--list-separator-->

3.  Zoom

    ```emacs-lisp
    ;; (desire 'zoom)
    ```


### <span class="section-num">3.42</span> Финализирование {#финализирование}

-   Финализируем файл `rc.packages.el`:
    ```emacs-lisp
    ;;; rc.packages.el ends here
    ```
