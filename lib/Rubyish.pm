package Rubyish;

use strict;
use warnings;

use base 'Devel::Declare::MethodInstaller::Simple';

use Rubyish::Class;

sub import {
    my $class = shift;
    my $caller = caller;

    my $arg = shift;

    $class->install_methodhandler(
        into            => $caller,
        name            => 'def',
    );

    {
        no strict;
        @{$caller . "::ISA"} = qw( Rubyish::Class );
        Rubyish::Class::_export_class_methods($caller);
    }
}

sub parse_proto {
    my $ctx = shift;
    my $inject = 'my ($self, @args) = @_;';
    return $inject;
}

1;

