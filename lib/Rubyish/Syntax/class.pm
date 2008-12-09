package main;
use strict;
sub class { $_[0]->(); }

use Devel::Declare;
use Devel::Declare 'class' => [
    DECLARE_PACKAGE,
    sub {
        my ($usepack, $use, $inpack, $name, $proto, $is_block) = @_;
        return (sub (&) { shift; }, undef, "package ${name}; use Rubyish;");
    }
];

package Rubyish::Syntax::class;

1;

