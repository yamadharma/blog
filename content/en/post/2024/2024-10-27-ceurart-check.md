---
title: "CEURART document verification"
author: ["Dmitry S. Kulyabov"]
date: 2024-10-27T19:39:00+03:00
lastmod: 2024-12-17T12:47:00+03:00
tags: ["latex"]
categories: ["computer-science"]
draft: false
slug: "ceurart-check"
---

CEURART document verification.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Key issues {#key-issues}

-   Frequent errors are:
    -   not using Libertinus fonts;
    -   using an old CEURART template;
    -   not using the correct copyright phrase;
    -   not having selectable text in the PDF file, preventing indexing by GoogleScholar and the like.


## <span class="section-num">2</span> Utilities {#utilities}

-   The document verification utilities for CEUR-WS can be found in the repository: <https://github.com/yamadharma/ceurart-check>
-   `check-pdf-errors`:
    -   Checks pdf files.
    -   Checks for the presence of the phrase 'Creative Commons' in pdf files.
        -   This is to check if the text can be highlighted (if the document is not an image).
    -   Checking for the use of Libertinus fonts.
    -   Checking for duplication of pdf files.
-   `check-index-errors`:
    -   Checks the `index.html` file.
