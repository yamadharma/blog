---
title: "Виды электронной подписи"
author: ["Dmitry S. Kulyabov"]
date: 2023-01-30T15:07:00+03:00
lastmod: 2023-02-09T11:18:00+03:00
categories: ["life"]
draft: false
slug: "types-digital-signature"
---

В России в электронном документообороте можно использовать три вида подписи: простую, усиленную неквалифицированную и усиленную квалифицированную.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Виды электронной подписи {#виды-электронной-подписи}


### <span class="section-num">1.1</span> Простая электронная подпись (ПЭП) {#простая-электронная-подпись--пэп}

-   Простая электронная подпись --- комбинация логина, пароля и кода подтверждения, полученного по электронной почте, СМС, USSD и другими способами.


#### <span class="section-num">1.1.1</span> Где используется простая электронная подпись {#где-используется-простая-электронная-подпись}

-   Используется
    -   при банковских операциях;
    -   для аутентификации в информационных системах;
    -   для получения госуслуг;
    -   для заверения документов внутри корпоративного электронного документооборота (ЭДО).

-   Простую электронную подпись нельзя использовать при подписании электронных документов или в информационной системе, которые содержат гостайну.


#### <span class="section-num">1.1.2</span> Юридическая сила простой электронной подписи {#юридическая-сила-простой-электронной-подписи}

-   Простая подпись приравнивается к собственноручной, если это регламентирует отдельный нормативно-правовой акт или между участниками электронного документооборота заключено соглашение, где прописаны:
    -   правила, по которым подписанта определяют по его простой электронной подписи;
    -   обязанность пользователя соблюдать конфиденциальность закрытой части ключа ПЭП.

-   Во многих информационных системах пользователь должен сначала подтвердить свою личность во время визита к оператору систему, чтобы его ПЭП в будущем имела юридическую силу.
    -   Например, для получения подтвержденной учетной записи на портале Госуслуг, нужно лично прийти в один из центров регистрации с документом, удостоверяющим личность.


### <span class="section-num">1.2</span> Неквалифицированная электронная подпись (НЭП) {#неквалифицированная-электронная-подпись--нэп}

-   Усиленная неквалифицированная электронная подпись создаётся с помощью программ криптошифрования с использованием закрытого ключа электронной подписи.
-   НЭП идентифицирует личность владельца, а также позволяет проверить, вносили ли в файл изменения после его отправки.
-   Человек получает в удостоверяющем центре два ключа электронной подписи: закрытый и открытый.
    -   Закрытый ключ хранится на специальном ключевом носителе с пин-кодом или в компьютере пользователя --- он известен только владельцу и его нужно держать в тайне.
    -   С помощью закрытого ключа владелец генерирует электронные подписи, которыми подписывает документы.
    -   Открытый ключ электронной подписи доступен всем.
-   То, что открытый ключ принадлежит владельцу закрытого ключа, прописывается в сертификате электронной подписи.
-   Сертификат выдаётся удостоверяющим центром, но при использовании НЭП сертификат можно не создавать.


#### <span class="section-num">1.2.1</span> Где используется неквалифицированная электронная подпись {#где-используется-неквалифицированная-электронная-подпись}

-   НЭП можно использовать для внутреннего и внешнего электронного документооборота, если стороны предварительно договорились об этом.


#### <span class="section-num">1.2.2</span> Юридическая сила НЭП {#юридическая-сила-нэп}

-   Участникам электронного документооборота нужно соблюдать дополнительные условия, чтобы электронные документы, заверенные НЭП, считались равнозначными бумажным с собственноручной подписью.
-   Сторонам нужно обязательно заключить между собой соглашение о правилах использования НЭП и взаимном признании ее юридической силы.


### <span class="section-num">1.3</span> Квалифицированная электронная подпись (КЭП) {#квалифицированная-электронная-подпись--кэп}

-   Усиленная квалифицированная электронная подпись --- самый регламентированный государством вид подписи.
-   Она  создаётся с помощью криптографических алгоритмов и базируется на инфраструктуре открытых ключей.
-   Отличается от НЭП в следующем:
    -   Обязательно имеет квалифицированный сертификат в бумажном или электронном виде, структура которого определена приказом ФСБ России № 795 от 27.12.2011.
    -   Программное обеспечение для работы с КЭП сертифицировано ФСБ России.
    -   Выдавать КЭП может только удостоверяющий центр, который аккредитован Минкомсвязи России.


#### <span class="section-num">1.3.1</span> Где используется квалифицированная электронная подпись? {#где-используется-квалифицированная-электронная-подпись}

-   КЭП нужна, чтобы:
    -   сдавать отчётность в контролирующие органы;
    -   участвовать в качестве поставщика и заказчика в электронных торгах;
    -   работать с государственными информационными системами;
    -   обмениваться формализованными документами с ФНС;
    -   вести электронный документооборот внутри компании или с ее внешними контрагентами.


#### <span class="section-num">1.3.2</span> Юридическая сила КЭП {#юридическая-сила-кэп}

-   КЭП придаёт документам юридическую силу без дополнительных условий.
-   Если организации ведут электронный документооборот, подписывая документы КЭП, их юридическая сила признается автоматически согласно федеральному закону № 63-ФЗ «Об электронной подписи».


### <span class="section-num">1.4</span> Сводная таблица {#сводная-таблица}

<div class="table-caption">
  <span class="table-number">&#1058;&#1072;&#1073;&#1083;&#1080;&#1094;&#1072; 1:</span>
  Отличия видов электронной подписи
</div>

| Свойства электронной подписи  | Простая                                  | Неквалифицированная            | Квалифицированная              |
|-------------------------------|------------------------------------------|--------------------------------|--------------------------------|
| Способ получения              | Самостоятельно, при регистрации на сайте | В любом УЦ                     | В аккредитованном УЦ           |
| Защита подписанного документа | Не защищает документ от подделки         | Защищает документ от подделки  | Защищает документ от подделки  |
| Юридическая значимость        | Требует соглашения о признании           | Требует соглашения о признании | Равна собственноручной подписи |
| Где хранятся                  | На любом носителе                        | На любом носителе              | Защищённый носитель            |
| Стоимость                     | Бесплатно                                | Бесплатно платно               | Обычно платно                  |


## <span class="section-num">2</span> Как получить усиленную квалифицированную электронную подпись физическому лицу {#как-получить-усиленную-квалифицированную-электронную-подпись-физическому-лицу}


### <span class="section-num">2.1</span> В удостоверяющем центре {#в-удостоверяющем-центре}

-   Для получения усиленной квалифицированной электронной подписи вам понадобятся:
    -   документ, удостоверяющий личность;
    -   страховое свидетельство обязательного пенсионного страхования (СНИЛС);
    -   индивидуальный номер налогоплательщика (ИНН);
    -   основной государственный регистрационный номер записи о государственной регистрации физического лица в качестве индивидуального предпринимателя (если вы являетесь представителем индивидуального предпринимателя);
    -   дополнительный комплект документов, подтверждающий ваши полномочия действовать от имени юридического лица (если вы получаете подпись представителя юридического лица).

-   Документы необходимо представить в аккредитованный удостоверяющий центр.
-   Сотрудник центра, после того как установит вашу личность и проверит документы, запишет сертификат и ключи электронной подписи на сертифицированный электронный носитель.
-   Стоимость услуги по предоставлению сертификата и ключей электронной подписи определяется регламентом аккредитованного удостоверяющего центра.


### <span class="section-num">2.2</span> На mos.ru {#на-mos-dot-ru}

-   Усиленную квалифицированную электронную подпись также можно получить на <https://www.mos.ru/> при получении ряда государственных услуг.
-   Ключи электронной подписи предоставляются на основании вашего заявления на <https://www.mos.ru/> после того, как орган исполнительной власти подтвердит, что вы имеете право на получение государственной услуги.


### <span class="section-num">2.3</span> В приложении Госключ {#в-приложении-госключ}

-   Сформировать усиленную квалифицированную электронную подпись (УКЭП) можно в приложении Госключ <https://www.gosuslugi.ru/goskey>.
-   В этом случае не требуются ни личная явка, ни USB-токен.
-   Достаточно иметь подтвержденную учетную запись на портале госуслуг РФ, загранпаспорт нового образца (на 10 лет) и смартфон или планшет с функцией NFC.
-   Документ, который вы хотите подписать электронной подписью, нужно загрузить в приложение с помощью сервиса «Подписание документов в Госключе» на портале госуслуг РФ (<https://www.gosuslugi.ru/600373/1/form>).
-   Документы, необходимые для получения государственных услуг, а также с коммерческих площадок, интегрированных с Госключом, отобразятся в приложении автоматически.
-   Поставить электронную подпись на документе можно, пройдя дистанционную идентификацию по загранпаспорту.
-   Для этого надо указать номер паспорта и дату окончания его срока действия, а затем отсканировать с помощью смартфона правую часть пластиковой страницы документа.
-   Создание и использование электронной подписи в приложении бесплатное.


## <span class="section-num">3</span> Электронная подпись в личном кабинете на сайте Федеральной налоговой службы {#электронная-подпись-в-личном-кабинете-на-сайте-федеральной-налоговой-службы}

-   Данная электронная подпись действительна только в рамках взаимодействия с налоговыми органами через Личный кабинет налогоплательщика.
-   Она является неквалифицированной электронной подписью.
-   Получить электронную подпись можно бесплатно через Личный кабинет (<https://lkfl2.nalog.ru/lkfl/login>) в разделе _Настройки профиля_, _Электронная подпись_.
-   ФНС предлагает два варианта хранения подписи:
    -   ключ к подписи хранится на компьютере пользователя;
    -   ключ к подписи хранится в защищенном налоговой службой хранилище.
-   Сертификат ключа проверки электронной подписи действует в течение одного года.
-   По истечении срока действия сертификата ключа налогоплательщику необходимо самостоятельно получить новый сертификат через Личный кабинет.