---
title: "Gentoo. Компиляция системы clang"
author: ["Dmitry S. Kulyabov"]
date: 2024-05-16T15:18:00+03:00
lastmod: 2024-07-17T18:43:00+03:00
tags: ["gentoo", "sysadmin", "linux"]
categories: ["computer-science"]
draft: false
slug: "gentoo-compiling-clang"
---

Переход на Clang для компиляции системы.

<!--more-->

{{< toc >}}


## <span class="section-num">1</span> Общая информация {#общая-информация}

-   Обязательно должен быть запасной вариант с _GCC_.
-   На данный момент система не сможет скомпилировать все, что использует _Clang_.


## <span class="section-num">2</span> Установка {#установка}

-   Установите `llvm-libunwind`:
    ```shell
    emerge --deselect libunwind
    FEATURES="-protect-owned" emerge -vO llvm-libunwind
    ```
-   Установите _Clang_:
    ```shell
    emerge sys-devel/clang-runtime sys-devel/clang sys-libs/compiler-rt sys-libs/compiler-rt-sanitizers sys-devel/lld-toolchain-symlinks sys-devel/lld
    ```
-   Установите библиотеку для C++:
    ```shell
    emerge sys-libs/libcxxabi sys-libs/libcxx
    ```
-   Вместо `lld` можно использовать линкер `mold`:
    ```shell
    emerge mold
    ```


## <span class="section-num">3</span> Обновление системы {#обновление-системы}

-   Перекомпилим пакеты с библиотекой `libunwind`:
    ```shell
    revdep-rebuild --library libunwind -- --keep-going
    ```
-   Удалите библиотеку `libunwind`:
    ```shell
    emerge -cv libunwind
    ```
-   Необходимо перекомпилить программы, слинкованные со стандартной библиотекой `libstdc++`.
-   Проверьте, какие программы надо перекомпилить:
    ```shell
    revdep-rebuild --library libstdc++ -p
    ```
-   Перекомпилим эти пакеты:
    ```shell
    revdep-rebuild --library libstdc++ -- --keep-going
    ```


## <span class="section-num">4</span> Конфигурация {#конфигурация}


### <span class="section-num">4.1</span> Основная системная конфигурация {#основная-системная-конфигурация}

-   Файл `/etc/portage/make.conf`:
    ```conf-unix
    # this sources the PORTDIR_OVERLAY variable defined by layman. however, the variable expanded by layman was empty
    # source /var/db/repos/gentoo/local/layman/make.conf

    ## This is added to make options by linux-mod.eclass
    BUILD_FIXES="LLVM=1 LLVM_IAS=1"

    CFLAGS="${CFLAGS} -flto=thin"
    #CFLAGS="${CFLAGS} -mllvm -extra-vectorizer-passes -mllvm -enable-cond-stores-vec -mllvm -slp-vectorize-hor-store -mllvm -enable-loopinterchange -mllvm -enable-loop-distribute -mllvm -enable-unroll-and-jam -mllvm -enable-loop-flatten -mllvm -interleave-small-loop-scalar-reduction -mllvm -unroll-runtime-multi-exit -mllvm -aggressive-ext-opt -fno-math-errno -fno-trapping-math -falign-functions=32 -funroll-loops -fno-semantic-interposition -fcf-protection=none -mharden-sls=none -fomit-frame-pointer -mprefer-vector-width=256 -flto"
    CXXFLAGS="${CFLAGS} ${CXXFLAGS}"

    CC="clang"
    CPP="clang-cpp" # necessary for xorg-server and possibly other packages
    CXX="clang++"
    AR="llvm-ar"
    NM="llvm-nm"
    RANLIB="llvm-ranlib"

    # No need to set this, clang-common can handle this based on chosen USE flags
    #LDFLAGS="${LDFLAGS} -fuse-ld=lld"
    #LDFLAGS="${LDFLAGS} -Wl,-O2 -Wl,--as-needed -Wl,--undefined-version"
    #LDFLAGS="${LDFLAGS} -rtlib=compiler-rt -unwindlib=libunwind"
    #LDFLAGS="${LDFLAGS} -fuse-ld=mold"
    LDFLAGS="${LDFLAGS} -flto"

    ```


### <span class="section-num">4.2</span> Конфигурация для каждого пакета {#конфигурация-для-каждого-пакета}

-   Можно задать компилятор для каждого пакета в отдельности в файле `/etc/portage/package.env`:
    ```conf-unix
    sys-devel/gcc				compiler-gcc	# gcc itself
    sys-devel/binutils			compiler-gcc	# gcc itself	# configure: error: AR
    sys-libs/binutils-libs			compiler-gcc	# gcc itself
    dev-util/mingw64-toolchain		compiler-gcc	# gcc itself
    dev-debug/gdb				compiler-gcc	# gcc itself
    =dev-util/gengetopt-2.23*		compiler-gcc	#
    sys-devel/bin86				compiler-gcc    # error: ISO C99
    #media-video/obs-studio			compiler-gcc	# cef plugin
    #media-video/obs-studio			compiler-clang-no-lto
    app-emulation/virtualbox		compiler-gcc    # ld.lld error
    app-emulation/virtualbox-kvm		compiler-gcc    # ld.lld error
    #app-emulation/qemu              compiler-gcc    # ERROR: sizeof(size_t) doesn't match
    #dev-lang/mono                   compiler-gcc    # ld.lld error
    #app-cdr/cdrtools                compiler-gcc    # configure error
    #dev-libs/libsecp256k1           compiler-gcc    # unrecognized command-line option
    #dev-util/ostree                 compiler-gcc    # ld.lld error
    #dev-python/ruamel-yaml-clib     compiler-gcc    # incompatible function pointer types
    #dev-qt/qtwebengine:5             compiler-gcc    # build fails
    #media-libs/libpano13            compiler-gcc    # build fails
    #media-libs/tg_owt               compiler-gcc    # build fails
    #media-libs/phonon               compiler-gcc    # build fails
    #media-libs/vigra                compiler-gcc    # build fails
    #net-print/hplip                 compiler-gcc    # error: ISO C++17
    #sys-boot/syslinux               compiler-gcc    # 'stdarg.h' file not found
    #sys-libs/db                     compiler-gcc    # build fails with USE="cxx"
    #sys-process/tini                compiler-gcc    # ld.lld error
    sys-apps/systemd				compiler-gcc
    dev-libs/libgudev				compiler-gcc
    #net-dialup/ppp					compiler-gcc
    #media-libs/audiofile				compiler-gcc
    #app-crypt/chntpw				compiler-gcc
    media-gfx/exact-image			compiler-gcc
    media-libs/libfpx			compiler-gcc
    sci-libs/djbfft				compiler-gcc
    sci-visualization/gnuplot		compiler-gcc
    =dev-db/sqlite-3.45*			compiler-gcc
    app-editors/emacs			compiler-gcc	# gcc-jit
    sys-libs/talloc				compiler-gcc
    sys-libs/tevent				compiler-gcc
    #app-text/freelib			compiler-gcc
    app-editors/wily			compiler-gcc
    sci-mathematics/gretl			compiler-gcc
    dev-java/openjdk:8			compiler-gcc
    dev-java/openjdk:11			compiler-gcc
    dev-java/openjdk:17			compiler-clang-mold
    dev-java/openjdk:21			compiler-clang-mold
    dev-java/commons-daemon			compiler-gcc
    =dev-perl/PDL-2.63*			compiler-gcc
    dev-python/scipy			compiler-clang-mold
    dev-python/pygame			compiler-gcc
    dev-games/openscenegraph		compiler-gcc
    #dev-util/intel-graphics-compiler	compiler-gcc
    #dev-libs/intel-compute-runtime		compiler-gcc
    dev-libs/libdnet			compiler-gcc
    sys-devel/llvm:15			compiler-gcc
    sys-devel/clang:15			compiler-gcc
    sys-devel/lld:15			compiler-gcc
    dev-libs/opencl-clang:15		compiler-gcc
    dev-libs/opencl-clang			compiler-clang-mold
    dev-util/spirv-llvm-translator:15	compiler-gcc
    dev-debug/lldb				compiler-clang-lto
    media-video/vlc				compiler-clang-no-lto
    dev-libs/intel-vc-intrinsics		compiler-gcc
    app-misc/ddcutil			compiler-gcc
    mail-client/thunderbird			compiler-gcc
    #www-client/chromium			compiler-gcc
    dev-vcs/cvs				compiler-gcc
    dev-vcs/darcs				compiler-clang-binutils	# need ld
    x11-libs/agg				compiler-gcc
    x11-libs/fox				compiler-gcc
    x11-libs/motif				compiler-clang-lto
    sys-boot/gnu-efi			compiler-gcc
    sys-apps/memtest86+			compiler-gcc
    #sys-apps/fwupd-efi			compiler-clang-binutils
    sys-apps/fwupd-efi			compiler-gcc
    sys-apps/flashrom			compiler-gcc
    media-libs/mesa				compiler-clang-lto
    app-text/zathura-pdf-mupdf		compiler-clang-mold
    sys-libs/ldb				compiler-clang-mold
    sys-libs/tdb				compiler-clang-mold
    dev-db/cdb				compiler-gcc
    sys-auth/sssd				compiler-clang-mold
    =sci-libs/coinor-osi-0.108.6		compiler-gcc		# bug: #919825
    media-gfx/blender:4.0			compiler-gcc
    dev-debug/systemtap			compiler-gcc
    x11-misc/virtualgl			compiler-clang-mold
    dev-libs/libphonenumber			compiler-clang-mold
    dev-libs/ffcall				compiler-gcc
    dev-util/yacc				compiler-gcc
    dev-libs/libbpf				compiler-clang-mold
    dev-perl/OpenGL				compiler-clang-mold
    dev-libs/xmlrpc-c			compiler-gcc
    dev-libs/liboil				compiler-gcc
    dev-libs/liblouis			compiler-gcc
    dev-java/snappy				compiler-gcc
    dev-libs/libcdio			compiler-gcc
    net-fs/samba				compiler-clang-mold
    dev-lang/gprolog			compiler-clang-mold
    dev-libs/log4cpp			compiler-gcc
    dev-db/libiodbc				compiler-clang-mold
    dev-debug/ddd				compiler-gcc
    dev-libs/totem-pl-parser		compiler-clang-mold
    dev-lisp/ecl				compiler-gcc
    dev-db/mariadb				compiler-gcc
    dev-perl/PGPLOT				compiler-clang-mold
    net-analyzer/rrdtool			compiler-clang-mold
    dev-lang/harbour			compiler-gcc
    media-libs/avidemux-core		compiler-gcc
    media-video/avidemux			compiler-gcc
    media-libs/avidemux-plugins		compiler-gcc
    net-nds/openldap			compiler-clang-mold
    net-libs/serf				compiler-clang-mold
    sci-mathematics/pari			compiler-gcc		# needs fix makefiles
    dev-python/cysignals			compiler-gcc
    app-accessibility/brltty		compiler-clang-mold
    media-video/ffmpeg			compiler-clang-mold
    app-office/dia				compiler-gcc
    app-text/tesseract			compiler-clang-mold
    dev-perl/PDL				compiler-clang-mold
    dev-perl/OpenGL-GLUT			compiler-clang-mold
    net-misc/openssh-contrib		compiler-gcc
    dev-haskell/network			compiler-gcc
    dev-haskell/old-time				compiler-gcc
    dev-haskell/resolv				compiler-gcc
    net-proxy/dante					compiler-gcc
    sys-apps/keyutils				compiler-clang-mold
    net-libs/libnftnl				compiler-clang-mold
    media-sound/sox					compiler-clang-mold
    media-libs/libgphoto2				compiler-clang-mold
    net-dns/bind-tools				compiler-clang-mold
    media-gfx/sane-backends				compiler-gcc
    app-text/paper-clip				compiler-gcc
    app-i18n/scim					compiler-gcc
    =sci-mathematics/octave-8*			compiler-gcc
    =sci-mathematics/octave-9*			compiler-gcc
    #sci-mathematics/octave				compiler-clang-mold
    dev-libs/libgamin				compiler-clang-mold
    x11-misc/redshift				compiler-gcc
    #sci-visualization/scidavis			compiler-gcc
    sys-cluster/glusterfs				compiler-clang-mold
    media-libs/exempi				compiler-gcc
    media-libs/urt					compiler-gcc
    media-libs/libopenraw				compiler-gcc
    media-libs/libsidplay				compiler-gcc
    media-libs/libdc1394				compiler-gcc
    media-gfx/autopano-sift-C			compiler-gcc
    media-libs/libdv				compiler-gcc
    media-video/gpac				compiler-gcc
    media-gfx/povray				compiler-gcc
    media-libs/openglide				compiler-gcc
    media-sound/audacity				compiler-clang-mold
    net-firewall/ipset				compiler-clang-mold
    media-gfx/graphicsmagick			compiler-clang-mold
    dev-libs/libayatana-appindicator		compiler-clang-mold
    net-libs/gtk-vnc				compiler-clang-mold
    net-misc/omniORB				compiler-gcc
    media-gfx/inkscape				compiler-clang-mold
    net-print/gutenprint				compiler-gcc
    net-misc/netkit-telnetd				compiler-gcc
    net-fs/autofs					compiler-gcc
    net-fs/openafs					compiler-gcc
    #media-libs/libva-intel-media-driver		compiler-gcc
    #sci-geosciences/liblas				compiler-gcc
    dev-lang/openmodelica				compiler-gcc
    dev-db/sqlite					compiler-gcc	## Bug #928745
    media-video/mpv					compiler-clang-mold
    app-emulation/dosemu				compiler-gcc
    app-arch/lha					compiler-gcc
    app-arch/arj					compiler-gcc
    app-text/fbreader				compiler-gcc
    app-cdr/cdrtools				compiler-gcc

    ```
-   Нужно задать конфигурации для разных компиляторов.
-   Конфигурация для компилятора _gcc_ в файле `/etc/portage/env/compiler-gcc`:
    ```conf-unix
    COMMON_FLAGS="-O2 -march=native"
    CFLAGS="${COMMON_FLAGS}"
    CXXFLAGS="${COMMON_FLAGS}"
    LDFLAGS="-Wl,--as-needed"

    CC="gcc"
    CXX="g++"
    CPP="gcc -E"
    AR="ar"
    NM="nm"
    RANLIB="ranlib"
    OBJCOPY="objcopy"
    STRIP="strip"
    LD="ld"

    ```
-   Конфигурация для компилятора _clang_ без _LTO_ в файле `/etc/portage/env/compiler-clang-no-lto`:
    ```conf-unix
    # Normal settings here
    COMMON_FLAGS="-O2 -march=native"
    CFLAGS="${COMMON_FLAGS}"
    CXXFLAGS="${COMMON_FLAGS}"

    CC="clang"
    CPP="clang-cpp" # necessary for xorg-server and possibly other packages
    CXX="clang++"
    AR="llvm-ar"
    NM="llvm-nm"
    RANLIB="llvm-ranlib"

    # No need to set this, clang-common can handle this based on chosen USE flags
    # LDFLAGS="${LDFLAGS} -fuse-ld=lld -rtlib=compiler-rt -unwindlib=libunwind -Wl,--as-needed"
    # LDFLAGS="-fuse-ld=lld -rtlib=compiler-rt -unwindlib=libunwind -Wl,--as-needed"

    ```


## <span class="section-num">5</span> Компиляция ядра {#компиляция-ядра}

-   Ядро Linux можно скомпилировать с помощью _Clang_ и набора инструментов _LLVM_, определив переменную среды:
    ```shell
    LLVM=1
    ```
-   Чтобы настроить специальные параметры ядра _Clang_, такие как оптимизация времени компоновки или целостность потока управления, выполните следующую команду:
    ```shell
    LLVM=1 make menuconfig
    ```
-   Далее скомпилируйте ядро ​​как обычно:
    ```shell
    LLVM=1 make
    ```
-   Раньше необходимо было объявить `LLVM_IAS=1` для использования внутреннего ассемблера Clang для ядра.
-   Это больше не требуется, поскольку `LLVM=1` теперь включён по умолчанию.


## <span class="section-num">6</span> C++ ABI {#c-plus-plus-abi}

-   Для Clang по умолчанию устанавливается библиотека C++ `libcxx`.
-   При компиляции с помощью _gcc_ используется библиотека `libstdc++`.
-   Необходимо, как минимум, перекомпилить приложения, использующие библиотеку `libstdc++`:
    ```shell
    revdep-rebuild --library libstdc++ -- -v --keep-going
    ```


## <span class="section-num">7</span> Ресурсы {#ресурсы}

-   <https://wiki.gentoo.org/wiki/Clang>
-   <https://wiki.gentoo.org/wiki/Clang/Bootstrapping>
