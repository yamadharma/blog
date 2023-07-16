---
title: "Реализация метода GTD на основе Emacs"
author: ["Dmitry S. Kulyabov"]
date: 2021-07-12T14:50:00+03:00
lastmod: 2023-07-15T20:47:00+03:00
tags: ["emacs", "gtd"]
categories: ["self-management"]
draft: false
slug: "implementation-gtd-method-emacs"
---

-   Метод GTD можно реализовывать с помощью разного программного обеспечения.
-   Для меня оказалось наиболее просто использовать инфраструктуру среды _emacs_.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая реализация {#общая-реализация}

-   В качестве основного инструментария для реализации метода GTD выступает _org-mode_.
-   Для работы с почтой можно использовать один из почтовых клиентов, например, _mu4e_ (см. [Emacs. Почта. Mu4e. Процесс работы с почтой]({{< relref "2021-07-12-emacs-mail-mu4e-email-workflow" >}})).
