=head1 NAME

Rubyish::Array - Array object acts as ruby

=cut

package Rubyish::Array;
use strict;

use base qw(Rubyish::Object); # inherit parent
use base qw(Rubyish::Kernel); # import module
use Rubyish::Syntax::def;

use Data::Dumper;

=head1 FUNCTIONS

=head2 new

=cut

sub new {
    my $self = ref($_[1]) == "ARRAY" ? $_[1] : [];
    bless $self, $_[0];
}

=head2 inspect



=cut

sub inspect {
    my $result = join '", "', @{$_[0]};
    '["' . $result . '"]';
}

=head2 at()
=head2 []

Get value at given index.

    $array = Array([(0..5)])
    $array->at(2)   #=> 2
    $array->[2]     #=> 2

=cut

def at($index) { $self->[$index] };

=head2 size()
=head2 length()

Return length of Array object.

    $array = Array([(0..5)])
    $array->length  #=> 6

=cut

def size() { scalar @{$self} };
{ no strict; *length = *size }

def join($sep) {
    $sep = $, unless defined $sep;
    return CORE::join($sep, @{$self})
};

def clear {
    delete @$self[0..$#$self];
    $self;
}

;
