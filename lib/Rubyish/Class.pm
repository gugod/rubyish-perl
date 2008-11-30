use strict;

package Rubyish::Class;
use base 'Rubyish::Module';

use Rubyish::Attribute ":all";

sub import {
    my $caller = caller;
    __export_class_methods($caller);
}

sub __export_class_methods {
    my ($package) = @_;

    no strict;
    *{$package . "::attr_accessor"} = *{Rubyish::Attribute::attr_accessor};
    *{$package . "::attr_writer"} = *{Rubyish::Attribute::attr_writer};
    *{$package . "::attr_reader"} = *{Rubyish::Attribute::attr_reader};
}

1;

