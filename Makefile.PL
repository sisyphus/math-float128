use ExtUtils::MakeMaker;
my %options = %{
{
  'NAME' => 'Math::Float128',
  'LIBS' => [
    '-lquadmath -lm'
  ],
  'INC' => '',
  'LICENSE'  => 'perl',
  'VERSION_FROM' => 'Float128.pm',
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
