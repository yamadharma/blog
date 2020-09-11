---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "2020 09 10 Migration Sway"
subtitle: ""
slug: migration-sway
summary: ""
authors: []
tags: []
categories: []
date: 2020-09-10T10:33:15+03:00
lastmod: 2020-09-10T10:33:15+03:00
featured: false
draft: true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

## Переход на Sway

### Замена приложений

#### Скриншот

- Исходно использовался `scrot`.
- Для Wayland перешёл на связку [`grim`](https://github.com/emersion/grim) + [`slurp`](https://github.com/emersion/slurp)

``` bash
emerge -uv gui-apps/slurp gui-apps/grim
```

