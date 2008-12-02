package Rubyish::Syntax::def;

use base 'Devel::Declare::MethodInstaller::Simple';

sub import {
    my $class = shift;
    my $caller = caller;

    my $arg = shift;

    $class->install_methodhandler(
        into            => $caller,
        name            => 'def',
    );
}

sub parse_proto {
    my $ctx = shift;
    my ($proto) = @_;
    my $inject = 'my ($self';
    if (defined $proto) {
        $inject .= ", $proto" if length($proto);
        $inject .= ') = @_; ';
    }
    else {
        $inject .= ') = shift;';
    }
    return $inject;
}

1;

