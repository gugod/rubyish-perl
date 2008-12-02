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


=cut

def at($index) {
    @{$self}[$index];
};

1;
