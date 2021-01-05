
#include <quadmath.h>
#include <float.h>
#include <stdlib.h>

#ifdef __MINGW64_VERSION_MAJOR /* fenv.h needed to workaround nearbyintq() bug */
#include <fenv.h>
#endif

#ifdef OLDPERL
#define SvUOK SvIsUV
#endif

#ifndef Newx
#  define Newx(v,n,t) New(0,v,n,t)
#endif

int _DIGITS = 36;

#if defined(__MINGW32__) && !defined(__MINGW64_VERSION_MAJOR)
  /* mingw.org 32-bit compilers only */
  typedef __float128 float128 __attribute__ ((aligned(32)));
#elif defined(__MINGW64__) || (defined(DEBUGGING) && defined(NV_IS_DOUBLE))
  /* mingw-w64 64-bit compilers only */
  typedef __float128 float128 __attribute__ ((aligned(8)));
#else
  typedef __float128 float128;
#endif


/*
* gcc versions 4.9 through to 7 like to cast 80-bit long double Inf to __float128 NaN
* There are places where we need to work around this bug
*/
#if !defined(INF_CAST_BUG_ABSENT) && defined(NV_IS_LONG_DOUBLE) && defined(__GNUC__) \
    && ((__GNUC__ > 4 && __GNUC__ < 7) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 9))
#define AVOID_INF_CAST 1
#endif

#define NOK_POK_DUALVAR_CHECK \
        if(SvNOK(b)) { \
         nok_pok++; \
         if(SvIV(get_sv("Math::Float128::NOK_POK", 0))) \
           warn("Scalar passed to %s is both NV and PV. Using PV (string) value"

