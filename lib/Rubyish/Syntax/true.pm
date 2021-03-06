package Rubyish::Syntax::true;

use strict;
use Sub::Exporter;
Sub::Exporter::setup_exporter({
    exports => ['true'],
    groups => {
        default => ['true']
    }
});

use Rubyish::TrueClass;

sub true { Rubyish::TrueClass->new }

1;

__END__

=head1 NAME

Rubyish::Syntax::true - Gives you a true object.

=head1 SYNOPSIS

    use Rubyish::Syntax::true;

    my $a = true;

=head1 DESCRIPTION

This module exports a C<true> bareword that works almost like Ruby
C<true>. It represents the singleton object of L<Rubyish::TrueClass>.
It means boolean true under boolean context, "true" when stringified.

It also keep the behaviour that true always referes to the same,
singleton object whenever it's used in the program.

=head1 METHODS

The C<true> object has following instance methods:

=over 4

=item to_s

Returns "true"

=back

=head1 SEE ALSO

L<Rubyish::TrueClass> for the implementation of these methods.

=head1 AUTHOR

Kang-min Liu  C<< <gugod@gugod.org> >>, shelling C<shelling@cpan.org>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008,2009, Kang-min Liu C<< <gugod@gugod.org> >>.

This is free software, licensed under:

    The MIT (X11) License

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.


