package Rubyish::Array;

use base Rubyish::Object;

sub new {
    my $self = ref($_[1]) ? $_[1] : [];
    bless $self, $_[0];
}

1;
