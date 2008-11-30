package Rubyish::Syntax::class;

use strict;
use warnings;

use base 'Devel::Declare::MethodInstaller::Simple';

sub import {
    my $class = shift;
    my $caller = caller;

    $class->install_methodhandler(
        into            => $caller,
        name            => 'class',
    );
}

sub parse_proto {
    my $ctx = shift;
    my ($proto) = @_;
    print "class: $proto\n";
    # my $inject = 'my ($self, @args) = @_;';
    return '';
}

1;

