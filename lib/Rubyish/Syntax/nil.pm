package Rubyish::Syntax::nil;

use strict;
use Sub::Exporter;
Sub::Exporter::setup_exporter({
    exports => ['nil'],
    groups => {
        default => ['nil']
    }
});

use Rubyish::NilClass;

sub nil { Rubyish::NilClass->new }

1;

