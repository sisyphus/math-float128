use ExtUtils::MakeMaker;
use Config;

# Attempt to avoid the incorrect 'FAIL' reports from Chris Williams' broken NetBSD smoker(s).
# Comment out the 'exit 0;' (26 lines further down) if this causes problems.

if($Config{osname} eq 'netbsd') {

  my($inc, $cc) = ('', undef);

  if(@ARGV) {
    for my $arg(@ARGV) {
      $inc = (split /=/, $arg)[1] if $arg =~ /^inc=/i;
      $cc = (split /=/, $arg)[1] if $arg =~ /^cc=/i;
    }
  }

  $inc =~ s/'//g;
  $inc =~ s/"//g;

  unless(defined($cc)) {
    $cc = defined($Config{cc}) ? $Config{cc} : 'cc';
  }

  my $opt = $Config{optimize};

  my $out = `$cc $opt $inc $Config{ccflags} -o quad.exe -x c quad.in 2>&1`;

  if($out =~ /quadmath\.h: No such file or directory/i) {
    print "Aborting: Got\n$out\n";
    exit 0;
  }
}

my $defines = $] < 5.008 ? "-DOLDPERL" : "-DNEWPERL";

$defines .= $Config{byteorder} =~ /^1234/ ? " -DWE_HAVE_LENDIAN" : " -DWE_HAVE_BENDIAN";

$defines .= " -DLONGLONG2IV_IS_OK"
  if $Config{ivsize} >= $Config{longlongsize};

$defines .= " -DLONG2IV_IS_OK"
  if $Config{ivsize} >= $Config{longsize};

my %options = %{
{
  NAME => 'Math::Float128',
  DEFINE => $defines,
  LIBS => [
    '-lquadmath -lm'
  ],
  INC => '',
  LICENSE  => 'perl',
  VERSION_FROM => 'Float128.pm',
  clean   => { FILES => 'quad.exe' },
  META_MERGE => {
   'meta-spec' => { version => 2 },
    resources => {
      repository => {
        type => 'git',
        url => 'https://github.com/sisyphus/math-float128.git',
        web => 'https://github.com/sisyphus/math-float128',
      },
    },
  },
}
};
WriteMakefile(%options);

# Remove the Makefile dependency. Causes problems on a few systems.
sub MY::makefile { '' }
