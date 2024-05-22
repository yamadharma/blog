---
title: "Gentoo. Компиляция системы clang"
author: ["Dmitry S. Kulyabov"]
date: 2024-05-16T15:18:00+03:00
lastmod: 2024-05-16T18:59:00+03:00
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

-   Установите _Clang_:
    ```shell
    emerge sys-devel/clang
    ```


## <span class="section-num">3</span> Конфигурация {#конфигурация}


### <span class="section-num">3.1</span> Основная системная конфигурация {#основная-системная-конфигурация}

-   Файл `/etc/portage/make.conf`:
    ```conf-unix
    # this sources the PORTDIR_OVERLAY variable defined by layman. however, the variable expanded by layman was empty
    # source /var/db/repos/gentoo/local/layman/make.conf

    #CFLAGS="${CFLAGS} -flto=thin"
    CFLAGS="${CFLAGS} -flto=thin"
    #CFLAGS="${CFLAGS} -mllvm -extra-vectorizer-passes -mllvm -enable-cond-stores-vec -mllvm -slp-vectorize-hor-store -mllvm -enable-loopinterchange -mllvm -enable-loop-distribute -mllvm -enable-unroll-and-jam -mllvm -enable-loop-flatten -mllvm -interleave-small-loop-scalar-reduction -mllvm -unroll-runtime-multi-exit -mllvm -aggressive-ext-opt -fno-math-errno -fno-trapping-math -falign-functions=32 -funroll-loops -fno-semantic-interposition -fcf-protection=none -mharden-sls=none -fomit-frame-pointer -mprefer-vector-width=256 -flto"
    CXXFLAGS="${CFLAGS} ${CXXFLAGS}"
    # -O2 in LDFLAGS refers to binary size optimization during linking, it is NOT related to the -O levels of the compiler
    #LDFLAGS="${LDFLAGS} -Wl,-O2 -Wl,--as-needed -Wl,--undefined-version -mllvm -extra-vectorizer-passes -mllvm -enable-cond-stores-vec -mllvm -slp-vectorize-hor-store -mllvm -enable-loopinterchange -mllvm -enable-loop-distribute -mllvm -enable-unroll-and-jam -mllvm -enable-loop-flatten -mllvm -interleave-small-loop-scalar-reduction -mllvm -unroll-runtime-multi-exit -mllvm -aggressive-ext-opt -flto"


    CC="clang"
    CPP="clang-cpp" # necessary for xorg-server and possibly other packages
    CXX="clang++"
    AR="llvm-ar"
    NM="llvm-nm"
    RANLIB="llvm-ranlib"

    # No need to set this, clang-common can handle this based on chosen USE flags
    #LDFLAGS="${LDFLAGS} -fuse-ld=lld"
    LDFLAGS="${LDFLAGS} -Wl,-O2 -Wl,--as-needed -Wl,--undefined-version"
    LDFLAGS="${LDFLAGS} -rtlib=compiler-rt -unwindlib=libunwind"
    LDFLAGS="${LDFLAGS} -fuse-ld=mold"
    LDFLAGS="${LDFLAGS} -flto"
    ```


### <span class="section-num">3.2</span> Конфигурация для каждого пакета {#конфигурация-для-каждого-пакета}

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
    #sys-apps/systemd			compiler-gcc
    #net-dialup/ppp				compiler-gcc
    #media-libs/audiofile			compiler-gcc
    #app-crypt/chntpw			compiler-gcc
    media-gfx/exact-image			compiler-gcc
    media-libs/libfpx			compiler-gcc
    sci-libs/djbfft				compiler-gcc
    sci-visualization/gnuplot		compiler-gcc
    =dev-db/sqlite-3.45*			compiler-gcc
    #dev-lang/R				compiler-gcc
    app-editors/emacs			compiler-gcc	# gcc-jit
    sys-libs/talloc				compiler-gcc
    sys-libs/tevent				compiler-gcc
    #app-text/freelib			compiler-gcc
    app-editors/wily			compiler-gcc
    sci-mathematics/gretl			compiler-gcc
    #sci-mathematics/octave			compiler-gcc
    dev-java/openjdk:8			compiler-gcc
    =dev-perl/PDL-2.63*			compiler-gcc
    dev-python/scipy			compiler-clang-no-lto
    dev-python/pygame			compiler-gcc
    dev-games/openscenegraph		compiler-gcc
    #dev-util/intel-graphics-compiler	compiler-gcc
    #dev-libs/intel-compute-runtime		compiler-gcc
    dev-util/intel-graphics-compiler	compiler-clang-no-lto
    dev-libs/intel-compute-runtime		compiler-clang-no-lto
    dev-libs/libdnet			compiler-gcc
    # sys-devel/llvm				compiler-clang
    =kde-frameworks/breeze-icons-6.2*	compiler-gcc
    sys-devel/llvm:15			compiler-gcc
    dev-libs/opencl-clang:15		compiler-gcc
    dev-util/spirv-llvm-translator:15	compiler-gcc
    dev-libs/intel-vc-intrinsics		compiler-gcc
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
    LDFLAGS="${LDFLAGS} -fuse-ld=lld -rtlib=compiler-rt -unwindlib=libunwind -Wl,--as-needed"
    ```


## <span class="section-num">4</span> Компиляция ядра {#компиляция-ядра}

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


## <span class="section-num">5</span> C++ ABI {#c-plus-plus-abi}

-   Для Clang по умолчанию устанавливается библиотека C++ `libcxx`.
-   При компиляции с помощью _gcc_ используется библиотека `libstdc++`.
-   Необходимо, как минимум, перекомпилить приложения, использующие библиотеку `libstdc++`:
    ```shell
    revdep-rebuild --library libstdc++ -- -v --keep-going
    ```


## <span class="section-num">6</span> Ресурсы {#ресурсы}

-   <https://wiki.gentoo.org/wiki/Clang>
-   <https://wiki.gentoo.org/wiki/Clang/Bootstrapping>
