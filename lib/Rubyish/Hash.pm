package Rubyish::Hash;

use base qw(Rubyish::Object); # inherit parent
use Rubyish::Syntax::def;

sub new {
    my $self = ref($_[1]) == "HASH" ? $_[1] : {};
    bless $self, $_[0];
}

def inspect() {
    my $result;
    while ( my ($key, $value) = each %{$self} ) {
        $result .= "$key => $value, ";
    }
    "{ " . $result . "}";
}

def fetch($key) {
    $self->{$key}
};

def each($sub) {
    %result = %{$self};
    while ( my ($key, $value) = each %result ) { 
        $sub->($key,$value);
    }
    $self;
};
{ no strict; *map = *each; }

1;
