package Rubyish::Hash;

use base qw(Rubyish::Object); # inherit parent
use base qw(Rubyish::Kernel); # import module
use Data::Dumper;

sub new {
    my $self = ref($_[1]) == "HASH" ? $_[1] : {};
    bless $self, $_[0];
}

sub inspect {
    my ($self) = @_;
    my $result;
    while ( my ($key, $value) = each %{$self} ) {
        $result .= "$key => $value, ";
    }
    "{ " . $result . "}";
}

sub fetch {
    my ($self, $key) = @_;
    $self->{$key}
}

sub each {
    my ($self, $sub) = @_;
    %result = %{$self};
    while ( my ($key, $value) = each %result ) { 
        $sub->($key,$value)
    }
    bless \%result, ref($self);
};
{ no strict; *map = *each; }

1;
