# grab-bag of package/class/meta-programming functions.  some of these
# have fine implementations elsewhere, but I've decided to redo them for 
# various reasons:  comleteness, simplicity, warnings safety, etc.
package Class::Tools;
use warnings;
use strict;
use Carp;
use Scalar::Util qw( reftype );
use Exporter::Tidy
    -default => [qw|
        is_loaded
        is_valid_class_name
        find_parent_classes 
    |]
;

our $VERSION = '0.001';

#
# similar to Class::MOP::is_class_loaded, but a bit simpler 
sub is_loaded  {
    my $class = shift // return '';
    no strict 'refs';
    scalar keys %{"$class\::"} ? 1 : '' 
}

sub is_valid_class_name {
    my $class = shift;
    defined $class && $class =~ m{\A \w+(?:::\w+)* \z}xms
}


# simply returns the upward inheritance stack of a given package.
# linear inheritance only, please.
# XXX won't detect errant, circular ISA configurations -- and will blindly 
# descend into an infinite loop, if you try
sub find_parent_classes  {
    my $pkg = shift;
    confess "need a package name" unless defined $pkg;
    no strict 'refs';
    my @isa = @{"$pkg\::ISA"};
    my $parent = @isa <= 1 ? $isa[0] : 
        confess "not implemented for diamond inheritance";
    defined $parent ?
        ( $parent, find_parent_classes($parent) ) :
    ()
}

__END__


=head1 NAME

Class::Tools - grab bag of metaprogramming functions 

=head1 VERSION

=cut


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Class::Tools;

    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

highlinelabs, C<< <nobody at null dot org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-class-utils at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Class-Tools>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Class::Tools


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Class-Tools>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Class-Tools>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Class-Tools>

=item * Search CPAN

L<http://search.cpan.org/dist/Class-Tools/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 highlinelabs 

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Class::Tools
