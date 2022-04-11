## This file generated by InlineX::C2XS (version 0.22) using Inline::C (version 0.53)
package Math::Float128;
use warnings;
use strict;

use Math::Float128::Constant;

require Exporter;
*import = \&Exporter::import;
require DynaLoader;

use overload
  '+'     => \&_overload_add,
  '*'     => \&_overload_mul,
  '-'     => \&_overload_sub,
  '/'     => \&_overload_div,
  '**'    => \&_overload_pow,
  '+='    => \&_overload_add_eq,
  '*='    => \&_overload_mul_eq,
  '-='    => \&_overload_sub_eq,
  '/='    => \&_overload_div_eq,
  '**='   => \&_overload_pow_eq,
  '=='    => \&_overload_equiv,
  '""'    => \&_overload_string,
  '!='    => \&_overload_not_equiv,
  'bool'  => \&_overload_true,
  '!'     => \&_overload_not,
  '='     => \&_overload_copy,
  '<'     => \&_overload_lt,
  '<='    => \&_overload_lte,
  '>'     => \&_overload_gt,
  '>='    => \&_overload_gte,
  '<=>'   => \&_overload_spaceship,
  'abs'   => \&_overload_abs,
  'int'   => \&_overload_int,
  'sqrt'  => \&_overload_sqrt,
  'log'   => \&_overload_log,
  'exp'   => \&_overload_exp,
  'sin'   => \&_overload_sin,
  'cos'   => \&_overload_cos,
  'atan2' => \&_overload_atan2,
  '++'    => \&_overload_inc,
  '--'    => \&_overload_dec,
;

use constant F128_PV_NV_BUG => Math::Float128::Constant::_has_pv_nv_bug();

# Inspired by https://github.com/Perl/perl5/issues/19550:
use constant ISSUE_19550    => Math::Float128::Constant::_issue_19550();

use subs qw(FLT128_DIG FLT128_MANT_DIG FLT128_MIN_EXP FLT128_MAX_EXP FLT128_MIN_10_EXP FLT128_MAX_10_EXP
            M_Eq M_LOG2Eq M_LOG10Eq M_LN2q M_LN10q M_PIq M_PI_2q M_PI_4q M_1_PIq M_2_PIq
            M_2_SQRTPIq M_SQRT2q M_SQRT1_2q
            FLT128_MAX FLT128_MIN FLT128_EPSILON FLT128_DENORM_MIN);

$Math::Float128::VERSION = '0.17';

Math::Float128->DynaLoader::bootstrap($Math::Float128::VERSION);

@Math::Float128::EXPORT = ();
@Math::Float128::EXPORT_OK = qw(
    F128_PV_NV_BUG
    flt128_set_prec flt128_get_prec InfF128 NaNF128 ZeroF128 UnityF128 is_NaNF128
    is_InfF128 is_InfF128 is_ZeroF128 STRtoF128 NVtoF128 IVtoF128 UVtoF128 F128toSTR
    F128toSTRP F128toF128 F128toNV
    FLT128_DIG FLT128_MANT_DIG FLT128_MIN_EXP FLT128_MAX_EXP FLT128_MIN_10_EXP FLT128_MAX_10_EXP
    M_Eq M_LOG2Eq M_LOG10Eq M_LN2q M_LN10q M_PIq M_PI_2q M_PI_4q M_1_PIq M_2_PIq
    M_2_SQRTPIq M_SQRT2q M_SQRT1_2q
    FLT128_MAX FLT128_MIN FLT128_EPSILON FLT128_DENORM_MIN
    cmp2NV f128_bytes
    acos_F128 acosh_F128 asin_F128 asinh_F128 atan_F128 atanh_F128 atan2_F128 cbrt_F128 ceil_F128
    copysign_F128 cosh_F128 cos_F128 erf_F128 erfc_F128 exp_F128 expm1_F128 fabs_F128 fdim_F128
    finite_F128 floor_F128 fma_F128 fmax_F128 fmin_F128 fmod_F128 frexp_F128 hypot_F128 isinf_F128
    ilogb_F128 isnan_F128 j0_F128 j1_F128 jn_F128 ldexp_F128 lgamma_F128 llrint_F128 llround_F128
    log_F128 log10_F128 log2_F128 log1p_F128 lrint_F128 lround_F128 modf_F128 nan_F128
    nearbyint_F128 nextafter_F128 pow_F128 remainder_F128 remquo_F128 rint_F128 round_F128
    scalbln_F128 scalbn_F128 signbit_F128 sincos_F128 sinh_F128 sin_F128 sqrt_F128 tan_F128
    tanh_F128 tgamma_F128 trunc_F128 y0_F128 y1_F128 yn_F128
    fromSTR fromNV fromIV fromUV fromF128
    );

%Math::Float128::EXPORT_TAGS = (all => [qw(
    F128_PV_NV_BUG
    flt128_set_prec flt128_get_prec InfF128 NaNF128 ZeroF128 UnityF128 is_NaNF128
    is_InfF128 is_InfF128 is_ZeroF128 STRtoF128 NVtoF128 IVtoF128 UVtoF128 F128toSTR
    F128toSTRP F128toF128 F128toNV
    FLT128_DIG FLT128_MANT_DIG FLT128_MIN_EXP FLT128_MAX_EXP FLT128_MIN_10_EXP FLT128_MAX_10_EXP
    M_Eq M_LOG2Eq M_LOG10Eq M_LN2q M_LN10q M_PIq M_PI_2q M_PI_4q M_1_PIq M_2_PIq
    M_2_SQRTPIq M_SQRT2q M_SQRT1_2q
    FLT128_MAX FLT128_MIN FLT128_EPSILON FLT128_DENORM_MIN
    cmp2NV f128_bytes
    acos_F128 acosh_F128 asin_F128 asinh_F128 atan_F128 atanh_F128 atan2_F128 cbrt_F128 ceil_F128
    copysign_F128 cosh_F128 cos_F128 erf_F128 erfc_F128 exp_F128 expm1_F128 fabs_F128 fdim_F128
    finite_F128 floor_F128 fma_F128 fmax_F128 fmin_F128 fmod_F128 frexp_F128 hypot_F128 isinf_F128
    ilogb_F128 isnan_F128 j0_F128 j1_F128 jn_F128 ldexp_F128 lgamma_F128 llrint_F128 llround_F128
    log_F128 log10_F128 log2_F128 log1p_F128 lrint_F128 lround_F128 modf_F128 nan_F128
    nearbyint_F128 nextafter_F128 pow_F128 remainder_F128 remquo_F128 rint_F128 round_F128
    scalbln_F128 scalbn_F128 signbit_F128 sincos_F128 sinh_F128 sin_F128 sqrt_F128 tan_F128
    tanh_F128 tgamma_F128 trunc_F128 y0_F128 y1_F128 yn_F128
    fromSTR fromNV fromIV fromUV fromF128
    )]);

$Math::Float128::NOK_POK = 0; # Set to 1 to allow warnings in new() and overloaded operations when
                              # a scalar that has set both NOK (NV) and POK (PV) flags is encountered

sub dl_load_flags {0} # Prevent DynaLoader from complaining and croaking

sub _overload_string {

    if(is_ZeroF128($_[0])) {
      return '-0' if is_ZeroF128($_[0]) < 0;
      return '0';
    }

    if(is_NaNF128($_[0])) {return 'NaN'}

    my $inf = is_InfF128($_[0]);
    return '-Inf' if $inf < 0;
    return 'Inf'  if $inf > 0;

    my @p = split /e/i, F128toSTR($_[0]);
    while(substr($p[0], -1, 1) eq '0' && substr($p[0], -2, 1) ne '.') {
      chop $p[0];
    }
    return $p[0] . 'e' . $p[1];
}

sub new {

    # This function caters for 2 possibilities:
    # 1) that 'new' has been called as a method - in which
    #    case there will be a maximum of 2 args
    # 2) that 'new' has been called as a function - in
    #    which case there will be a maximum of 1 arg.
    # If there are no args, then we just want to return a
    # Math::Float128 object that's a NaN.

    if(!@_) {return NaNF128()}

    if(@_ > 2) {die "More than 2 arguments supplied to new()"}

    # If 'new' has been called OOP style, the first arg is the string
    # "Math::Float128" which we don't need - so let's remove it. However,
    # if the first arg is a Math::Float128 object (which is a possibility),
    # then we'll get a fatal error when we check it for equivalence to
    # the string "Math::Float128". So we first need to check that it's
    # not an object - which we'll do by using the ref() function:
    if(!ref($_[0]) && $_[0] eq "Math::Float128") {
      shift;
      if(!@_) {return NaNF128()}
      }

    if(@_ > 1) {die "Too many arguments supplied to new() - expected no more than 1"}

    my $arg = shift; # At this point, an infnan might acquire a POK flag - thus
                     # assigning to $type a value of 4, instead of 3. Such behaviour also
                     # turns $arg into a PV and NV dualvar. It's a fairly inconsequential
                     # bug - https://github.com/Perl/perl5/issues/19550.
                     # I could workaround this by simply not shifting and re-assigning, but
                     # I'll leave it as it is - otherwise there's nothing to mark that this
                     # minor issue (which might also show up in user code) ever existed.
    my $type = _itsa($arg);

    return UVtoF128 ($arg) if $type == 1; #UV
    return IVtoF128 ($arg) if $type == 2; #IV

    if($type == 4) { #PV
      if(_SvNOK($arg)) {
        set_nok_pok(nok_pokflag() + 1);
        if($Math::Float128::NOK_POK) {
          warn "Scalar passed to new() is both NV and PV. Using PV (string) value";
        }
      }
      return STRtoF128($arg);
    }

    if($type == 3) {                      # NV

      if(F128_PV_NV_BUG) {
        if(_SvPOK($arg)) {
          set_nok_pok(nok_pokflag() + 1);
          if($Math::Float128::NOK_POK) {
            warn "Scalar passed to new() is both NV and PV. Using NV (numeric) value";
          }
        }
      }

      if($arg == 0) {return NVtoF128($arg)}
      if($arg != $arg) { return NaNF128()}
      if(($arg / $arg) != 1) { # Inf
        if($arg < 0) {return InfF128(-1)}
        return InfF128(1);
      }
      return NVtoF128($arg);
    }

    if($type == 113) { # Math::Float128
      return F128toF128($arg);
    }

    die "Bad argument given to new";
}


sub f128_bytes {
  my @ret = _f128_bytes($_[0]);
  return join '', @ret;
}

sub FLT128_DIG        () {return _FLT128_DIG()}
sub FLT128_MAX        () {return _FLT128_MAX()}
sub FLT128_MIN        () {return _FLT128_MIN()}
sub FLT128_EPSILON    () {return _FLT128_EPSILON()}
sub FLT128_DENORM_MIN () {return _FLT128_DENORM_MIN()}
sub FLT128_MANT_DIG   () {return _FLT128_MANT_DIG()}
sub FLT128_MIN_EXP    () {return _FLT128_MIN_EXP()}
sub FLT128_MAX_EXP    () {return _FLT128_MAX_EXP()}
sub FLT128_MIN_10_EXP () {return _FLT128_MIN_10_EXP()}
sub FLT128_MAX_10_EXP () {return _FLT128_MAX_10_EXP()}
sub M_Eq              () {return _M_Eq()}
sub M_LOG2Eq          () {return _M_LOG2Eq()}
sub M_LOG10Eq         () {return _M_LOG10Eq()}
sub M_LN2q            () {return _M_LN2q()}
sub M_LN10q           () {return _M_LN10q()}
sub M_PIq             () {return _M_PIq()}
sub M_PI_2q           () {return _M_PI_2q()}
sub M_PI_4q           () {return _M_PI_4q()}
sub M_1_PIq           () {return _M_1_PIq()}
sub M_2_PIq           () {return _M_2_PIq()}
sub M_2_SQRTPIq       () {return _M_2_SQRTPIq()}
sub M_SQRT2q          () {return _M_SQRT2q()}
sub M_SQRT1_2q        () {return _M_SQRT1_2q()}

1;

