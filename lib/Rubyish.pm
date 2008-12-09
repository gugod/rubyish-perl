package Rubyish;
our $VERSION = "0.21";

use strict;
use warnings;

my @SPECIAL_WORD = qw(def);

sub import {
    my ($class, @args) = @_;
    my $caller = caller;
    if($caller eq "main") {
        eval qq{
                package $caller;
                use Rubyish::Kernel;
               };
    }
    else {
        eval qq{
                package $caller; 
                use base 'Rubyish::Object';
                use Rubyish::Attribute;
               };
    }
    eval qq{
            package $caller;
            use Rubyish::Syntax::def;
            use Rubyish::Syntax::nil;
            use Rubyish::String;
            use Rubyish::Array;
            use Rubyish::Hash;
           };
};

1;

=head1 NAME

Rubyish - Perl programming, the rubyish way.

=head1 SYNOPSIS

    # Define a Cat class;
    package Cat;
    use Rubyish;

    attr_accessor "name", "color";

    def sound { "meow, meow" }

    def speak {
        print "A cat goes " . $self->sound . "\n";
    }

    ###
    package main;

    my $pet = Cat->new->name("oreo");
    $cat->speak; #=> "A cat goes meow, meow"
    $cat->name;  #=> "oreo"

=head1 DESCRIPTION

So far it does not do many but just like synopsis depicted. You can
use C<def> to define instance methods of your classes.

All thing in Rubyish is object, and all methods should return object, but something is exceptive.
Following is some methods return primitive datatype:

Object#inspect #=> string, and all your #inspect should return string.

=head1 AUTHOR

Kang-min Liu  C<< <gugod@gugod.org> >>

shelling C<shelling@cpan.org>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Kang-min Liu C<< <gugod@gugod.org> >>.

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

