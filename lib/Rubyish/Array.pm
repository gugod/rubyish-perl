package Rubyish::Array;

use base qw(Rubyish::Object); # inherit parent
use base qw(Rubyish::Kernel); # import module
use Data::Dumper;

sub new {
    my $self = ref($_[1]) == "Array" ? $_[1] : [];
    bless $self, $_[0];
}

sub inspect {
    my $result = join '", "', @{$_[0]};
    '["' . $result . '"]';
}

1;
