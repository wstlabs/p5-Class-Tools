use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Class::Tools',
    AUTHOR              => q{highlinelabs <nobody@null.org>},
    VERSION_FROM        => 'lib/Class/Tools.pm',
    ABSTRACT_FROM       => 'lib/Class/Tools.pm',
    ($ExtTools::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Exporter::Tidy' => '0.07',
        'Module::Load'   => '0.12',
        'Test::More'     => '0.96',
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Class-Tools-*' },
);
