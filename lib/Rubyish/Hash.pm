package Rubyish::Hash;

use base qw(Rubyish::Object); # inherit 
use base qw(Rubyish::Kernel); # import

sub new {
    my $self = ref($_[1]) ? $_[1] : {};
    bless $self, $_[0];
}

1;
