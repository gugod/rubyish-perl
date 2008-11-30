package Rubyish;

use strict;
use warnings;

sub import {
    my ($class, @args) = @_;
    my $caller = caller;
    eval qq{package $caller; use base 'Rubyish::Class'; use Rubyish::Syntax::def;};
};

1;

