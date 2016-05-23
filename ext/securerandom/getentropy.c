#if defined(__OpenBSD__)
# error OpenBSD does not use this file
#elif defined(_AIX)
# include "getentropy_aix.c"
#elif defined(__FreeBSD__)
# include "getentropy_freebsd.c"
#elif defined(__hpux)
# include "getentropy_hpux.c"
#elif defined(__linux__)
# undef _POSIX_C_SOURCE
# include "getentropy_linux.c"
#elif defined(__NetBSD__)
# include "getentropy_netbsd.c"
#elif defined(__APPLE__)
# include "getentropy_osx.c"
#elif defined(__sun)
# include "getentropy_solaris.c"
#elif defined(_WIN32)
# include "getentropy_win.c"
#else
# error This platform is not supported
#endif
