#include "ruby/missing.h"

/* https://github.com/libressl-portable/portable/blob/master/m4/check-os-options.m4 */
#if defined(__OpenBSD__)
# include "arc4random_openbsd.h"
#elif defined(_AIX)
# include "arc4random_aix.h"
#elif defined(__FreeBSD__)
# include "arc4random_freebsd.h"
#elif defined(__hpux)
# include "arc4random_hpux.h"
#elif defined(__linux__)
# include "arc4random_linux.h"
#elif defined(__NetBSD__)
# include "arc4random_netbsd.h"
#elif defined(__APPLE__)
# include "arc4random_osx.h"
#elif defined(__sun)
# include "arc4random_solaris.h"
#elif defined(_WIN32)
# include "arc4random_win.h"
#else
# error This platform is not supported
#endif

int getentropy(void *buf, size_t len);
#define DEF_WEAK(x)
