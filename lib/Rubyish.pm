package Rubyish;

use strict;
use warnings;

sub import {
    my ($class, @args) = @_;
    my $caller = caller;
    if($caller eq "main") {
        eval qq{package $caller; use Rubyish::Syntax::def;};
    }
    else {
        eval qq{package $caller; use base 'Rubyish::Class'; use Rubyish::Attribute; use Rubyish::Syntax::def;};
    }
};

1;

