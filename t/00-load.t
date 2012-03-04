#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Class::Tools' ) || print "Bail out!
";
}

diag( "Testing Class::Tools $Class::Tools::VERSION, Perl $], $^X" );
