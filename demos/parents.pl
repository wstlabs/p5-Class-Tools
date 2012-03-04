package Foo;
our $VERSION = 667;
sub new {
    bless {}, shift
}

package Foo::Bar;
use base 'Foo';
our $VERSION = 666;

package Foo::Bar::Gleep;
use base 'Foo::Bar';
our $VERSION = 669;




package main;
use strict;
use warnings;
use Class::Tools qw( :all );
use Log::Inline;

our $DEBUG = 1;

my $gleep = Foo::Bar::Gleep->new;
my @parents = find_parent_classes(ref $gleep);
trace "parents ($gleep) = ",\@parents;

my $foo = Foo->new; 
@parents = find_parent_classes(ref $foo);
trace "parents ($foo) = ",\@parents;


