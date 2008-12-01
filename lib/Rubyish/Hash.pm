package Rubyish::Hash;

use base qw(Rubyish::Object); # inherit parent
use base qw(Rubyish::Kernel); # import module
use Data::Dumper

sub new {
    my $self = ref($_[1]) == "Hash" ? $_[1] : {};
    bless $self, $_[0];
}

sub inspect {
    Dumper($_[0])
}

1;
