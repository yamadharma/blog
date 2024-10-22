---
title: "Установочный образ Windows"
author: ["Dmitry S. Kulyabov"]
date: 2024-10-22T14:08:00+03:00
lastmod: 2024-10-22T17:06:00+03:00
tags: ["sysadmin", "windows"]
categories: ["computer-science"]
draft: false
slug: "windows-installation-image"
---

Установочный образ Windows.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общее описание {#общее-описание}

-   Можно создать образ Windows с предустановленным программным обеспечением и устанавливать его на хосты.
-   Недостаток такого подхода в том, что для обновления любого приложения необходимо пересобрать образ заново.


### <span class="section-num">1.1</span> Sysprep {#sysprep}

-   Утилита: `C:\Windows\System32\Sysprep\sysprep.exe`
-   Штатный инструмент развёртывания Windows.
-   Действия sysprep:
    -   удаляются имя хоста, SID, GUID, идентификаторы Active Directory;
    -   машина выводится из домена (для последующего успешного добавления в домен с новым именем);
    -   удаляются plug-and-play драйвера, что уменьшает риск возникновения проблем с совместимостью;
    -   опционально удаляются логи;
    -   удаляются точки восстановления;
    -   удаляется профиль локального администратора и этот аккаунт отключается;
    -   обеспечивается загрузка целевой машины в режим аудита, позволяющий устанавливать дополнительные приложения и драйверы;
    -   обеспечивается запуск mini-setup (oobe) при первом запуске для смены имени машины и другой дополнительной конфигурации;
    -   сбрасывается период активации Windows (сброс возможен до 3 раз).


## <span class="section-num">2</span> Создание образа {#создание-образа}


### <span class="section-num">2.1</span> Порядок действий {#порядок-действий}

-   Развёртывание чистой Windows на эталонном компьютере (виртуальной машине).
-   Вход в режим аудита, установка необходимых приложений, настройка окружения.
-   Очистка Windows после настройки.
-   Загрузка в среде WinPE и захват WIM образа Windows с помощью DISM.
-   Замена оригинального `install.wim` на установочном ISO образе.


### <span class="section-num">2.2</span> Развёртывание чистой Windows на эталонном компьютере {#развёртывание-чистой-windows-на-эталонном-компьютере}

-   Выполните ручную установку Windows.
-   Не обязательно устанавливать систему полностью, достаточно остановиться на этапе OOBE (когда вам предлагают выбрать региональные настройки и создать учётную запись).
    -   На этом этапе нажмите `Ctrl + Shift + F3`.
    -   Это переведёт компьютер в режим аудита (Audit Mode), в котором будет выполнен автоматический вход под встроенной учётной записью `Administrator`.
    -   Это эквивалентно команде:
        ```shell
        %windir%\system32\sysprep\sysprep.exe /audit
        ```
    -   После появления рабочего стола, сверните окно утилиты `sysprep`, не закрывая его.


### <span class="section-num">2.3</span> Установка необходимых приложений {#установка-необходимых-приложений}

-   Можно приступить к установке программ, обновлений, настройке нужных параметров Windows.
-   Можно настроить ярлыки на рабочем столе, плитки в меню Start, фоновые рисунки, заставки, цветовые схемы и прочее.
-   Можно настроить параметры локальной групповой политики с помощью редактора `gpedit.msc`.
-   Чтобы применить настройки текущего пользователю к шаблонному пользователю `Default`, создайте файл ответов `unattend.xml` в каталоге `C:\Windows\System32\Sysprep`:
    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <unattend xmlns="urn:schemas-microsoft-com:unattend">
      <settings pass="specialize">
        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
          <CopyProfile>true</CopyProfile>
        </component>
      </settings>
    </unattend>
    ```


### <span class="section-num">2.4</span> Очистка Windows после настройки {#очистка-windows-после-настройки}

-   Удалите имеющиеся теневые копии и точки восстановления:
    ```shell
    vssadmin delete shadows /All /Quiet
    ```
-   Очистите неиспользуемые файлы компонентов и обновлений в папке WinSxS:
    ```shell
    Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
    ```
-   Удалите загруженные файлы обновлений Windows:
    ```shell
    del %windir%\SoftwareDistribution\Download\*.* /f /s /q
    ```
-   Выполните очистку диска с помощью утилиты `cleanmgr`:
    ```shell
    Cleanmgr /sagerun:1
    ```
-   Очистите логи Windows:
    ```shell
    for /F "tokens=*" %1 in ('wevtutil.exe el') DO wevtutil.exe cl "%1"
    ```
-   Очистите корзину:
    ```shell
    Clear-RecycleBin -Force Clear-RecycleBin -Force
    ```


### <span class="section-num">2.5</span> Подготовка к развёртыванию {#подготовка-к-развёртыванию}

-   Разверните окно `sysprep` и выберите опции:
    -   Enter System Out-of-Box Experience (OOBE)
    -   Generalize
    -   Shutdown
-   Это эквивалентно команде:
    ```shell
    %windir%\system32\sysprep\sysprep.exe /generalize /oobe /shutdown
    ```


### <span class="section-num">2.6</span> Захват настроенного образа Windows с помощью DISM {#захват-настроенного-образа-windows-с-помощью-dism}

-   Нужно выполнить офлайн захват образа установленной Windows в WIM файл и поместить его на отдельный диск.
-   Загрузите компьютер с эталонной версией Windows с загрузочного диска в среде WinPE (WinRE).
-   Можно загрузиться с установочного диска с Windows и на этапе начала установки нажать Shift+F10, чтобы открыть командную строку.
-   Нужно идентифицировать буквы диска, которые назначены разделу с Windows и чистому разделу, куда будет скопирован WIM файл:
    ```shell
    diskpart
    list vol
    exit
    ```
-   Пусть диску с Windows присвоена бука `c:`, а пустому диску буква `d:`.
-   Чтобы выполнить захват офлайн образа Windows на диске `c:` и поместить полученный WIM образ на `d:`, выполните команду:
    ```shell
    dism /capture-image /imagefile:D:\install.wim /capturedir:C:\ /ScratchDir:D:\ /name:"Win10Image" /compress:maximum /checkintegrity /verify /bootable
    ```


### <span class="section-num">2.7</span> Замена оригинального образа Windows (Install.wim) на носителе {#замена-оригинального-образа-windows--install-dot-wim--на-носителе}

-   После получения образа Windows можно заменить файл с оригинальным установочным образом `install.wim` (или `install.esd`) в каталоге `\sources` на установочном носителе.
-   Если вы используете `FAT32`, то вы не сможете разместить файл больше 4 Гб на этой файловой системе. В этом случае большой WIM файл нужно разбить на несколько файлов `SWM`:
    ```shell
    Dism /Split-Image /ImageFile:D:\sources\install.wim /SWMFile:c:\tmp\install.swm /FileSize:3500
    ```

    -   В данном случае DISM создаст файлы вида `install.swm`, `install2.swm` и т. д.
    -   Их нужно скопировать в папку `\sources`.
