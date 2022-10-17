---
title: "Тензор проницаемостей для локального линейного случая"
author: ["Dmitry S. Kulyabov"]
date: 2022-09-20T17:51:00+03:00
lastmod: 2022-10-14T11:52:00+03:00
draft: false
slug: "local-linear-case-constitutive-tensor"
---

Тензор проницаемостей для локального линейного случая.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Соглашения и обозначения {#соглашения-и-обозначения}


## <span class="section-num">2</span> Варианты физической среды {#варианты-физической-среды}

-   Тензоры \\(F\_{\alpha \beta}\\) и \\(G^{\alpha \beta}\\) имеют смысл кривизны в кокасательном (\\(T^{\*}X\\)) и касательном (\\(TX\\)) расслоениях.
-   Линейный нелокальный случай при наличии трансляционной симметрии сводится к линейному локальному случаю с помощью преобразования Фурье.
-   Запишем нелокальную линейную связь между \\(F\\) и \\(G\\) следующим образом:

    \begin{equation}
    \label{eq:lambda:linear:nonlocal}
    G(x) = \int \lambda(x,s) \wedge F (s) \dd{s}.
    \end{equation}
-   Предполагая наличие трансляционной инвариантности \\(\lambda(x,s) = \lambda(x - s),\\) запишем связь между \\(F\\) и \\(G\\):

     \begin{equation}
     \label{eq:lambda:nonlinear:local:furier}
     G^{\alpha \beta} (\omega, k\_i) = \lambda^{\alpha \beta \gamma \delta} (\omega,k\_i) F\_{\gamma \delta}(\omega,k\_i).
    \end{equation}

    <div class="table-caption">
      <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1:</span>
      Варианты тензора напряжённостей
    </div>

    |            | локальный                                                                          | нелокальный                                 |
    |------------|------------------------------------------------------------------------------------|---------------------------------------------|
    | линейный   | \\(G^{\alpha \beta} =   \lambda^{\alpha \beta \gamma \delta} F\_{\gamma \delta}\\) | \\(G(x) = \int \lambda(x,s) \wedge F (s)\\) |
    | нелинейный | \\(G^{\alpha \beta} = \lambda (F\_{\gamma \delta})\\)                              |                                             |


## <span class="section-num">3</span> Структура тензора проницаемостей {#структура-тензора-проницаемостей}


### <span class="section-num">3.1</span> Представление тензора проницаемостей в пространстве \\(\mathbb{R} ^{4}\\) {#представление-тензора-проницаемостей-в-пространстве-mathbb-r-4}

-   Тензор проницаемости \\(\lambda ^{\alpha \beta} \_{\gamma \delta} \\) представляет собой 4-тензор.
-   Будем считать, что отображение \\(\lambda : \Lambda^2 M \to \Lambda\_2 M\\) линейное и локальное. Тогда его можно представить в следующем виде:

    \begin{equation}
    \label{eq:g\_lambda\_f}
    G^{\alpha \beta} =
    %\frac{1}{2}
    \lambda^{\alpha \beta \gamma \delta} F\_{\gamma \delta},
    \end{equation}

    здесь \\(\lambda^{\alpha \beta \gamma \delta}\\) --- тензор проницаемостей, содержащий информацию как об диэлектрической и магнитной проницаемостях, так и об электромагнитной связи [<a href="#citeproc_bib_item_1">1</a>–<a href="#citeproc_bib_item_4">4</a>].
-   Видно, что \\(\lambda^{\alpha \beta \gamma \delta}\\) имеет следующую симметрию:
    \\[\lambda^{\alpha \beta \gamma \delta} = \lambda^{[\alpha \beta] [\gamma \delta]}\\]
-   Для уточнения симметрии, тензор \\(\lambda^{\alpha \beta \gamma \delta}\\) можно представить в следующем виде:
    \\[\lambda^{\alpha \beta \gamma \delta} = {}^{(1)} \lambda^{\alpha \beta \gamma \delta} + {}^{(2)} \lambda^{\alpha \beta \gamma \delta} + {}^{(3)} \lambda^{\alpha \beta \gamma \delta}.\\]
-   Компоненты имеют следующую симметрию:
    \\[
        {}^{(1)} \lambda^{\alpha \beta \gamma \delta} = \lambda^{([\alpha \beta] [\gamma \delta])}, \quad
        {}^{(2)} \lambda^{\alpha \beta \gamma \delta} = \lambda^{[[\alpha \beta] [\gamma \delta]]}, \quad
        {}^{(3)} \lambda^{\alpha \beta \gamma \delta} = \lambda^{[\alpha \beta \gamma \delta]}.
     \\]
-   Очевидно, что \\(\lambda^{\alpha \beta \gamma \delta}\\) имеет 36 независимых компонент, \\({}^{(1)}\lambda^{\alpha \beta \gamma \delta}\\) имеет 20 независимых компонент (основная часть, _principal part_), \\({}^{(2)}\lambda^{\alpha \beta \gamma \delta}\\) имеет 15 независимых компонент (_skewon_), \\({}^{(3)}\lambda^{\alpha \beta \gamma \delta}\\) имеет 1 независимую компоненту (_axion_).
-   Будем рассматривать только часть \\({}^{(1)}\lambda^{\alpha \beta \gamma \delta}\\).
-   Запишем материальные уравнения:

    \begin{equation}
    \label{eq:constraint}
      \begin{cases}
        D^{i} &= \varepsilon^{i j} E\_{j} + {}^{(1)}\gamma^{i}\_{j} B^{j},
        \\\\
        H\_{i} &= \qty(\mu^{-1})\_{i j} B^{j} + {}^{(2)}\gamma^{j}\_{i} E\_{j},
      \end{cases}
      \end{equation}

    где \\(\varepsilon^{i j}\\) и \\(\mu^{i j}\\) --- тензоры диэлектрической и магнитной проницаемостей, \\({}^{(1)}\gamma^{i}\_{j}\\) и \\({}^{(2)}\gamma^{i}\_{j}\\) --- перекрёстные члены.
-   Учитывая структуру тензоров \\(F\_{\alpha \beta}\\) и \\(G^{\alpha \beta}\\), а также уравнения связи, запишем:

    \begin{equation}
    \label{eq:f-g\_lambda}
    \begin{gathered}
      F\_{\crd{0}\crd{i}} = E\_{\crd{i}}, \quad
      G^{\crd{0}\crd{i}} = - D^{\crd{i}},
      \\\\
      G^{\crd{i}\crd{j}} = - e^{\crd{i} \crd{j} \crd{k}}
      H\_{\crd{k}},
      \quad
      F\_{\crd{i} \crd{j}}
       = - e\_{\crd{i} \crd{j} \crd{k}}
      B^{\crd{k}}.
      \end{gathered}
      \end{equation}
-   \\(e \_{ijk}\\) есть альтернирующий тензор.


### <span class="section-num">3.2</span> Представление тензора проницаемостей в пространствах \\(A \_{2} (\mathbb{R} ^{4})\\)  и \\(A ^{2} (\mathbb{R} ^{4\*})\\) {#представление-тензора-проницаемостей-в-пространствах-a-2--mathbb-r-4--и-a-2--mathbb-r-4}

-   Будем рассматривать векторные пространства \\(A ^{2} (\mathbb{R}^{4\*})\\) и \\(A \_{2} (\mathbb{R}^4)\\) как типичные слои расслоений \\(\Lambda ^{2} M\\) и \\(\Lambda \_{2} M\\).
-   Для его представления используем известный трюк перехода в шестимерное пространство.
-   Базис \\(A \_{2} (\mathbb{R}^4)\\) состоит имеет вид \\(\zeta \_{I}, I=1,\ldots,6 \\).
-   Базис \\(A ^{2} (\mathbb{R}^{4\*})\\) состоит имеет вид \\(\zeta ^{I}, I=1,\ldots,6 \\).
-   Пусть \\(\delta \_{\mu}, \mu = 0,\ldots,3\\) есть базис в \\(\mathbb{R}^{4}\\), \\(\delta ^{\mu}, \mu = 0,\ldots,3\\) есть базис в \\(\mathbb{R} ^{4\*}\\).
-   Определим базис  \\(\zeta \_{I}\\) в \\(A \_{2} (\mathbb{R}^4)\\):

    \begin{equation}
    \label{eq:xi\_I}
    \zeta \_{i} = \delta \_{0} \wedge \delta \_{i}, \quad \zeta \_{i+3} = \frac{1}{2} \varepsilon \_{ijk} \delta \_{j} \wedge \delta \_{k}, \quad i,j,k = 1,\ldots,3.
    \end{equation}

-   Определим базис  \\(\zeta ^{I}\\) в \\(A ^{2} (\mathbb{R} ^{4\*})\\):

    \begin{equation}
    \label{eq:xi^I}
    \zeta ^{i} = \delta ^{0} \wedge \delta ^{i}, \quad \zeta ^{i+3} = \frac{1}{2} \varepsilon ^{ijk} \delta ^{j} \wedge \delta ^{k}, \quad i,j,k = 1,\ldots,3.
    \end{equation}
-   В этом базисе можно представить напряжённость электромагнитного поля \\(F\\) следующим образом:

    \begin{equation}
    \label{eq:FasVector}
    F = E \_{i} \zeta ^{i} + B \_{i} \zeta ^{i+3}.
    \end{equation}
-   Разобъём тензор \\(\lambda ^{IJ}\\):
    \\[\lambda ^{I J} = {}^{(1)} \lambda ^{I J} + {}^{(2)} \lambda ^{I J} + {}^{(3)} \lambda ^{I J}.\\]
-   Компоненты имеют следующую симметрию:
    \\[
        {}^{(1)} \lambda ^{I J} = \lambda ^{(I J)} - \lambda ^{K} \_{K} \tilde{I} ^{I J}, \quad
        {}^{(2)} \lambda ^{I J} = \lambda ^{[I J]}, \quad
        {}^{(3)} \lambda ^{I J} = \lambda ^{K} \_{K} \tilde{I} ^{I J}, \quad \tilde{I} := \mqty(\admat[0]{I ^{ij},I ^{ij}}).
     \\]
-   Распишем основную часть тензора проницаемостей:

    \begin{equation}
    \label{eq:lambda1IJ-as-matrix}
    {}^{(1)} \lambda ^{I J} = \mqty(-\varepsilon ^{ij} & {}^{(1)}\gamma^{i}\_{j}  \\\ {}^{(2)}\gamma^{j}\_{i}  & \tilde{\mu} \_{i j} ), \quad \tilde{\mu} \_{i j} := \qty(\mu^{-1})\_{i j}.
    \end{equation}
-   Далее в этой статье будем опускать индекс у основной части тензора проницаемостей.


## <span class="section-num">4</span> Линейные изотропные среды {#линейные-изотропные-среды}

-   Наиболее элементарными электромагнитными средами являются линейные изотропные среды, например классический вакуум.
-   Термин _изотропный_ относится к инвариантности относительно пространственных вращений в выбранной системе отсчёта. Поворот любой замкнутой системы как целого не изменяет её физических свойств.
-   В пространстве нет какого-то выделенного направления, относительно которого существует какая-либо особая симметрия. Все направления равноправны.
-   Электромагнитные свойства среды не зависят от направления.
-   Элементы тензора \\(\lambda ^{IJ}\\) имеют вид:

    \begin{equation}
    \label{eq:lambda-isotropic-elements}
    \varepsilon ^{ij} = \varepsilon (x ^{i}) \delta ^{ij}, \quad \tilde{\mu} \_{i j} := \qty(\mu ^{-1}(x ^{i})) \delta \_{i j}, \quad {}^{(1)}\gamma^{i}\_{j} =0, \quad {}^{(2)}\gamma^{j}\_{i} =0.
    \end{equation}
-   Запишем \\(\lambda ^{IJ}\\) виде матрицы:

    \begin{equation}
    \label{eq:lambda-isotropic-elements}
    \lambda ^{I J} = \mqty(\mqty{\dmat{-\varepsilon(x ^{i}), -\varepsilon(x ^{i}), -\varepsilon(x ^{i})}} & \mqty{\dmat{,0,}} \\\  \mqty{\dmat{,0,}}  & \mqty{\dmat{\frac{1}{\mu(x ^{i})}, \frac{1}{\mu(x ^{i})}, \frac{1}{\mu(x ^{i})}}} )
    \end{equation}
-   В данной случае матрица проницаемостей содержит только две независимых компоненты в лабораторной системе отсчёта.
-   Функция \\(\varepsilon (x ^{i})\\) называется диэлектрической проницаемостью среды.
-   Функция \\(\mu (x ^{i})\\) называется магнитной проницаемостью среды.
-   Когда эти функции постоянны в выбранной системе отсчёта, то и среду называют _однородной_.
-   Классический электромагнитный вакуум предполагается линейным, изотропным и однородным. Его диэлектрическая проницаемость (в системе СИ) обозначается через \\(\varepsilon \_{0}\\), а магнитная проницаемость --- через \\(\mu \_{0}\\).

## Литература

<style>.csl-left-margin{float: left; padding-right: 0em;}
 .csl-right-inline{margin: 0 0 0 1em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>
    <div class="csl-left-margin">1.</div><div class="csl-right-inline">Тамм И.Е. Кристаллооптика теории относительности в связи с геометрией биквадратичной формы // Журнал русского физико-химического общества. часть физическая. 1925. Vol. 57, № 3-4. P. 209–240.</div>
  </div>
  <div class="csl-entry"><a id="citeproc_bib_item_2"></a>
    <div class="csl-left-margin">2.</div><div class="csl-right-inline">Тамм И.Е. Электродинамика анизотропной среды в специальной теории относительности // Журнал русского физико-химического общества. часть физическая. 1924. Vol. 56, № 2-3. P. 248–262.</div>
  </div>
  <div class="csl-entry"><a id="citeproc_bib_item_3"></a>
    <div class="csl-left-margin">3.</div><div class="csl-right-inline">Мандельштам Л.И., Тамм И.Е. Электродинамика анизотропных сред в специальной теории относительности // Собрание научных трудов. Москва: Наука, 1975. Vol. 1. P. 62–67.</div>
  </div>
  <div class="csl-entry"><a id="citeproc_bib_item_4"></a>
    <div class="csl-left-margin">4.</div><div class="csl-right-inline">Ландау Л.Д., Лифшиц Е.М. Теоретическая физика: Электродинамика сплошных сред. 4-е изд. Москва: Физматлит, 2003. Vol. 8. 656 p.</div>
  </div>
</div>
