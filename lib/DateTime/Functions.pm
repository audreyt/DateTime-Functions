# $File: //member/autrijus/DateTime-Functions/lib/DateTime/Functions.pm $ $Author: autrijus $
# $Revision: #1 $ $Change: 8643 $ $DateTime: 2003/11/01 06:14:05 $

package DateTime::Functions;
$DateTime::Functions::VERSION = '0.01';

use strict;
use base 'Exporter';
use vars '@EXPORT';
use DateTime;
use Exporter;

@EXPORT = qw(
    datetime from_epoch now today from_object
    last_day_of_month from_day_of_year default_locale
    compare compare_ignore_floating duration
);

=head1 NAME

DateTime::Functions - Procedural interface to DateTime functions

=head1 VERSION

This document describes version 0.01 of DateTime::Functions, released
October 31, 2003.

=head1 SYNOPSIS

    use DateTime::Functions;
    print today->year;
    print now->strftime("%Y-%m-%d %H:%M:%S");

=head1 DESCRIPTION

This module simply exports all class methods of L<DateTime> into the
caller's namespace.

=head1 METHODS

Unless otherwise noted, all methods correspond to the same-named class
method in L<DateTime>.  Please see L<DateTime> for which parameters are
supported.

=head2 Constructors

All constructors can die when invalid parameters are given.  They all
return C<DateTime> objects, except for C<duration()> which returns
a C<DateTime::Duration> object.

=over 4

=item * datetime( ... )

Equivalent to C<< DateTime->new( ... ) >>.

=item * duration( ... )

Equivalent to C<< DateTime::Duration->new( ... ) >>.

=item * from_epoch( epoch => $epoch, ... )

=item * now( ... )

=item * today( ... )

=item * from_object( object => $object, ... )

=item * last_day_of_month( ... )

=item * from_day_of_year( ... )

=back

=head2 Utility Functions

=over 4

=item * default_locale( $locale )

Equivalent to C<< DateTime->DefaultLocale( $locale ) >>.

=item * compare

=item * compare_ignore_floating

=back

=cut

foreach my $func (@EXPORT) {
    no strict 'refs';
    my $method = $func;
    next if $func eq 'duration';
    $method = 'new' if $func eq 'datetime';
    $method = 'DefaultLocale' if $func eq 'default_locale';
    *$func = sub { DateTime->can($method)->('DateTime', @_) };
}

sub duration {
    require DateTime::Duration;
    return DateTime::Duration->new(@_);
}

1;

=head1 SEE ALSO

L<DateTime>

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2003 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
