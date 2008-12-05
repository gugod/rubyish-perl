=head1 NAME

Rubyish::Array - Array object acts as ruby

=cut

package Rubyish::Array;
use strict;
use 5.010;

use base qw(Rubyish::Object); # inherit parent
use Rubyish::Syntax::def;

=head1 FUNCTIONS

=head2 new

Not Documented

=cut

sub new {
    my $self = ref($_[1]) eq "ARRAY" ? $_[1] : [];
    bless $self, $_[0];
    $self->each(sub {
        my $i = shift;
        given ($i) {
            when ($_ =~ "HASH")  { $_ = Rubyish::Kernel::Hash($_)   }
            when ($_ =~ "ARRAY") { $_ = Rubyish::Kernel::Array($_)  }
            default              { $_ = Rubyish::Kernel::String($_) }
        }
    });
    $self;
}

=head2 inspect



=cut

def inspect {
    my @tmp = map {$_ =~ /Rubyish/ ? $_->inspect : $_} @{$self};
    my $result = join ', ', @tmp;
    '[' . $result . ']';
};

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
    $array->size    #=> 6

=cut

def size { 
    scalar @{$self};
};
{ no strict; *length = *size; }

def join($sep) {
    $sep = $, unless defined $sep;
    return CORE::join($sep, @{$self})
};

def clear {
    delete @$self[0..$#$self];
    $self;
};

def each($sub) {
    my @tmp_array = @{$self};
    CORE::map { $sub->($_) } @tmp_array;
    $self;
};
{ no strict; *map = *each; }

1;
